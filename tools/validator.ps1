# validator.ps1 - cangjie quality-redline structural validator
# Usage: powershell -File tools\validator.ps1 [-RepoRoot <path>] [-Scope all|new15]
param(
    [string]$RepoRoot = (Split-Path -Parent $PSScriptRoot),
    [ValidateSet('all', 'new15')][string]$Scope = 'new15'
)

$ErrorActionPreference = 'Stop'
$new15 = @(
    'editorial-art-agent', 'data-viz-agent', 'ui-design-agent', 'research-methodology-agent',
    'ppt-deck-agent', 'html-doc-agent', 'visual-media-agent', 'seo-content-agent',
    'career-monetize-agent', 'data-extraction-agent', 'agent-memory-agent', 'agent-harness-agent',
    'recording-agent', 'security-privacy-agent', 'quant-prediction-agent'
)

$agentDirs = Get-ChildItem -LiteralPath $RepoRoot -Directory |
    Where-Object { $_.Name -like '*-agent' -and (Test-Path (Join-Path $_.FullName 'skills')) }
if ($Scope -eq 'new15') { $agentDirs = $agentDirs | Where-Object { $new15 -contains $_.Name } }

$total = 0
$failed = 0
$failLines = New-Object System.Collections.Generic.List[string]
$report = New-Object System.Collections.Generic.List[string]
$stamp = Get-Date -Format 'yyyy-MM-dd HH:mm'
$report.Add('cangjie validator report ' + $stamp + ' scope=' + $Scope)
$report.Add('------------------------------------------------------------')

function Add-Check([string]$label, [string]$checkName, [bool]$pass) {
    $script:total++
    if (-not $pass) {
        $script:failed++
        $script:failLines.Add($label + ' :: FAIL ' + $checkName)
        $script:report.Add($label + ' :: FAIL ' + $checkName)
    }
}

foreach ($agent in $agentDirs) {
    $skillDirs = Get-ChildItem -LiteralPath (Join-Path $agent.FullName 'skills') -Directory -ErrorAction SilentlyContinue |
        Where-Object { Test-Path (Join-Path $_.FullName 'SKILL.md') }
    foreach ($sd in $skillDirs) {
        $slug = $sd.Name
        $label = $agent.Name + '/' + $slug

        # ---------- SKILL.md ----------
        $md = Get-Content (Join-Path $sd.FullName 'SKILL.md') -Raw -Encoding UTF8
        $lineCount = ($md -split "`n").Count
        Add-Check $label ('sk-lines>=70(actual=' + $lineCount + ')') ($lineCount -ge 70)

        $fmName = [regex]::Match($md, '(?m)^name:\s*(\S+)').Groups[1].Value
        Add-Check $label 'frontmatter-name-equals-folder' ($fmName -eq $slug)

        $descM = [regex]::Match($md, '(?ms)^description:\s*\|\r?\n(.*?)(?=\r?\n[a-zA-Z_-]+:)').Groups[1].Value
        if (-not $descM) { $descM = [regex]::Match($md, '(?m)^description:\s*(.+)$').Groups[1].Value }
        Add-Check $label ('description-has-trigger(len=' + $descM.Trim().Length + ')') ($descM.Trim().Length -ge 40)

        Add-Check $label 'source-project-present' ([regex]::Match($md, '(?m)^source_project:\s*\S+').Success)

        # six RIA++ sections (tolerate - | ( （ — – · • ： separators and bare headers)
        $secRx = @{
            'R-section'  = '(?im)^#{1,3}\s*R\s*([-|(（\u2012-\u2015\u00B7\u2022：]|$)'
            'I-section'  = '(?im)^#{1,3}\s*I\s*([-|(（\u2012-\u2015\u00B7\u2022：]|$)'
            'A1-section' = '(?im)^#{1,3}\s*A1?\s*([-|(（\u2012-\u2015\u00B7\u2022：:]|$)'
            'A2-section' = '(?im)^#{1,3}\s*A2\s*([-|(（\u2012-\u2015\u00B7\u2022：:★]|$)'
            'E-section'  = '(?im)^#{1,3}\s*E\s*([-|(（\u2012-\u2015\u00B7\u2022：]|$)'
            'B-section'  = '(?im)^#{1,3}\s*B\s*([-|(（\u2012-\u2015\u00B7\u2022：]|$)'
        }
        foreach ($k in $secRx.Keys) {
            Add-Check $label $k ([regex]::Match($md, $secRx[$k]).Success)
        }

        # E section carries completion criteria (>=2)
        $eMatch = [regex]::Match($md, '(?im)^#{1,3}\s*E\s')
        $critCount = 0
        if ($eMatch.Success) {
            $tail = $md.Substring($eMatch.Index)
            $bMatch = [regex]::Match($tail, '(?im)^#{1,3}\s*B\s')
            $eBody = if ($bMatch.Success) { $tail.Substring(0, $bMatch.Index) } else { $tail }
            $critCount = [regex]::Matches($eBody, '完成标准|完成判据|Done when').Count
        }
        Add-Check $label ('e-completion-criteria>=2(actual=' + $critCount + ')') ($critCount -ge 2)

        Add-Check $label 'no-placeholders' (-not [regex]::IsMatch($md, 'TODO|FIXME|待填充|待补充|TBD|PLACEHOLDER'))

        # ---------- test-prompts.json ----------
        $tjPath = Join-Path $sd.FullName 'test-prompts.json'
        $tj = $null
        try { $tj = Get-Content $tjPath -Raw -Encoding UTF8 | ConvertFrom-Json } catch { }
        Add-Check $label 'test-prompts-valid-json' ($null -ne $tj)
        if ($tj) {
            $cases = @()
            if ($null -ne $tj.test_cases) { $cases = @($tj.test_cases) }
            elseif ($null -ne $tj.tests) { $cases = @($tj.tests) }
            Add-Check $label ('cases-count-5..10(actual=' + $cases.Count + ')') (($cases.Count -ge 5) -and ($cases.Count -le 10))

            $hasTrig = $false; $hasBait = $false; $hasEdge = $false; $crossBait = $false; $fieldsOk = $true
            $siblings = @($skillDirs | Where-Object { $_.Name -ne $slug } | ForEach-Object { $_.Name })
            foreach ($c in $cases) {
                # type/category 分别判定，避免拼接子串误匹配
                $tv = ('' + $c.type + ' ' + $c.category).ToLower()
                $isBait = $tv -match 'should_not|not_trigger|bait'
                if ($isBait) { $hasBait = $true }
                elseif ($tv -match 'trigger') { $hasTrig = $true }
                if ($tv -match 'edge') { $hasEdge = $true }
                if ($isBait) {
                    $cTxt = '' + $c.expected_behavior + ' ' + $c.reason + ' ' + $c.notes
                    foreach ($sib in $siblings) { if ($cTxt.Contains($sib)) { $crossBait = $true } }
                }
                if ([string]::IsNullOrWhiteSpace('' + $c.id) -or [string]::IsNullOrWhiteSpace('' + $c.prompt)) { $fieldsOk = $false }
                if ([string]::IsNullOrWhiteSpace('' + $c.expected_behavior) -and [string]::IsNullOrWhiteSpace('' + $c.expected_skill)) { $fieldsOk = $false }
            }
            Add-Check $label 'case-type-should_trigger' $hasTrig
            Add-Check $label 'case-type-should_not_trigger-bait' $hasBait
            Add-Check $label 'case-type-edge_case' $hasEdge
            Add-Check $label 'cross-skill-confusion-bait' $crossBait
            Add-Check $label 'case-fields-complete' $fieldsOk

            $mpr = $tj.minimum_pass_rate
            if ($null -ne $mpr) { Add-Check $label 'minimum_pass_rate>=0.95' ([double]$mpr -ge 0.95) }
        }

        # ---------- test-results.md ----------
        $trPath = Join-Path $sd.FullName 'test-results.md'
        Add-Check $label 'test-results.md-exists' (Test-Path $trPath)
    }
}

$report.Add('------------------------------------------------------------')
$rate = 0
if ($total -gt 0) { $rate = [math]::Round(100.0 * ($total - $failed) / $total, 1) }
$summary = 'TOTAL CHECKS: ' + $total + '  FAILED: ' + $failed + '  PASS-RATE: ' + $rate + '%'
$report.Add($summary)
Write-Output $summary
if ($failLines.Count -gt 0) {
    Write-Output '--- failures ---'
    $failLines | ForEach-Object { Write-Output $_ }
}
$outFile = Join-Path $PSScriptRoot 'validation-report.txt'
$report | Set-Content -LiteralPath $outFile -Encoding UTF8
Write-Output 'full report -> ' + $outFile
if ($failed -gt 0) { exit 1 } else { exit 0 }
