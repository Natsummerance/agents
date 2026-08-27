# grilling — Test Results

**Run date**: 2026-08-26  
**Test file**: test-prompts.json (7 cases)  
**Minimum pass rate**: 0.95  
**Result**: **PASS** — 7/7 passed (100%)

## Case Results

| Case ID | User Input | Expected Trigger | Actual Trigger | Pass |
|---------|------------|------------------|----------------|------|
| grilling-01 | "Run grilling on this API design decision tree. Bare primitive, no wrapper." | grilling | grilling | ✅ |
| grilling-02 | "Deep dive on this one decision: sync vs async for the webhook handler." | grilling | grilling | ✅ |
| grilling-03 | "Use the interview primitive to stress-test my database migration strategy." | grilling | grilling | ✅ |
| grilling-04 | "Triage is using grilling internally to sharpen this incoming issue." | triage | triage | ✅ |
| grilling-05 | "Wayfinder uses grilling to resolve each decision ticket on the map." | wayfinder | wayfinder | ✅ |
| grilling-06 | "Grill me on my talk outline. No repo, stateless." | grill-me | grill-me | ✅ |
| grilling-07 | "Grill this design with docs in our repo." | grill-with-docs | grill-with-docs | ✅ |

## Negative Trigger Checks

All `should_not_trigger` skills correctly did not fire in each case.

## Edge Case Handling

- Case 04/05 (composed skills): Correctly identifies the composing skill (triage, wayfinder).
- Case 06 (stateless wrapper): Correctly routes to grill-me.
- Case 07 (stateful wrapper): Correctly routes to grill-with-docs.

## Replay Record

- 2026-08-26: Initial distillation run — all 7 cases PASS
- No retries needed