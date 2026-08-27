---
name: wayfinder
description: Plan a huge chunk of work (more than one agent session can hold) as a shared map of decision tickets on your issue tracker. Resolves them one at a time until the way to the destination is clear. Produces decisions, not deliverables. The map is an index, not a store. Tickets are child issues. Fog of war: deliberately incomplete — don't chart what you can't yet see. Use when the user says "this is too big for one session", "where do we start?", "map out the approach", or when facing a greenfield project or massive refactor.
source_project: mattpocock/skills
tags: [wayfinder, map, decision-tickets, fog-of-war, huge-efforts, planning, engineering]
---

## R — Reference (≤100 words)

Upstream: `skills/engineering/wayfinder/SKILL.md` (128 lines). A loose idea, too big for one session, wrapped in fog. Wayfinding is about finding the way, not charging at the destination. Charts the way as a shared map on the repo's issue tracker, then works decision tickets one at a time until the route is clear. **Plan, don't do**: each ticket resolves a decision; map is done when way is clear. **Refer by name**: every map/ticket is an issue with a title; refer by name, never bare id. **The Map**: single issue labelled `wayfinder:map`, canonical artifact. Body: Destination, Notes, Decisions so far, Not yet specified, Out of scope. **Tickets**: child issues, sized to 100K token session, carry `wayfinder:<type>` label (research/prototype/grilling/task). **Fog of war**: deliberately incomplete; don't chart what you can't yet see. **Ticket types**: Research (AFK, subagent), Prototype (HITL, concrete artifact), Grilling (HITL, conversation), Task (HITL or AFK, manual work). **Invocation**: Chart the map (user invokes with loose idea) or Work through the map (user invokes with map URL/number). Never resolve more than one ticket per session (except research).

## I — Methodology (in own words)

**Core principle**: Wayfinder is *planning* by default. Each ticket resolves a decision; the map is done when the way is clear. The pull to just do the work signals the edge of the map — time to hand off.

**Map structure**: Single issue with label `wayfinder:map`. Body contains:
- **Destination**: What reaching the end looks like (spec, decision, or change)
- **Notes**: Domain context, skills to consult, standing preferences
- **Decisions so far**: Index of closed tickets (one line gist + link)
- **Not yet specified**: Fog — in-scope decisions you can't yet ticket
- **Out of scope**: Work ruled beyond the destination; never graduates

**Ticket discipline**: Each ticket = child issue of the map. Body is the question, sized to 100K token session. Answer recorded on resolution, not in body. Assets linked from issue, not pasted in.

**Fog of war**: Don't chart what you can't see. Beyond live tickets lies the fog — suspected decisions you can't yet pin down. Resolving a ticket clears fog ahead, graduating specifiable items into fresh tickets.

**Never more than one ticket per session** (except research): Prevents context pollution. Research tickets can be resolved in parallel by subagents.

## A1 — Upstream Typical Applications

- Greenfield project: "we need to build X from scratch" → wayfinder maps decisions (tech stack, architecture, data model) → fog clears → hand off to to-spec
- Massive refactor: "this module needs complete redesign" → wayfinder maps decision tickets → each resolved in isolation → way becomes clear
- Migration project: "migrate from system A to B" → wayfinder maps migration steps → fog of war for unknowns → research tickets resolve unknowns
- Multi-team coordination: "align three teams on shared architecture" → wayfinder maps decisions → each team resolves their tickets → convergence
- Strategic planning: "figure out our API strategy" → wayfinder maps research + prototype + grilling tickets → fog clears → hand off to implementation

## A2 — Trigger Scenarios (3 contexts + language signals + sibling distinction)

| Context | User Language Signals (≥3) | vs Sibling Skills |
|---------|---------------------------|-------------------|
| **Huge foggy effort** | "too big for one session", "where do we start?", "map out the approach", "greenfield project" | vs grill-with-docs: grill-with-docs sharpens *an idea you can hold*; wayfinder maps *an idea you can't hold in one session* |
| **Multi-session planning** | "this will take multiple sessions", "break this into decisions", "what do we need to decide first?" | vs to-tickets: to-tickets *breaks a spec into work items*; wayfinder *maps decisions until the spec emerges* |
| **Fog clearing** | "we don't know enough yet", "need to research first", "what are the open questions?", "resolve the unknowns" | vs research: research *reads primary sources*; wayfinder *manages a map of decisions* where research is one ticket type |

## E — Execution Steps (each with "完成标准:")

1. **Name the destination** — Call grilling + domain-modeling to pin down what this map is finding its way to: the spec, decision, or change. Destination fixes scope.  
   完成标准: Destination named; scope fixed; grilling + domain-modeling called.

2. **Map the frontier** — Grill breadth-first: fan out across the whole space, surfacing open decisions and first takeable steps. If no fog (way already clear), don't need a map — stop and ask how to proceed.  
   完成标准: Frontier mapped; fog identified (or "no fog" noted); breadth-first coverage.

3. **Create the map** — Create issue with label `wayfinder:map`. Fill in Destination, Notes. Decisions-so-far empty. Sketch fog into Not yet specified.  
   完成标准: Map issue created; body sections filled; fog sketched.

4. **Create tickets** — Specify tickets as child issues of the map. Wire blocking edges in second pass (issues need IDs first). Everything not yet specifiable stays in fog.  
   完成标准: Tickets created; blocking edges wired; fog = Not yet specified section.

5. **Fire research subagents** — For each research ticket, spin up subagent to resolve in parallel. Capture findings on throwaway branch with context pointer.  
   完成标准: Research subagents spawned; findings captured; context pointers set.

6. **Stop** — Charting is one session's work. Hand-resolves nothing.  
   完成标准: Charting complete; no resolutions attempted.

## B — Boundaries & Limits

**不适用**:
- Small, well-scoped feature (use grill-with-docs → to-spec → to-tickets → implement)
- Pure code review (use code-review)
- Bug diagnosis (use diagnosing-bugs)
- User wants to implement directly (use implement)

**局限**: Wayfinder is the most cognitively demanding flow — slower and denser than other skills. Fog of war means the map is deliberately incomplete; early tickets may be mis-scoped. "Never more than one ticket per session" slows progress. Requires issue tracker setup (setup-matt-pocock-skills). Map can become stale if the destination shifts.

## Related Skills

- **grill-with-docs** (sharpens the idea before wayfinder; wayfinder hands off to to-spec), **to-spec** (collapses map's linked decisions into a buildable plan), **to-tickets** (breaks spec into executable tickets), **research** (ticket type for reading legwork), **prototype** (ticket type for concrete artifacts), **grilling** (ticket type for conversation), **setup-matt-pocock-skills** (precondition for issue tracker)

## Audit

V1✓ V2✓ V3✓ | 2026-08-26 | Source: D:\outcome\self\upstream\mattpocock__skills\skills\engineering\wayfinder\SKILL.md
