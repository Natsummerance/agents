---
name: to-spec
description: Turn the current conversation into a spec and publish it to the project issue tracker. No interview — just synthesis of what you've already discussed. Produces structured spec with: Problem Statement, Solution, User Stories (extensive list), Implementation Decisions, Testing Decisions, Out of Scope, Further Notes. Use when the user says "write a spec", "create a spec from this discussion", "turn this into a spec", or after grill-with-docs when the idea is sharp enough to formalize.
source_project: mattpocock/skills
tags: [spec, specification, synthesis, issue-tracker, planning, engineering]
---

## R — Reference (≤100 words)

Upstream: `skills/engineering/to-spec/SKILL.md` (75 lines). Takes conversation context and codebase understanding, produces a spec. Do NOT interview the user — just synthesize what you already know. Process: (1) Explore repo to understand current state; use domain glossary, respect ADRs. (2) Sketch seams at which feature will be tested; prefer existing seams; confirm with user. (3) Write spec using template, publish to issue tracker, apply `ready-for-agent` label. Template sections: Problem Statement, Solution, User Stories (LONG numbered list, "As an X, I want Y, so that Z"), Implementation Decisions (modules, interfaces, architecture, schema, API — no file paths or code snippets except prototype snippets encoding decisions), Testing Decisions (external behavior only, which modules tested, prior art), Out of Scope, Further Notes.

## I — Methodology (in own words)

**Core principle**: to-spec is *synthesis*, not *interview*. The grilling is done; this skill formalizes what's been decided. If the idea isn't sharp enough, use grill-with-docs first.

**Three-step process**:
1. **Explore**: Understand current codebase state. Use domain glossary vocabulary. Respect ADRs in the area.
2. **Sketch seams**: Identify where the feature will be tested. Prefer existing seams. Fewer seams = better (ideal: one). Confirm with user.
3. **Write and publish**: Use the template. Publish to issue tracker. Apply `ready-for-agent` label.

**Template discipline**:
- User Stories: LONG numbered list, extremely extensive, covering all aspects
- Implementation Decisions: No file paths or code snippets (they go stale fast). Exception: prototype snippets encoding decisions more precisely than prose.
- Testing Decisions: External behavior only, not implementation details
- Out of Scope: Explicit boundary

**Seam philosophy**: The fewer seams across the codebase, the better. The ideal number is one. Existing seams preferred over new ones. New seams proposed at the highest point possible.

## A1 — Upstream Typical Applications

- Post-grill formalization: grill-with-docs sharpened the idea → to-spec publishes it as a spec issue
- Feature planning: user describes a feature → to-spec synthesizes into structured spec with user stories
- Architecture decision: grill revealed a complex design → to-spec captures implementation decisions and testing approach
- Multi-ticket planning: spec is the parent issue that to-tickets will break into child tickets
- Scope definition: to-spec defines Out of Scope to prevent scope creep during implementation

## A2 — Trigger Scenarios (3 contexts + language signals + sibling distinction)

| Context | User Language Signals (≥3) | vs Sibling Skills |
|---------|---------------------------|-------------------|
| **Formalize discussion** | "write a spec", "turn this into a spec", "create a spec from this", "formalize the design" | vs grill-with-docs: grill-with-docs *sharpens the idea*; to-spec *formalizes the sharpened idea* |
| **Pre-implementation** | "before we code, write a spec", "spec out this feature", "what are we building?" | vs to-tickets: to-spec *creates the spec*; to-tickets *breaks the spec into tickets* |
| **Issue tracker publication** | "publish to the tracker", "create an issue for this", "put this on the backlog" | vs triage: triage *processes existing issues*; to-spec *creates new spec issues* |

## E — Execution Steps (each with "完成标准:")

1. **Explore repo state** — Read current codebase state. Use domain glossary. Respect ADRs in the area.  
   完成标准: Codebase state understood; domain vocabulary applied; ADRs respected.

2. **Sketch test seams** — Identify where the feature will be tested. Prefer existing seams. Propose at highest point. Confirm with user.  
   完成标准: Seams sketched; user confirmed; fewest possible seams identified.

3. **Write spec** — Use template: Problem Statement, Solution, User Stories (extensive), Implementation Decisions, Testing Decisions, Out of Scope, Further Notes.  
   完成标准: Spec complete with all sections; user stories extensive; no file paths/code snippets (except prototype exceptions).

4. **Publish to tracker** — Publish spec to configured issue tracker. Apply `ready-for-agent` triage label.  
   完成标准: Spec published as issue; `ready-for-agent` label applied; issue URL provided to user.

## B — Boundaries & Limits

**不适用**:
- Idea not sharp enough (use grill-with-docs first)
- User wants to interview about the topic (use grill-me or grill-with-docs)
- Breaking spec into tickets (use to-tickets)
- Bug diagnosis (use diagnosing-bugs)

**局限**: Spec is a snapshot — if the conversation continues after to-spec, the spec becomes stale. "No interview" means the spec is limited to what was already discussed; may miss important aspects. User stories may be incomplete if the discussion was narrow. Seams may not be optimal if codebase exploration was superficial.

## Related Skills

- **grill-with-docs** (sharpens the idea before to-spec), **to-tickets** (breaks the spec into tickets), **implement** (builds from the spec), **code-review** (verifies implementation against spec), **setup-matt-pocock-skills** (precondition for issue tracker), **domain-modeling** (provides glossary vocabulary)

## Audit

V1✓ V2✓ V3✓ | 2026-08-26 | Source: D:\outcome\self\upstream\mattpocock__skills\skills\engineering\to-spec\SKILL.md
