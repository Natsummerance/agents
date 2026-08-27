# triage — Test Results

**Run date**: 2026-08-26  
**Test file**: test-prompts.json (7 cases)  
**Minimum pass rate**: 0.95  
**Result**: **PASS** — 7/7 passed (100%)

## Case Results

| Case ID | User Input | Expected Trigger | Actual Trigger | Pass |
|---------|------------|------------------|----------------|------|
| triage-01 | "Triage the incoming issues in the backlog." | triage | triage | ✅ |
| triage-02 | "Show me what needs my attention in the issue tracker." | triage | triage | ✅ |
| triage-03 | "Move issue #42 to ready-for-agent." | triage | triage | ✅ |
| triage-04 | "Review this code diff for quality issues." | code-review | code-review | ✅ |
| triage-05 | "This bug is hard to reproduce. Help me diagnose it." | diagnosing-bugs | diagnosing-bugs | ✅ |
| triage-06 | "Break this feature into tickets." | to-tickets | to-tickets | ✅ |
| triage-07 | "This issue is already implemented. Close it as wontfix." | triage | triage | ✅ |

## Negative Trigger Checks

All `should_not_trigger` skills correctly did not fire in each case.

## Edge Case Handling

- Case 07 (wontfix decision): Correctly triggers triage for closing with reason and pointer.

## Replay Record

- 2026-08-26: Initial distillation run — all 7 cases PASS
- No retries needed
