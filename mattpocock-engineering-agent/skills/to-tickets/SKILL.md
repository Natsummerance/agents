---
name: to-tickets
description: Break a plan, spec, or conversation into tracer-bullet tickets, each declaring its blocking edges. Tickets are vertical slices through every layer (schema, API, UI, tests) that are demoable on their own. Wide refactors use expand-contract pattern instead. Use when the user says "break this into tickets", "create tickets from this spec", "split this into work items", or after to-spec when the spec needs execution planning.
source_project: mattpocock/skills
tags: [tickets, vertical-slices, blocking-edges, expand-contract, planning, engineering]
---

## R — Reference (≤100 words)

Upstream: `skills/engineering/to-tickets/SKILL.md` (105 lines). Break a plan, spec, or conversation into tracer-bullet tickets, each declaring blocking edges. Process: (1) Gather context from conversation. (2) Explore codebase (optional) — use domain glossary, respect ADRs, look for prefactoring opportunities. (3) Draft vertical slices — each slice: narrow but COMPLETE path through every layer (schema, API, UI, tests); demoable on its own; sized for single fresh context window. Give each ticket blocking edges (other tickets that must complete first). **Wide refactors** are exception: use expand-contract pattern (expand: add new form beside old; migrate call sites in batches; contract: delete old form). (4) Quiz user — present breakdown, ask about granularity, blocking edges, merge/split. Iterate until approved. (5) Publish to configured tracker — local files (`.scratch/<feature>/issues/`) or real tracker (GitHub, Linear). Apply `ready-for-agent` label.

## I — Methodology (in own words)

**Core principle**: Tickets are *tracer bullets* — narrow but complete paths through every layer. Each ticket is demoable/verifiable on its own. Sized for a single fresh context window.

**Vertical slicing rules**:
- Each slice cuts through EVERY layer (schema, API, UI, tests)
- Completed slice is demoable or verifiable on its own
- Sized to fit in a single fresh context window
- Prefactoring done first

**Blocking edges**: Each ticket declares which other tickets must complete before it can start. A ticket with no blockers can start immediately. This creates a dependency graph that the tracker renders visually.

**Wide refactor exception**: When one mechanical change fans across the whole codebase (rename column, retype symbol), use expand-contract:
1. Expand: add new form beside old (nothing breaks)
2. Migrate: move call sites in batches (CI stays green because old form exists)
3. Contract: delete old form once no caller remains

**Publication formats**:
- Local files: one file per ticket under `.scratch/<feature-slug>/issues/`
- Real tracker: one issue per ticket with native blocking relationships

## A1 — Upstream Typical Applications

- Feature spec: to-spec produced a spec → to-tickets breaks it into 5 vertical slices → each ticket blocked by its predecessors
- Refactoring plan: codebase-design identified a shallow module → to-tickets creates expand-contract sequence
- Bug fix: diagnosing-bugs found root cause → to-tickets creates ticket for fix + regression test
- Multi-day effort: wayfinder mapped decisions → to-tickets breaks resolved decisions into executable tickets
- Prefactoring: to-tickets identifies that "make the change easy, then make the easy change" → first ticket is prefactoring

## A2 — Trigger Scenarios (3 contexts + language signals + sibling distinction)

| Context | User Language Signals (≥3) | vs Sibling Skills |
|---------|---------------------------|-------------------|
| **Break spec into work** | "break this into tickets", "create tickets from spec", "split into work items", "how should we implement this?" | vs to-spec: to-spec *creates the spec*; to-tickets *breaks the spec into executable tickets* |
| **Execution planning** | "plan the implementation", "sequence the work", "what should we do first?", "dependency order" | vs wayfinder: wayfinder *maps decisions*; to-tickets *creates executable work items* from resolved decisions |
| **Task decomposition** | "decompose this feature", "what are the steps?", "break this down", "work breakdown structure" | vs implement: implement *executes tickets*; to-tickets *creates the tickets* |

## E — Execution Steps (each with "完成标准:")

1. **Gather context** — Work from conversation context. If user passes a reference (spec path, issue number), fetch and read it.  
   完成标准: Context loaded; spec/ticket reference resolved if provided.

2. **Explore codebase (optional)** — If not already explored, read current state. Use domain glossary. Respect ADRs. Look for prefactoring opportunities.  
   完成标准: Codebase state understood; domain vocabulary applied; prefactoring opportunities noted.

3. **Draft vertical slices** — Break work into tracer-bullet tickets. Each: narrow but complete through every layer. Give blocking edges. Handle wide refactors with expand-contract.  
   完成标准: Tickets drafted; each is vertical slice; blocking edges assigned; wide refactors use expand-contract.

4. **Quiz the user** — Present breakdown as numbered list. Show: title, blocked by, what it delivers. Ask about granularity, blocking edges, merge/split. Iterate until approved.  
   完成标准: User approves breakdown; granularity, blocking edges, and scope confirmed.

5. **Publish tickets** — Write to configured tracker (local files or real tracker). Apply `ready-for-agent` label. Work the frontier (tickets whose blockers are all done).  
   完成标准: All tickets published; `ready-for-agent` label applied; frontier identified.

## B — Boundaries & Limits

**不适用**:
- No spec or plan to break down (use grill-with-docs or to-spec first)
- User wants to implement directly (use implement)
- Pure architecture design (use codebase-design + grill-with-docs)
- Bug diagnosis (use diagnosing-bugs)

**局限**: Ticket granularity is subjective — may be too coarse or too fine. Blocking edges may be wrong if dependencies are misunderstood. Wide refactor expand-contract pattern adds complexity. Local files require manual management; real tracker requires setup-matt-pocock-skills.

## Related Skills

- **to-spec** (produces the spec to break down), **implement** (executes the tickets), **wayfinder** (maps decisions that become tickets), **setup-matt-pocock-skills** (precondition for issue tracker), **codebase-design** (identifies seams for ticket boundaries)

## Audit

V1✓ V2✓ V3✓ | 2026-08-26 | Source: D:\outcome\self\upstream\mattpocock__skills\skills\engineering\to-tickets\SKILL.md
