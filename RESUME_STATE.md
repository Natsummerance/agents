# RESUME_STATE — 新15个agent空壳填充工程（cangjie RIA-TV++）

> 断点续跑文件。恢复工作时先读本文件 + tools/validation-report.txt。

## 验收标准（不可妥协）
- `powershell -File tools\validator.ps1 -RepoRoot . -Scope new15` 全绿（0 FAIL）
- 每个 skill：SKILL.md ≥70 行、六段 RIA++ 结构、E 段每步带"完成标准:"、test-prompts.json 5~10 条含三类用例+跨技能诱饵+minimum_pass_rate 0.95、test-results.md 推演表全 PASS
- 最终整体通过率 ≥95%（validator 口径）

## 黄金样例（新 skill 照抄这个模式）
- `ppt-deck-agent/skills/guizang-web-deck/`（SKILL.md 96 行 / 7 用例 / 推演全过）
- `ppt-deck-agent/skills/ppt-master-native/`

## 已完成
- [x] tools/validator.ps1 校验器（TDD 接缝；注意 PS5.1 需要 UTF-8 BOM，改动后执行：
      `[IO.File]::WriteAllText($p,(ReadAllText UTF8),(New-Object Text.UTF8Encoding $true))`）
- [x] ppt-deck-agent 全部 2 个 skill 填充完成且验证零失败
- [x] ui-design-agent/design-system-generator 完成（SKILL.md 由中断子代理产出84行，test-prompts/test-results 已补齐对齐）
- [x] 上游仓库浅克隆 20/37 → D:\outcome\self\upstream\<owner>__<repo>

## 待办（按 agent 分组，括号内为上游 owner/repo；"本地✓"表示已在 upstream/ 有克隆）

- [ ] data-viz-agent: lieflat-charts(larashero3-dotcom/lieflat-charts 本地✓), scientific-figures(ChenLiu-1996/figures4papers 本地✓)
- [ ] html-doc-agent: agentic-html-editor(nexu-io/html-anything ✓), markdown-preview-enhanced(shd101wyy/markdown-preview-enhanced ✓)
- [ ] ui-design-agent: banner-design(nextlevelbuilder/ui-ux-pro-max-skill ✓ 同源，与已完成 design-system-generator 互设诱饵)
- [ ] recording-agent: screen-demo-recorder(webadderallorg/Recordly 缺→fetch), rrweb-session-recording(rrweb-io/rrweb 缺→fetch)
- [ ] research-methodology-agent: arxiv-first-coding(UditAkhourii/neuroarxiv ✓), advise-project-approach(AaravKashyap12/advise-project-approach ✓), academic-humanizer(AIScientists-Dev/academic-humanizer ✓；B段必须写AI披露合规红线)
- [ ] seo-content-agent: seo-audit(every-app/open-seo ✓), geo-search-optimize(zubair-trabzada/geo-seo-claude ✓), schema-markup(AgriciDaniel/claude-seo 缺), blog-writing-contract(AgriciDaniel/claude-blog 缺)；四角分工互设诱饵
- [ ] career-monetize-agent: ai-job-search-framework(MadsLorentzen/ai-job-search ✓), ai-money-handbook(XiaomingX/ai-money-maker-handbook 缺；B段写收益不承诺+拒绝灰产)
- [ ] visual-media-agent: ai-short-video(harry0703/MoneyPrinterTurbo ✓；B段写AIGC标识义务), gpt-image-prompting(freestylefly/awesome-gpt-image-2 ✓)
- [ ] data-extraction-agent: crawl4ai-scraping(unclecode/crawl4ai 缺), odl-pdf-extraction(opendataloader-project/opendataloader-pdf 缺), scrapling-stealth(D4Vinci/Scrapling 缺)；B段写robots/ToS/频率/付费墙红线
- [ ] agent-memory-agent: mem0-memory-layer(mem0ai/mem0 缺), hindsight-retrieval(vectorize-io/hindsight 缺), agent-experience-persistence(TencentCloud/TencentDB-Agent-Memory 缺), project-knowledge-graph(Graphify-Labs/graphify 缺)
- [ ] agent-harness-agent: ecc-harness-os(affaan-m/ECC 缺), multi-agent-office(chaitanyagiri/munder-difflin 缺)
- [ ] security-privacy-agent: platform-scan(arxhr007/Aliens_eye 缺；仅限自查/授权评估，edge考人肉拒绝), watermark-removal(guillaumemeyer/watermarks-remover 缺；仅限自有内容隐私清理，禁洗稿/伪装人类创作，edge考投稿伪装拒绝)
- [ ] quant-prediction-agent: strategy-backtest-execution(OpenByteInc/QuantDinger 缺), multi-agent-simulation(666ghj/MiroFish 缺)；B段写非投资建议+过拟合风险
- [ ] editorial-art-agent 增强: 4个skill已30~48行，扩到≥70行补E完成标准/A2信号/B边界/四角区分(上游均本地✓)

fetch 兜底顺序: raw.githubusercontent.com/<owner>/<repo>/HEAD/README.md → /main/README.md → webfetch github.com/<owner>/<repo> 页面。材料不足时在审计信息如实标注。

## 收尾
- [ ] validator 全绿后更新根 README 的 skills 计数与质量声明
- [ ] git commit（当前分支 main，勿 push）
