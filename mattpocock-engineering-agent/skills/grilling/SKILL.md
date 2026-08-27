---
name: grilling
description: The core interview primitive: relentless rounds over a design tree. Builds a tree of decisions, computes the frontier (questions whose prerequisites are settled), asks the whole frontier in numbered rounds with recommended answers. Facts = agent's job (sub-agents); decisions = user's job. Done when frontier empty. Use directly when you want the interview with no wrapper; or invoked by grill-me, grill-with-docs, triage, wayfinder, improve-codebase-architecture.
source_project: mattpocock/skills
tags: [interview, primitive, design-tree, frontier, rounds, facts-vs-decisions, productivity]
---

## R — Reference (≤100 words)

Upstream: `skills/productivity/grilling/SKILL.md` (28 lines). **Design tree**: every decision branches into dependent decisions. **Rounds**: work the **frontier** (decisions whose prerequisites are settled). Ask whole frontier in one round: number each question, give body with choices, give recommended answer. Wait for user answers before next round. **Format**: `❓ QN - <title>: <body>` + `➡️ <recommended answer>` separated by `---`. **Facts = agent's job**: dispatch sub-agents for filesystem/tools; never ask user what agent can look up. Don't block: running exploration = unsettled prerequisite; only downstream questions wait. **Decisions = user's job**: put each to user, wait. **Done when frontier empty**: every branch visited, nothing silently assumed. No action until user confirms shared understanding.

## I — Methodology (in own words)

**Core principle**: Structured thinking as a tree traversal. The frontier is the *current cut* of answerable questions. Each round widens the cut.

**Design tree mechanics**:
- Root = initial topic/goal
- Nodes = decisions (not facts)
- Edges = "depends on" (prerequisite)
- Frontier = nodes whose all prerequisites are answered

**Round protocol**:
1. Compute frontier from current tree
2. For each frontier node: formulate question with context, choices, recommended answer
3. Present all frontier questions in one batch (numbered, separated)
4. User answers all (or defers)
5. Update tree: answered nodes become settled; new nodes unlock
6. Repeat until frontier empty

**Fact/decision separation**: 
- Agent *must* find facts (code, docs, web, tools) via sub-agents
- User *must* make decisions (trade-offs, preferences, commitments)
- Never invert: asking user for facts wastes their time; agent deciding violates agency

**Sub-agent concurrency**: Fact-finding for multiple frontier questions runs in parallel. Questions whose facts are still loading stay in next round's frontier.

**Completion**: Frontier empty + user confirms "shared understanding reached". No execution until confirmation.

## A1 — Upstream Typical Applications

- Standalone design session: "grill me on this API design" → tree: auth strategy → rate limiting → versioning → error format
- Embedded in triage: triage uses grilling to sharpen incoming issue into agent-ready ticket
- Embedded in wayfinder: wayfinder uses grilling to resolve each decision ticket on the map
- Embedded in improve-codebase-architecture: uses grilling to design the chosen deepening
- Ad-hoc: "run grilling on this one decision" → single-round tree

## A2 — Trigger Scenarios (3 contexts + language signals + sibling distinction)

| Context | User Language Signals (≥3) | vs Sibling Skills |
|---------|---------------------------|-------------------|
| **Raw primitive access** | "run grilling", "use the primitive", "just the interview", "no wrapper" | vs grill-me/grill-with-docs: those are *named entries* with wrappers (stateless/stateful); grilling is the *bare primitive* |
| **Embedded in other skill** | (internal invocation by triage/wayfinder/improve-codebase-architecture) | vs those skills: they *compose* grilling; grilling has no opinion on *what* is being grilled |
| **Single-decision deep dive** | "grill this one decision", "deep dive on X", "stress-test this choice" | vs grill-me: grill-me runs full session; grilling can run on a sub-tree |

## E — Execution Steps (each with "完成标准:")

1. **Establish root topic** — User states the goal/decision space. Agent creates root node of design tree.  
   完成标准: Root node captured; initial frontier = {root} (or root's immediate children if pre-split).

2. **Compute and present frontier** — List all nodes whose prerequisites are settled. Format each as numbered question with choices + recommended answer.  
   完成标准: Round formatted per spec (❓ QN - title: body / ➡️ recommended / ---).

3. **Dispatch fact-finding sub-agents** — For any frontier question needing external facts, spawn sub-agents in parallel. Do not wait; mark those questions as "awaiting facts" for next round.  
   完成标准: Sub-agents launched; non-blocking questions asked now; fact-dependent questions deferred.

4. **Collect user decisions** — User answers each question. Agent updates tree: answered nodes settled, new children added.  
   完成标准: All presented questions answered; tree updated; new frontier computed.

5. **Iterate rounds** — Repeat steps 2-4 until frontier empty.  
   完成标准: Frontier empty; no unanswered prerequisite nodes.

6. **Confirm shared understanding** — Present final decision tree summary. Ask user to confirm "shared understanding reached".  
   完成标准: User explicitly confirms; no action taken before confirmation.

## B — Boundaries & Limits

**不适用**:
- User wants a wrapper with artifacts (use grill-me or grill-with-docs)
- Bug diagnosis (use diagnosing-bugs)
- Code review (use code-review)
- Implementation (use implement/tdd)

**局限**: No persistence mechanism (caller must handle). No domain-modeling integration (caller composes). Can go deep—frontier may expand faster than user answers. Requires user engagement (decisions are theirs).

## Related Skills

- **grill-me** (stateless wrapper), **grill-with-docs** (stateful wrapper + domain-modeling), **triage** (composes grilling), **wayfinder** (composes grilling), **improve-codebase-architecture** (composes grilling), **domain-modeling** (often composed with grilling), **to-questionnaire** (inverse: interviews user about send)

## Audit

V1✓ V2✓ V3✓ | 2026-08-26 | Source: D:\outcome\self\upstream\mattpocock__skills\skills\productivity\grilling\SKILL.md