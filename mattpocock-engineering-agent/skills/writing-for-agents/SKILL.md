---
name: writing-for-agents
description: Reference for writing documents agents consume: skills, AGENTS.md/CLAUDE.md, pointed-at docs. Covers context pointers, the two loads (context load vs cognitive load), information hierarchy (in-file steps → in-file reference → disclosed reference), steps and completion criteria, when to split, leading words, pruning. Use when the user says "write a skill", "design an AGENTS.md", "how to write for agents", "optimize this document for agent consumption".
source_project: mattpocock/skills
tags: [writing, agents, skills, context-pointers, information-hierarchy, leading-words, productivity]
---

## R — Reference (≤100 words)

Upstream: `skills/productivity/writing-for-agents/SKILL.md` (81 lines). Reference for writing any document an agent consumes. **Context pointer**: reference held in agent's context that names out-of-context material and encodes the condition for reaching it. Pointer's wording decides when agent reaches the material. Every word of an always-loaded pointer costs on every turn. **Two loads**: context load (cost of always-loaded material on agent's window) and cognitive load (cost on human — which documents exist and when to reach for each). **Information hierarchy**: in-file step (primary) → in-file reference (consulted on demand) → disclosed reference (pushed out behind pointer). Progressive disclosure = move down the ladder so top stays legible. **Steps and completion criteria**: every step ends on a completion criterion — clarity (can agent tell done from not-done?) + demand (how much it requires). **When to split**: by sequence (post-completion steps tempt rushing) or by invocation (skill-specific). **Leading words**: compact concepts already in model's pretraining that agent thinks with (e.g., "tight loop", "red on the bug"). **Pruning**: single source of truth, environment as source of truth, relevance check, hunt no-ops.

## I — Methodology (in own words)

**Core principle**: Writing for agents is *predictable process*, not *consistent output*. The same levers make each document predictable because the agent takes the same process every run.

**Context pointers**: Wording decides when agent reaches the material. Front-load the leading word. One trigger per branch. Cut identity the body already carries.

**Two loads**:
- **Context load**: Cost of always-loaded material (AGENTS.md lines, skill descriptions). Every word costs on every turn.
- **Cognitive load**: Cost on human — which documents exist and when to reach for each. The human is the index. Not a cost to minimize — it's the price of human agency.

**Information hierarchy**: 
1. In-file step (what agent does, in order)
2. In-file reference (consulted on demand)
3. Disclosed reference (pushed behind pointer, loaded only when pointer fires)

**Completion criteria**: Every step ends on a criterion with clarity (done vs not-done) and demand (how much it requires). Strongest criteria are both checkable and exhaustive.

**Leading words**: Compact concepts from model's pretraining (e.g., "tight" for fast+deterministic+low-overhead). Repeated as token, never sentence. Recruit priors the model already holds. Hunt for opportunities to refactor with leading words.

**Pruning**: Single source of truth. Environment as source of truth. Relevance check (does line still bear on task?). Hunt no-ops (instructions model already obeys by default).

## A1 — Upstream Typical Applications

- Skill authoring: writing a new skill → context pointer in skill description decides triggering → information hierarchy structures the SKILL.md
- AGENTS.md design: writing project-level agent instructions → context pointers to docs → completion criteria for each section
- Doc optimization: existing doc is too long → disclose reference behind pointers → split by branch → prune no-ops
- Leading word refactoring: "fast, deterministic, low-overhead" → "tight" (saves tokens + sharper hook)
- Pruning session: review every line for relevance → delete no-ops → consolidate duplicates → update stale content

## A2 — Trigger Scenarios (3 contexts + language signals + sibling distinction)

| Context | User Language Signals (≥3) | vs Sibling Skills |
|---------|---------------------------|-------------------|
| **Skill authoring** | "write a skill", "design a SKILL.md", "how should I structure this skill", "skill best practices" | vs implement: implement *builds code*; writing-for-agents *designs the documents agents consume* |
| **AGENTS.md/CLAUDE.md design** | "design AGENTS.md", "write project instructions", "how to structure agent docs", "optimize for agent consumption" | vs setup-matt-pocock-skills: setup-matt-pocock-skills *configures the skill environment*; writing-for-agents *designs the documents within it* |
| **Document optimization** | "this doc is too long", "agent isn't following instructions", "optimize this for agents", "reduce context load" | vs wait-what: wait-what *re-pitches a message*; writing-for-agents *redesigns the document structure* |

## E — Execution Steps (each with "完成标准:")

1. **Identify the document type** — Skill, AGENTS.md, pointed-at doc, or other. Determine which levers apply.  
   完成标准: Document type identified; applicable levers listed.

2. **Design context pointers** — For any material behind pointers: front-load leading word, one trigger per branch, cut redundant identity.  
   完成标准: Each pointer has leading word, one trigger per branch, no redundant identity.

3. **Structure information hierarchy** — Place each piece on the right rung: in-file step (primary), in-file reference (on demand), disclosed reference (behind pointer). Apply progressive disclosure.  
   完成标准: Every piece on correct rung; top stays legible; branching test applied.

4. **Write completion criteria** — For each step: clarity (done vs not-done) + demand (how much it requires). Strongest = checkable + exhaustive.  
   完成标准: Every step has completion criterion; clarity + demand present.

5. **Apply leading words** — Hunt for triads that can collapse into one token. Refactor with leading words.  
   完成标准: Leading words identified; refactorings applied where possible.

6. **Prune** — Single source of truth. Check relevance. Hunt no-ops. Delete or consolidate.  
   完成标准: Duplicates removed; no-ops deleted; relevance verified.

## B — Boundaries & Limits

**不适用**:
- Writing human-facing documentation (different design principles)
- Writing code (use implement/tdd)
- Bug diagnosis (use diagnosing-bugs)
- Architecture design (use codebase-design + grill-with-docs)

**局限**: Leading words depend on model's pretraining — a word too weak to beat the default is a no-op. Completion criteria may be irreducibly fuzzy for some steps. Progressive disclosure may hide material the agent actually needs. Pruning requires ongoing discipline — without it, documents accumulate sediment. Two people may disagree about what's a no-op (model-relative, not reader-relative).

## Related Skills

- **teach** (designs lessons for human learners, not agents), **wait-what** (re-pitches messages, doesn't redesign documents), **setup-matt-pocock-skills** (configures skill environment), **grill-with-docs** (produces CONTEXT.md that writing-for-agents designs)

## Audit

V1✓ V2✓ V3✓ | 2026-08-26 | Source: D:\outcome\self\upstream\mattpocock__skills\skills\productivity\writing-for-agents\SKILL.md
