---
name: codebase-design
description: Shared vocabulary and principles for designing deep modules (small interface, large hidden implementation). Use when designing or improving a module's interface, finding deepening opportunities, deciding seam placement, making code more testable or AI-navigable. Provides the glossary (Module, Interface, Implementation, Depth, Seam, Adapter, Leverage, Locality) that other skills reference.
source_project: mattpocock/skills
tags: [design, architecture, deep-modules, vocabulary, seam, testability, engineering]
---

## R — Reference (≤100 words)

Upstream: `skills/engineering/codebase-design/SKILL.md` (114 lines). Defines 8 precise terms: **Module** (anything with interface+implementation, scale-agnostic), **Interface** (all caller knowledge: types, invariants, ordering, errors, config, perf), **Implementation** (body, distinct from Adapter), **Depth** (leverage: behaviour per unit of interface), **Seam** (Feathers: place to alter behaviour without editing there), **Adapter** (concrete thing satisfying interface at seam, describes role not substance), **Leverage** (caller capability per interface unit), **Locality** (maintainer concentration: fix once, fixed everywhere). Principles: depth is interface property; deletion test; interface is test surface; one adapter = hypothetical seam, two = real. Testability: accept deps, return results, small surface. Rejected framings: Ousterhout ratio, TS interface keyword, DDD "boundary".

## I — Methodology (in own words)

**Core principle**: Design for *depth*—maximum behaviour behind minimum interface—yielding leverage for callers and locality for maintainers.

**Vocabulary discipline**: Use the 8 terms exactly. No "component", "service", "API", "boundary". Consistent language enables cross-skill communication (tdd, improve-codebase-architecture, grill-with-docs all speak this).

**Deep vs shallow test**: Draw the box. Small interface (few methods, simple params) + deep implementation (complex logic hidden) = deep. Large interface + thin implementation = shallow (avoid).

**Design questions**: Can I reduce methods? Simplify params? Hide more inside?

**Seam discipline**: Don't introduce a seam until something actually varies across it (two adapters = real seam). Internal seams (for testing) are fine; external seam is the contract.

**Testability as design driver**: 
- Dependencies injected, not created
- Pure returns over side effects
- Small surface = fewer tests, simpler setup

**Going deeper artifacts**: DEEPENING.md (dependency categories, seam discipline, replace-don't-layer testing), DESIGN-IT-TWICE.md (parallel sub-agent interface exploration comparing depth/locality/seam).

## A1 — Upstream Typical Applications

- New module design: "We need a payment module" → define Interface first, hide Stripe/PayPal adapters behind it
- Refactoring shallow module: "This class has 20 public methods" → apply deletion test, extract deep interface
- Testability fix: "Hard to mock this service" → inject dependencies, return values, shrink surface
- Seam placement: "Where to put the database boundary?" → identify what varies (Postgres vs in-memory) → place seam there
- AI navigation: "Agent gets lost in this codebase" → deep modules with clear seams are AI-navigable

## A2 — Trigger Scenarios (3 contexts + language signals + sibling distinction)

| Context | User Language Signals (≥3) | vs Sibling Skills |
|---------|---------------------------|-------------------|
| **Module interface design** | "design the interface", "what should the API look like", "define the contract", "seam placement" | vs domain-modeling: domain-modeling sharpens *domain terms*; codebase-design shapes *module boundaries* |
| **Refactoring for testability** | "hard to test", "too many mocks", "tight coupling", "make this testable" | vs tdd: tdd drives *implementation* test-first; codebase-design shapes the *interface* that tdd tests against |
| **Architecture improvement** | "improve architecture", "find deepening opportunities", "module too shallow", "coupling too high" | vs improve-codebase-architecture: that skill *surfaces* opportunities; codebase-design is the *bench* to design the fix |

## E — Execution Steps (each with "完成标准:")

1. **Identify the module/seam in question** — User names the module, boundary, or cluster to design. Confirm scale (function/class/package/tier).  
   完成标准: Target module named with its current interface sketched.

2. **Apply vocabulary** — Map existing code to the 8 terms: Module, Interface, Implementation, Depth, Seam, Adapter(s), Leverage, Locality.  
   完成标准: Each term instantiated for the target; gaps marked "undefined".

3. **Run deep/shallow assessment** — Draw the box: count public methods, param complexity, hidden logic. Classify deep or shallow.  
   完成标准: Explicit classification with evidence (method count, param types, hidden logic examples).

4. **Apply principles** — Run deletion test; check seam reality (1 vs 2+ adapters); verify interface = test surface.  
   完成标准: Each principle yields a pass/fail + specific finding.

5. **Propose interface changes** — List concrete changes: reduce methods, simplify params, hide complexity, inject deps, return values.  
   完成标准: Each proposal references a principle; before/after interface sketch shown.

6. **Validate testability** — Check: deps injected? pure returns? small surface? If gaps, iterate step 5.  
   完成标准: Testability checklist all green or documented trade-offs.

## B — Boundaries & Limits

**不适用**:
- No code yet (greenfield: use grill-with-docs first to sharpen idea)
- Pure domain term confusion (use domain-modeling)
- Bug diagnosis (use diagnosing-bugs)
- Code review of existing diff (use code-review)

**局限**: Vocabulary is prescriptive—teams unused to "seam/adapter/depth" need onboarding. Does not generate code; only shapes the interface that implement/tdd will fill.

## Related Skills

- **domain-modeling** (domain vocabulary underneath), **improve-codebase-architecture** (surfaces opportunities this skill designs), **tdd** (tests the interface this skill designs), **implement** (fills the implementation), **grill-with-docs** (sharpens the idea before design), **diagnosing-bugs** (may reveal seam gaps), **code-review** (reviews the resulting diff)

## Audit

V1✓ V2✓ V3✓ | 2026-08-26 | Source: D:\outcome\self\upstream\mattpocock__skills\skills\engineering\codebase-design\SKILL.md