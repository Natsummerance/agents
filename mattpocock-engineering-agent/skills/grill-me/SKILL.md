---
name: grill-me
description: Stateless relentless interview to sharpen a plan, design, or piece of writing. No working directory, no CONTEXT.md, no ADRs—pure thinking. Invokes the grilling primitive (rounds, frontier, facts=agent job, decisions=user). Use when not in a repo: sharpening a talk, a design doc, a life decision, any thinking with no codebase under it. Trigger: "grill me", "stress-test my plan", "interview me about".
source_project: mattpocock/skills
tags: [interview, grilling, stateless, planning, design, productivity]
---

## R — Reference (≤100 words)

Upstream: `skills/productivity/grill-me/SKILL.md` (7 lines). Delegates entirely to the `grilling` skill. Description: "A relentless interview to sharpen a plan or design." Key distinction from grill-with-docs: **stateless**—saves nothing locally, builds no CONTEXT.md. Use when **not working in a working directory** (sharpening a plan, design, writing, anything with no repo). If in a working directory, use grill-with-docs instead (same interview + paper trail = strictly better).

## I — Methodology (in own words)

**Core principle**: Same grilling primitive as grill-with-docs, but *no artifacts left behind*. Pure thinking partner.

**Grilling primitive** (from grilling skill):
- **Design tree**: every decision branches into dependent decisions
- **Rounds**: work the **frontier** (decisions whose prerequisites are settled)
- **Format per question**: numbered, body with choices, agent's recommended answer
- **Facts = agent's job**: dispatch sub-agents for filesystem/tools; never ask user what agent can look up
- **Decisions = user's job**: put each to user, wait for answer
- **Done when frontier empty**: every branch visited, nothing silently assumed

**Stateless constraints**: No CONTEXT.md, no ADRs, no repo coupling. Session ends → context gone (unless user copies). Use for: talk prep, design docs, architecture sketches, life decisions, writing outlines—anything without a codebase.

**Entry point**: User says "grill me" or describes a plan/design they want stress-tested.

## A1 — Upstream Typical Applications

- Conference talk prep: "grill me on my talk outline" → rounds expose weak transitions, missing evidence
- Architecture decision: "should we use Kafka or RabbitMQ?" → frontier questions on throughput, ops burden, team familiarity
- Writing project: "stress-test this book proposal" → rounds on audience, chapter flow, differentiation
- Career move: "grill me on this job offer" → frontier on growth, culture, compensation, location
- Product strategy: "interview me about this roadmap" → rounds on sequencing, dependencies, metrics

## A2 — Trigger Scenarios (3 contexts + language signals + sibling distinction)

| Context | User Language Signals (≥3) | vs Sibling Skills |
|---------|---------------------------|-------------------|
| **No-repo thinking** | "grill me", "stress-test my plan", "interview me", "no codebase", "just thinking" | vs grill-with-docs: that skill *requires* a working directory and creates CONTEXT.md/ADRs; grill-me is stateless |
| **Design/doc sharpening** | "sharpen this design", "poke holes in my proposal", "find blind spots" | vs grill-with-docs: same interview primitive; grill-me leaves no paper trail |
| **Quick clarification** | "help me think through", "talk this through", "rubber duck" | vs grilling: grilling is the *primitive*; grill-me is the *named stateless entry* |

## E — Execution Steps (each with "完成标准:")

1. **Confirm stateless context** — Verify user has no working directory or explicitly wants no artifacts.  
   完成标准: User confirms "no repo" or "stateless only".

2. **Invoke grilling primitive** — Call Skill tool for "grilling". The primitive takes over: builds design tree, computes frontier, runs rounds.  
   完成标准: Grilling skill invoked; first round of questions presented.

3. **Run rounds until frontier empty** — Each round: agent asks all frontier questions with recommended answers; user answers; tree updates; next frontier computed. Agent finds facts via sub-agents.  
   完成标准: All rounds completed; user confirmed shared understanding; no open frontier questions.

4. **Summarize outcome** — Produce a clean summary of decisions made, open risks, and next steps (no artifacts saved).  
   完成标准: Summary delivered; user can copy/paste; no files written.

## B — Boundaries & Limits

**不适用**:
- Working in a git repo (use grill-with-docs—strictly better, leaves paper trail)
- Need to record decisions for team (use grill-with-docs)
- Need domain modeling / ADRs (use grill-with-docs which invokes domain-modeling)
- Bug diagnosis (use diagnosing-bugs)

**局限**: No persistence—session context lost on clear/compact. No CONTEXT.md for future sessions. No ADR trail. Not for codebase work.

## Related Skills

- **grilling** (the primitive this skill invokes), **grill-with-docs** (stateful counterpart), **domain-modeling** (invoked by grill-with-docs, not this), **wayfinder** (for huge foggy efforts, uses grilling internally), **triage** (uses grilling internally), **improve-codebase-architecture** (uses grilling internally)

## Audit

V1✓ V2✓ V3✓ | 2026-08-26 | Source: D:\outcome\self\upstream\mattpocock__skills\skills\productivity\grill-me\SKILL.md