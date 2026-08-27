---
name: ask-matt
description: Router over the mattpocock/skills catalog. User describes a situation (e.g., "review this PR", "debug a flaky test", "design a new module") and this skill maps it to the correct skill or multi-skill flow. Trigger phrases: "which skill", "how do I", "what flow", "where do I start".
source_project: mattpocock/skills
tags: [router, meta, flow-map, engineering]
---

## R — Reference (≤100 words)

Upstream: `skills/engineering/ask-matt/SKILL.md` (90 lines). Defines the **main flow** (idea→ship via grill-with-docs → prototype detour → to-spec/to-tickets → implement with tdd + code-review), **on-ramps** (triage for incoming issues, diagnosing-bugs for hard bugs, wayfinder for huge foggy efforts), **codebase health** (improve-codebase-architecture → codebase-design), **vocabulary layer** (domain-modeling, codebase-design), **phase boundaries** (continue/clear/handoff/subagent/compact), and **standalone** skills (grill-me, grilling, resolving-merge-conflicts, prototype, research, to-questionnaire, wizard, wait-what, teach, writing-for-agents). Precondition: setup-matt-pocock-skills.

## I — Methodology (in own words)

**Core principle**: Every engineering task enters through a router that classifies the situation and prescribes the minimal skill sequence.

**Classification logic**:
1. **Is there a working directory?** → yes → grill-with-docs (stateful), no → grill-me (stateless)
2. **Is the work incoming/unstructured?** (bug reports, feature requests) → triage first
3. **Is it a hard-to-reproduce bug?** → diagnosing-bugs before any fix
4. **Is the effort too large for one session?** (greenfield, massive refactor) → wayfinder maps decision tickets first
5. **Is it routine feature work?** → main flow: grill → (prototype?) → spec/tickets → implement (tdd) → code-review
6. **Is it codebase upkeep?** → improve-codebase-architecture surfaces deepening opportunities → codebase-design for the chosen one
7. **Are terms/decisions fuzzy?** → domain-modeling sharpens CONTEXT.md/ADRs underneath everything
8. **At phase boundaries** → choose: continue/clear/handoff/subagent/compact per PHASE-BOUNDARIES.md

**Key invariant**: Keep grilling→spec→tickets in one unbroken context window until to-tickets; each implement starts fresh.

## A1 — Upstream Typical Applications

- New contributor onboarding: "I have this repo, where do I start?" → runs setup-matt-pocock-skills then explains flow map
- Mid-project confusion: "We have 50 issues, what now?" → triage → implement
- Architecture review: "This module feels wrong" → improve-codebase-architecture → codebase-design → grill-with-docs
- Debugging session: "Test flakes on CI" → diagnosing-bugs (build loop → minimise → hypothesise → instrument → fix+test)
- Design deadlock: "Should we use events or direct calls?" → grill-with-docs (stateful) or grill-me (stateless)

## A2 — Trigger Scenarios (3 contexts + language signals + sibling distinction)

| Context | User Language Signals (≥3) | vs Sibling Skills |
|---------|---------------------------|-------------------|
| **New task, unclear entry point** | "which skill", "what flow", "how do I start", "map the skills", "where begin" | vs grill-me/grill-with-docs: those *are* the entry points; ask-matt *chooses* them |
| **Mid-stream reorientation** | "am I on the right track", "should I switch approach", "this feels too big", "what next" | vs wayfinder: wayfinder is for *huge* foggy efforts; ask-matt routes to wayfinder only when warranted |
| **Process audit** | "review our workflow", "are we using skills right", "check if we missed a step" | vs code-review: code-review audits *code diffs*; ask-matt audits *skill selection* |

## E — Execution Steps (each with "完成标准:")

1. **Elicit situation** — Ask user to describe the current task, repo state, and pain point in 2–3 sentences.  
   完成标准: User provides concrete context (working dir? existing issues? bug vs feature? team size?).

2. **Classify on dimensions** — Map to: (a) working dir Y/N, (b) incoming vs self-generated, (c) bug vs feature vs upkeep, (d) session-scale vs multi-session, (e) term clarity.  
   完成标准: All 5 dimensions answered explicitly.

3. **Select primary skill/flow** — Apply classification logic above; output single primary skill slug + optional on-ramp.  
   完成标准: One primary skill named with rationale referencing dimensions.

4. **Prescribe sequence** — List the ordered skill slugs to invoke (e.g., `grill-with-docs → to-spec → to-tickets → implement`).  
   完成标准: Sequence is acyclic, each step's output feeds the next, no gaps.

5. **Flag preconditions** — Note if setup-matt-pocock-skills, CONTEXT.md, or issue tracker needed first.  
   完成标准: Every missing precondition listed with remediation command.

6. **Hand off** — Invoke the first skill in the sequence (or instruct user to).  
   完成标准: First skill invoked or user given exact invocation command.

## B — Boundaries & Limits

**不适用**:
- User already knows the skill and just wants to invoke it (direct invocation is faster)
- Pure code review of a diff (use code-review directly)
- Pure bug diagnosis (use diagnosing-bugs directly)
- Writing documentation (use writing-for-agents)

**局限**: Router knowledge is static to the skill catalog version; new skills added upstream require this skill's R section update. Does not execute the work—only prescribes.

## Related Skills

- **grill-with-docs** (stateful entry), **grill-me** (stateless entry), **triage** (incoming issues), **diagnosing-bugs** (hard bugs), **wayfinder** (huge efforts), **improve-codebase-architecture** (upkeep), **domain-modeling** (vocabulary), **codebase-design** (module shape), **code-review** (diff audit), **implement** (build), **to-spec/to-tickets** (planning), **prototype** (detour), **research** (legwork), **setup-matt-pocock-skills** (precondition)

## Audit

V1✓ V2✓ V3✓ | 2026-08-26 | Source: D:\outcome\self\upstream\mattpocock__skills\skills\engineering\ask-matt\SKILL.md