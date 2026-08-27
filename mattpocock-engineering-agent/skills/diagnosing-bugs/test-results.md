# diagnosing-bugs — Test Results

**Run date**: 2026-08-26  
**Test file**: test-prompts.json (7 cases)  
**Minimum pass rate**: 0.95  
**Result**: **PASS** — 7/7 passed (100%)

## Case Results

| Case ID | User Input | Expected Trigger | Actual Trigger | Pass |
|---------|------------|------------------|----------------|------|
| diagnosing-01 | "This test is flaky on CI. Help me debug it." | diagnosing-bugs | diagnosing-bugs | ✅ |
| diagnosing-02 | "The API is 3x slower after the deploy. Diagnose the regression." | diagnosing-bugs | diagnosing-bugs | ✅ |
| diagnosing-03 | "This bug works locally but fails in production. What's going on?" | diagnosing-bugs | diagnosing-bugs | ✅ |
| diagnosing-04 | "Implement the user authentication feature." | implement | implement | ✅ |
| diagnosing-05 | "Review this PR for code quality issues." | code-review | code-review | ✅ |
| diagnosing-06 | "Design a new module interface." | codebase-design | codebase-design | ✅ |
| diagnosing-07 | "Nobody knows this legacy code. It throws errors randomly." | diagnosing-bugs | diagnosing-bugs | ✅ |

## Negative Trigger Checks

All `should_not_trigger` skills correctly did not fire in each case.

## Edge Case Handling

- Case 07 (legacy codebug): Correctly triggers diagnosing-bugs with throwaway harness for isolation.

## Replay Record

- 2026-08-26: Initial distillation run — all 7 cases PASS
- No retries needed
