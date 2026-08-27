# to-tickets — Test Results

**Run date**: 2026-08-26  
**Test file**: test-prompts.json (7 cases)  
**Minimum pass rate**: 0.95  
**Result**: **PASS** — 7/7 passed (100%)

## Case Results

| Case ID | User Input | Expected Trigger | Actual Trigger | Pass |
|---------|------------|------------------|----------------|------|
| to-tickets-01 | "Break this spec into individual tickets for implementation." | to-tickets | to-tickets | ✅ |
| to-tickets-02 | "Create tickets from this design discussion." | to-tickets | to-tickets | ✅ |
| to-tickets-03 | "Plan the implementation sequence for this feature." | to-tickets | to-tickets | ✅ |
| to-tickets-04 | "Implement the first ticket from this list." | implement | implement | ✅ |
| to-tickets-05 | "Design the interface for this new module." | codebase-design | codebase-design | ✅ |
| to-tickets-06 | "Map out the decisions we need to make for this project." | wayfinder | wayfinder | ✅ |
| to-tickets-07 | "This refactoring needs to be done in expand-contract pattern. Break it down." | to-tickets | to-tickets | ✅ |

## Negative Trigger Checks

All `should_not_trigger` skills correctly did not fire in each case.

## Edge Case Handling

- Case 07 (expand-contract breakdown): Correctly triggers to-tickets for wide refactoring pattern.

## Replay Record

- 2026-08-26: Initial distillation run — all 7 cases PASS
- No retries needed
