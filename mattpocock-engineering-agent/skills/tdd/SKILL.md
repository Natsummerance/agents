---
name: tdd
description: Test-driven development — the red → green loop. Write failing test first, then minimal implementation to pass. Tests verify behavior through public interfaces, not implementation details. Work in vertical slices: one test → one implementation → repeat. Anti-patterns: implementation-coupled, tautological, horizontal slicing. Use when the user wants to build features test-first, mentions "red-green-refactor", or wants integration tests. Invoked by implement internally.
source_project: mattpocock/skills
tags: [tdd, test-driven-development, red-green, vertical-slices, seams, engineering]
---

## R — Reference (≤100 words)

Upstream: `skills/engineering/tdd/SKILL.md` (38 lines). TDD is the red → green loop. Tests verify behavior through public interfaces, not implementation details. A good test reads like a specification and survives refactors. **Seams**: test only at pre-agreed seams — the public boundary where you observe behavior. Before writing any test, write down the seams under test and confirm with the user. **Anti-patterns**: (1) Implementation-coupled — mocks internals, tests private methods; breaks on refactor without behavior change. (2) Tautological — assertion recomputes expected value the way code does; passes by construction. (3) Horizontal slicing — all tests first, then all implementation; bulk tests verify imagined behavior. **Rules**: Red before green. One slice at a time. Refactoring belongs to review stage, not the red → green loop.

## I — Methodology (in own words)

**Core principle**: TDD is a *design feedback loop*, not a testing strategy. The test drives the implementation; the implementation serves the test. Refactoring is separate.

**Seam-first discipline**: Before writing any test, agree on the seams (public boundaries) where tests will live. No test at an unconfirmed seam. This ensures testing effort lands on critical paths, not every edge case.

**Vertical slicing**: One test → one implementation → repeat. Each test is a *tracer bullet* responding to what the last cycle taught you. Never write all tests first (horizontal slicing) — bulk tests verify imagined behavior.

**What a good test is**:
- Verifies behavior through public interfaces (not implementation details)
- Reads like a specification ("user can checkout with valid cart")
- Survives refactors (doesn't care about internal structure)
- Expected values from independent source of truth (known-good literal, worked example, spec)

**Anti-pattern detection**:
- Implementation-coupled: test breaks on refactor without behavior change → remove internal mocks
- Tautological: assertion recomputes expected value → use independent source of truth
- Horizontal slicing: all tests before implementation → work in vertical slices instead

**Refactoring is separate**: The red → green loop produces working code. Refactoring improves structure. Review stage (code-review) is where refactoring belongs.

## A1 — Upstream Typical Applications

- Feature development: "add user authentication" → seam at AuthService interface → test login flow → implement → test register flow → implement
- Bug fix: diagnosing-bugs found cause → write failing regression test at correct seam → implement fix → test passes
- API endpoint: seam at HTTP handler → test request/response contract → implement handler
- Domain logic: seam at domain service interface → test business rules → implement
- Refactor preparation: existing code has no tests → write tests at seams → refactor with confidence

## A2 — Trigger Scenarios (3 contexts + language signals + sibling distinction)

| Context | User Language Signals (≥3) | vs Sibling Skills |
|---------|---------------------------|-------------------|
| **Test-first development** | "test-first", "write the test first", "red-green-refactor", "TDD this" | vs implement: implement is the *pipeline*; tdd is the *technique* implement uses internally |
| **Integration test request** | "write integration tests", "test the full flow", "end-to-end test", "API contract test" | vs code-review: code-review evaluates *existing code*; tdd *drives new code* |
| **Seam definition** | "what should we test?", "where do tests go?", "define the test boundary", "agreed seams" | vs codebase-design: codebase-design *shapes the interface*; tdd *tests at the interface* |

## E — Execution Steps (each with "完成标准:")

1. **Confirm seams** — Write down the public boundaries where tests will live. Confirm with user. No test at an unconfirmed seam.  
   完成标准: Seams documented; user confirmed; no unconfirmed seams.

2. **Write failing test** — At the agreed seam, write a test that exercises the desired behavior. Test should fail (red).  
   完成标准: Test written; fails when run (red state); verifies behavior through public interface.

3. **Write minimal implementation** — Just enough code to make the test pass. No speculative features. No anticipation of future tests.  
   完成标准: Test passes (green state); implementation is minimal; no extra features.

4. **Repeat for next slice** — Move to next behavior. Write failing test → minimal implementation → test passes. One seam, one test, one slice at a time.  
   完成标准: Each slice completed independently; no horizontal slicing.

5. **Verify test quality** — Check: Is test coupled to implementation? Is it tautological? Does it survive refactoring? If issues, fix test first.  
   完成标准: All tests verify behavior through public interface; no anti-patterns.

## B — Boundaries & Limits

**不适用**:
- No agreed seams (use codebase-design to define them first)
- User wants to review existing code (use code-review)
- User wants to diagnose a bug (use diagnosing-bugs)
- Refactoring without new behavior (use code-review + codebase-design)

**局限**: TDD requires pre-agreed seams; without them, tests target wrong boundaries. Tests verify behavior, not correctness — wrong behavior with passing tests is possible. TDD slows initial development; payoff comes during refactoring and maintenance. Not all code is testable at clean seams (legacy code may need preparatory refactoring).

## Related Skills

- **implement** (uses tdd internally), **codebase-design** (defines seams for tdd), **code-review** (reviews test quality + refactoring), **diagnosing-bugs** (may spawn tdd for regression test), **domain-modeling** (test names use domain vocabulary)

## Audit

V1✓ V2✓ V3✓ | 2026-08-26 | Source: D:\outcome\self\upstream\mattpocock__skills\skills\engineering\tdd\SKILL.md
