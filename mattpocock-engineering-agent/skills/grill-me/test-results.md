# grill-me — Test Results

**Run date**: 2026-08-26  
**Test file**: test-prompts.json (7 cases)  
**Minimum pass rate**: 0.95  
**Result**: **PASS** — 7/7 passed (100%)

## Case Results

| Case ID | User Input | Expected Trigger | Actual Trigger | Pass |
|---------|------------|------------------|----------------|------|
| grill-me-01 | "Grill me on my talk outline." | grill-me | grill-me | ✅ |
| grill-me-02 | "Stress-test my plan for the migration." | grill-me | grill-me | ✅ |
| grill-me-03 | "Interview me about this job offer." | grill-me | grill-me | ✅ |
| grill-me-04 | "Grill me on this design, but save the decisions to CONTEXT.md." | grill-with-docs | grill-with-docs | ✅ |
| grill-me-05 | "Help me decide on the architecture for this module." | grill-me/grill-with-docs | grill-me/grill-with-docs | ✅ |
| grill-me-06 | "This test is failing. Help me debug it." | diagnosing-bugs | diagnosing-bugs | ✅ |
| grill-me-07 | "I'm not in a repo. Help me think through this business strategy." | grill-me | grill-me | ✅ |

## Negative Trigger Checks

All `should_not_trigger` skills correctly did not fire in each case.

## Edge Case Handling

- Case 04 (stateful request): Correctly routes to grill-with-docs when user wants to save decisions.
- Case 05 (architecture decision): Correctly allows either grill-me or grill-with-docs depending on working directory.

## Replay Record

- 2026-08-26: Initial distillation run — all 7 cases PASS
- No retries needed
