---
name: implement
description: Implement a piece of work based on a spec or set of tickets. Drives TDD internally (one red-green slice at a time), runs typechecking and test suites, then closes with code-review before committing. Use when the user says "implement this", "build this feature", "code this up", or when picking up tickets from to-tickets output. Works from spec or ticket as the single source of truth.
source_project: mattpocock/skills
tags: [implement, tdd, code-review, build, engineering]
---

## R — Reference (≤100 words)

Upstream: `skills/engineering/implement/SKILL.md` (15 lines). Implement the work described by the user in the spec or tickets. Use /tdd where possible, at pre-agreed seams. Run typechecking regularly, single test files regularly, and the full test suite once at the end. Once done, use /code-review to review the work. Commit your work to the current branch. Key discipline: implement consumes specs/tickets as the source of truth; TDD is the internal engine; code-review is the quality gate before commit.

## I — Methodology (in own words)

**Core principle**: Implement is a *delivery pipeline*: spec → TDD → typecheck → test suite → code-review → commit. Each stage is a quality gate; the pipeline does not skip gates.

**Three-phase execution**:
1. **Build** (TDD-driven): Work through the spec/ticket one vertical slice at a time. Each slice = one failing test → minimal implementation → test passes. Pre-agreed seams from codebase-design or grill-with-docs.
2. **Verify**: Run typechecking after each slice. Run single test files as they're written. Run full test suite at the end.
3. **Review**: Invoke /code-review for two-axis review (Standards + Spec). Fix findings. Then commit.

**Spec/ticket as source of truth**: Never add features not in the spec. If the spec is unclear, pause and clarify before coding. Each ticket is self-contained; last ticket's context is disposable.

**Context hygiene**: Each implement starts fresh from the ticket, not from previous implement context. Clear/compact between tickets in multi-ticket flows.

## A1 — Upstream Typical Applications

- Single-ticket feature: spec exists → implement drives TDD → code-review → commit
- Multi-ticket flow: to-tickets produced 5 tickets → implement each in sequence, clearing context between
- Bug fix with regression test: diagnosing-bugs found the cause → implement the fix with TDD → regression test included
- Prototype folding: prototype validated a decision → implement the real code based on prototype findings
- Pre-refactor: codebase-design defined new interface → implement the refactor at the seam

## A2 — Trigger Scenarios (3 contexts + language signals + sibling distinction)

| Context | User Language Signals (≥3) | vs Sibling Skills |
|---------|---------------------------|-------------------|
| **Build from spec** | "implement this spec", "code this up", "build this feature", "start working on the tickets" | vs tdd: tdd is the *technique*; implement is the *pipeline* that uses tdd internally |
| **Ticket pickup** | "work on ticket #5", "implement the next ticket", "pick up what's ready" | vs to-tickets: to-tickets *creates* tickets; implement *executes* them |
| **Post-review iteration** | "fix the review findings", "address the comments", "re-implement after review" | vs code-review: code-review *evaluates*; implement *acts* on the evaluation |

## E — Execution Steps (each with "完成标准:")

1. **Load spec or ticket** — Read the source of truth (spec from to-spec, ticket from to-tickets, or user-provided). Confirm scope is clear.  
   完成标准: Spec/ticket loaded; scope boundaries identified; no ambiguity remaining.

2. **Identify pre-agreed seams** — Check if seams were defined during grilling/design. If not, confirm with user before writing tests.  
   完成标准: Seams documented; user confirmed or new seams agreed.

3. **TDD build loop** — For each vertical slice: write failing test → implement minimal code → test passes → typecheck → move to next slice.  
   完成标准: Each slice has passing test + implementation; typecheck clean after each slice.

4. **Run full test suite** — Execute the complete test suite. Fix any failures.  
   完成标准: Full suite passes; no regressions.

5. **Invoke code-review** — Call /code-review for Standards + Spec review. Fix all findings.  
   完成标准: Code-review complete; all findings addressed or documented as trade-offs.

6. **Commit** — Stage and commit with descriptive message referencing the spec/ticket.  
   完成标准: Clean commit on current branch; message references spec/ticket number.

## B — Boundaries & Limits

**不适用**:
- No spec or ticket to work from (use grill-with-docs or to-spec first)
- User wants to review code, not implement (use code-review directly)
- User wants to diagnose a bug, not build a feature (use diagnosing-bugs)
- Architecture design work (use codebase-design + grill-with-docs)

**局限**: Implement assumes the spec/ticket is correct and complete. If the spec is wrong, the implementation will be wrong. Requires pre-agreed seams for TDD; without them, tests may target wrong boundaries. Code-review at the end may surface design issues that require rework.

## Related Skills

- **tdd** (internal technique for build phase), **code-review** (quality gate after build), **to-spec** (produces the spec), **to-tickets** (produces the tickets), **grill-with-docs** (sharpens the idea before spec), **codebase-design** (defines seams), **setup-matt-pocock-skills** (precondition for issue tracker)

## Audit

V1✓ V2✓ V3✓ | 2026-08-26 | Source: D:\outcome\self\upstream\mattpocock__skills\skills\engineering\implement\SKILL.md
