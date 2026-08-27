# ask-matt — Test Results

**Run date**: 2026-08-26  
**Test file**: test-prompts.json (7 cases)  
**Minimum pass rate**: 0.95  
**Result**: **PASS** — 7/7 passed (100%)

## Case Results

| Case ID | User Input | Expected Trigger | Actual Trigger | Pass |
|---------|------------|------------------|----------------|------|
| ask-matt-01 | "I have a new feature idea and a git repo. Which skill should I start with?" | ask-matt | ask-matt | ✅ |
| ask-matt-02 | "We have 50 untriaged GitHub issues piling up. What flow handles this?" | ask-matt | ask-matt | ✅ |
| ask-matt-03 | "A test flakes 1 in 20 runs on CI. How do I debug this properly?" | ask-matt | ask-matt | ✅ |
| ask-matt-04 | "We're starting a greenfield project, too big for one session. Where do we begin?" | ask-matt | ask-matt | ✅ |
| ask-matt-05 | "This module feels shallow—too many public methods, little logic. How to improve?" | ask-matt | ask-matt | ✅ |
| ask-matt-06 | "I want to review my branch against main before merging. Which skill?" | ask-matt | ask-matt | ✅ |
| ask-matt-07 | "Just writing a blog post, no repo. Help me think through the outline." | ask-matt | ask-matt | ✅ |

## Negative Trigger Checks

All `should_not_trigger` skills correctly did not fire in each case.

## Edge Case Handling

- Case 07 (no-repo writing): Correctly routes to grill-me via ask-matt, not grill-with-docs.

## Replay Record

- 2026-08-26: Initial distillation run — all 7 cases PASS
- No retries needed