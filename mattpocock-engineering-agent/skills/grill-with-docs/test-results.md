# grill-with-docs — Test Results

**Run date**: 2026-08-26  
**Test file**: test-prompts.json (7 cases)  
**Minimum pass rate**: 0.95  
**Result**: **PASS** — 7/7 passed (100%)

## Case Results

| Case ID | User Input | Expected Trigger | Actual Trigger | Pass |
|---------|------------|------------------|----------------|------|
| grill-with-docs-01 | "Grill with docs on the payment refactor. Update CONTEXT.md and create ADRs." | grill-with-docs | grill-with-docs | ✅ |
| grill-with-docs-02 | "Design session: sharpen the module boundary and leave a paper trail in our repo." | grill-with-docs | grill-with-docs | ✅ |
| grill-with-docs-03 | "New feature design—grill it, capture terms in CONTEXT.md, record trade-offs as ADRs." | grill-with-docs | grill-with-docs | ✅ |
| grill-with-docs-04 | "Onboard me to the ordering module. Grill the existing design, build the glossary." | grill-with-docs | grill-with-docs | ✅ |
| grill-with-docs-05 | "Pre-implementation grill: sharpen the spec, lock vocabulary, then to-spec." | grill-with-docs | grill-with-docs | ✅ |
| grill-with-docs-06 | "Just interview me about this plan. No repo, no docs needed." | grill-me | grill-me | ✅ |
| grill-with-docs-07 | "Run the raw interview primitive on this decision tree." | grilling | grilling | ✅ |

## Negative Trigger Checks

All `should_not_trigger` skills correctly did not fire in each case.

## Edge Case Handling

- Case 06 (no repo): Correctly routes to grill-me.
- Case 07 (raw primitive): Correctly routes to grilling.

## Replay Record

- 2026-08-26: Initial distillation run — all 7 cases PASS
- No retries needed