---
name: grill-with-docs
description: Stateful relentless interview (grilling primitive) that also creates durable docs: CONTEXT.md glossary and ADRs via domain-modeling. Use when working in a working directory and you want to sharpen a plan/design while leaving a paper trail. Trigger: "grill with docs", "grill this design", "sharpen with docs", "design session with records".
source_project: mattpocock/skills
tags: [interview, grilling, stateful, docs, adr, context, domain-modeling, engineering]
---

## R — Reference (≤100 words)

Upstream: `skills/engineering/grill-with-docs/SKILL.md` (7 lines). Delegates to two skills: **grilling** (the interview primitive: rounds, frontier, facts=agent, decisions=user) + **domain-modeling** (active discipline: challenge terms, sharpen language, stress-test scenarios, cross-reference code, update CONTEXT.md inline, offer ADRs sparingly). Description: "A relentless interview to sharpen a plan or design, which also creates docs (ADR's and glossary) as we go." Key distinction from grill-me: **stateful**—requires working directory, creates/maintains CONTEXT.md and ADRs. If in a working directory, this is strictly better than grill-me (same interview + paper trail).

## I — Methodology (in own words)

**Core principle**: Grilling + domain-modeling = thinking + durable memory. Every design session leaves the codebase smarter.

**Dual-skill invocation**: This skill *is* the composition of two upstream skills:
1. **grilling** drives the interview: design tree, frontier, rounds, fact-finding sub-agents, user decisions
2. **domain-modeling** runs continuously alongside: every term used gets checked against CONTEXT.md, sharpened, stress-tested, cross-referenced with code, written to CONTEXT.md; ADRs offered when criteria met

**Stateful artifacts produced**:
- `CONTEXT.md` (glossary, per CONTEXT-FORMAT.md) — updated inline during grilling
- `docs/adr/NNNN-title.md` (per ADR-FORMAT.md) — created when trade-off decisions land
- If multi-context: `CONTEXT-MAP.md` + per-context `CONTEXT.md`/`docs/adr/`

**Flow**: User brings a design/plan → grilling rounds proceed → domain-modeling intercepts every term/decision → artifacts grow → session ends with shared understanding *and* committed vocabulary/decisions.

**Entry point**: "grill with docs" or any design discussion in a repo directory.

## A1 — Upstream Typical Applications

- New feature design: "grill with docs on the payment refactor" → CONTEXT.md gets "PaymentMethod", "Refund", "IdempotencyKey"; ADR for "event-sourced vs CRUD"
- Architecture review: "grill this module boundary" → seam placement decisions → ADR for "seam at Repository interface"
- Onboarding: new dev runs grill-with-docs on existing module → CONTEXT.md captures tribal knowledge
- Pre-implementation: "grill before we code" → spec emerges + vocabulary locked → to-spec → to-tickets → implement

## A2 — Trigger Scenarios (3 contexts + language signals + sibling distinction)

| Context | User Language Signals (≥3) | vs Sibling Skills |
|---------|---------------------------|-------------------|
| **Repo design session** | "grill with docs", "design session", "sharpen with records", "leave a paper trail" | vs grill-me: grill-me is stateless/no repo; grill-with-docs *requires* repo + creates CONTEXT.md/ADRs |
| **Vocabulary capture** | "capture our terms", "document our language", "build the glossary", "CONTEXT.md" | vs domain-modeling: domain-modeling is the *discipline*; grill-with-docs is the *session* that drives it |
| **Decision recording** | "record this decision", "why did we choose", "ADR for this", "trade-off doc" | vs domain-modeling alone: grill-with-docs *includes* grilling to reach the decision; domain-modeling just records it |

## E — Execution Steps (each with "完成标准:")

1. **Verify working directory** — Confirm git repo exists; locate/create CONTEXT.md (root or context-specific per CONTEXT-MAP.md).  
   完成标准: Repo root identified; CONTEXT.md exists or created; CONTEXT-MAP.md checked.

2. **Invoke grilling + domain-modeling** — Call Skill tool for both "grilling" and "domain-modeling". Grilling drives rounds; domain-modeling intercepts terms/decisions.  
   完成标准: Both skills active; first grilling round presented; domain-modeling monitoring.

3. **Run grilling rounds with domain capture** — Each round: agent asks frontier questions; user answers; domain-modeling challenges terms, sharpens, stress-tests, cross-references code, updates CONTEXT.md inline.  
   完成标准: Each round completes with CONTEXT.md updated for any new/changed terms.

4. **Create ADRs for trade-off decisions** — When a decision meets all 3 criteria (hard to reverse, surprising, genuine trade-off), domain-modeling creates ADR.  
   完成标准: ADR file created in correct location (root or context docs/adr/) per ADR-FORMAT.md.

5. **Converge on shared understanding** — Continue rounds until frontier empty. Final CONTEXT.md + ADRs represent the session's output.  
   完成标准: Frontier empty; user confirms shared understanding; CONTEXT.md/ADRs committed or staged.

## B — Boundaries & Limits

**不适用**:
- No working directory (use grill-me)
- Pure thinking/writing with no codebase (use grill-me)
- Bug diagnosis (use diagnosing-bugs)
- Code review (use code-review)
- Pure domain modeling without interview (use domain-modeling directly)

**局限**: Requires git repo. CONTEXT.md/ADRs need team buy-in to maintain. Session can be long—frontier may expand. Large repos may have stale CONTEXT.md needing refresh.

## Related Skills

- **grilling** (primitive), **domain-modeling** (discipline), **grill-me** (stateless counterpart), **codebase-design** (vocabulary for module seams), **to-spec/to-tickets** (consumes grill-with-docs output), **implement** (builds from tickets), **improve-codebase-architecture** (may trigger grill-with-docs), **setup-matt-pocock-skills** (precondition for ADR dir layout)

## Audit

V1✓ V2✓ V3✓ | 2026-08-26 | Source: D:\outcome\self\upstream\mattpocock__skills\skills\engineering\grill-with-docs\SKILL.md