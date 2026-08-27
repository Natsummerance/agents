---
name: improve-codebase-architecture
description: Scan a codebase for deepening opportunities, present them as a visual HTML report, then grill through whichever one you pick. Uses codebase-design vocabulary (module, interface, depth, seam, adapter, leverage, locality) and domain glossary from CONTEXT.md. Finds shallow modules, tight coupling, untested paths. Use when the user says "improve architecture", "find technical debt", "scan for refactoring opportunities", or during spare moments for codebase health.
source_project: mattpocock/skills
tags: [architecture, deepening, html-report, codebase-health, grilling, engineering]
---

## R — Reference (≤100 words)

Upstream: `skills/engineering/improve-codebase-architecture/SKILL.md` (71 lines). Surface architectural friction and propose deepening opportunities: refactors that turn shallow modules into deep ones. Process: (1) Explore — scope before scan (YAGNI), walk commit history for hot spots, read CONTEXT.md + ADRs, spawn sub-agent to walk codebase noting friction. (2) Present candidates as HTML report — Tailwind + CDN, Mermaid diagrams, before/after visualizations, recommendation strength badges, top recommendation section. (3) Grilling loop — user picks candidate, call grilling + domain-modeling to walk decision tree. ADR conflicts surfaced only when friction warrants reopening.

## I — Methodology (in own words)

**Core principle**: Deepening pays off by making future changes easier. Put extra weight on *hot spots* — files that change frequently. YAGNI: don't scan what hasn't changed recently.

**Three-phase process**:
1. **Explore**: Walk commit history (`git log --oneline`) to find hot spots. Read CONTEXT.md for domain vocabulary. Spawn sub-agent to walk codebase noting friction: shallow modules, bouncing between modules, tight coupling across seams, untested paths. Apply deletion test to suspected shallow modules.

2. **Present as HTML report**: Write self-contained HTML to OS temp dir (`$TMPDIR`/`/tmp`/`%TEMP%`). Use Tailwind via CDN for layout, Mermaid via CDN for diagrams. Each candidate card: files involved, problem, solution, benefits (locality + leverage), before/after diagram, recommendation strength badge. End with Top recommendation section.

3. **Grilling loop**: User picks a candidate. Call grilling + domain-modeling to walk the decision tree: constraints, dependencies, deepened module shape, seam placement, surviving tests. Update CONTEXT.md if new terms surface. Offer ADR if user rejects with load-bearing reason.

**Vocabulary enforcement**: Use codebase-design terms exactly (module, interface, depth, seam, adapter, leverage, locality). No "component", "service", "API", "boundary".

## A1 — Upstream Typical Applications

- Hot spot identified: `git log` shows `src/auth/` changes weekly → scan reveals auth module is shallow (20 public methods, thin logic) → deepening candidate
- Coupling detection: understanding one feature requires bouncing between 4 modules → seam candidate identified
- Testability gap: pure functions extracted for testability but real bugs hide in orchestration → locality problem
- AI navigability: agent gets lost in codebase → deep modules with clear seams improve agent navigation
- Architecture review: scheduled codebase health check → HTML report → team picks top candidate → grill → ADR

## A2 — Trigger Scenarios (3 contexts + language signals + sibling distinction)

| Context | User Language Signals (≥3) | vs Sibling Skills |
|---------|---------------------------|-------------------|
| **Codebase health check** | "scan for tech debt", "find refactoring opportunities", "improve architecture", "codebase health" | vs code-review: code-review audits *specific diff*; improve-codebase-architecture scans *entire codebase* |
| **Module feels wrong** | "this module is too shallow", "too many public methods", "coupling is too high", "hard to test" | vs codebase-design: codebase-design is the *vocabulary bench*; improve-codebase-architecture is the *survey that finds candidates* |
| **Pre-emptive improvement** | "while we have time", "before starting new feature", "keep the codebase healthy", "deepening opportunities" | vs implement: implement *builds features*; improve-codebase-architecture *improves the foundation* |

## E — Execution Steps (each with "完成标准:")

1. **Scope the scan** — Check if user named a direction (module, subsystem, pain point). If not, walk `git log --oneline` to find hot spots. Read CONTEXT.md and ADRs in the area.  
   完成标准: Scan scope defined (user-named or commit-history-derived); CONTEXT.md/ADRs read.

2. **Walk the codebase** — Spawn sub-agent to explore organically. Note friction: bouncing between modules, shallow interfaces, tight coupling across seams, untested paths. Apply deletion test to suspected shallow modules.  
   完成标准: Sub-agent returns list of friction points with file paths and evidence.

3. **Write HTML report** — Generate self-contained HTML to OS temp dir. Tailwind + Mermaid. Each candidate: files, problem, solution, benefits, before/after diagram, recommendation strength. Top recommendation section.  
   完成标准: HTML file written to temp dir; opened for user; absolute path reported.

4. **User selects candidate** — Ask "Which of these would you like to explore?" Wait for selection.  
   完成标准: User selects one candidate (or defers).

5. **Grilling loop** — Call grilling + domain-modeling to walk decision tree for selected candidate. Update CONTEXT.md if new terms surface. Offer ADR if user rejects with load-bearing reason.  
   完成标准: Decision tree walked; CONTEXT.md updated; ADR offered if applicable.

## B — Boundaries & Limits

**不适用**:
- Greenfield project with no codebase to scan (use grill-with-docs to design first)
- Specific diff review (use code-review)
- Bug diagnosis (use diagnosing-bugs)
- User wants to implement immediately (use implement/tdd)

**局限**: HTML report depends on Mermaid rendering; complex diagrams may not render in all environments. Hot spot analysis based on git history may miss important but rarely-changed modules. ADR conflicts surfaced only when friction warrants — may miss some. Requires grilling session to resolve selected candidate.

## Related Skills

- **codebase-design** (vocabulary layer), **grill-with-docs** (drives the grilling loop), **domain-modeling** (updates CONTEXT.md), **code-review** (audits specific diffs), **implement** (builds from candidates), **tdd** (tests at identified seams), **wayfinder** (for huge efforts that emerge from candidates)

## Audit

V1✓ V2✓ V3✓ | 2026-08-26 | Source: D:\outcome\self\upstream\mattpocock__skills\skills\engineering\improve-codebase-architecture\SKILL.md
