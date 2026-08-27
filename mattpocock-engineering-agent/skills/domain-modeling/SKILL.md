---
name: domain-modeling
description: Active discipline for building and sharpening a project's domain model. Maintains CONTEXT.md (glossary only, no implementation details) and ADRs (hard-to-reverse, surprising-without-context, genuine-tradeoff decisions). Challenges term conflicts, sharpens fuzzy language, stress-tests with concrete scenarios, cross-references code. Use when discussing codebase terminology, writing/editing CONTEXT.md, or recording/editing an ADR.
source_project: mattpocock/skills
tags: [domain, modeling, glossary, adr, context, ubiquitous-language, engineering]
---

## R — Reference (≤100 words)

Upstream: `skills/engineering/domain-modeling/SKILL.md` (74 lines). File structure: single context → `/CONTEXT.md` + `/docs/adr/`; multi-context → `/CONTEXT-MAP.md` pointing to per-context `CONTEXT.md` + `docs/adr/` under each (e.g., `src/ordering/`, `src/billing/`). Create lazily. **During session**: (1) Challenge against glossary—call out conflicts immediately. (2) Sharpen fuzzy language—propose canonical terms for overloaded words. (3) Discuss concrete scenarios—invent edge cases probing boundaries. (4) Cross-reference with code—surface contradictions. (5) Update CONTEXT.md inline—capture as they happen, format per CONTEXT-FORMAT.md. (6) Offer ADRs sparingly—only when all 3 true: hard to reverse, surprising without context, result of real trade-off. ADR format per ADR-FORMAT.md. CONTEXT.md is glossary only—never spec, scratchpad, or implementation decisions.

## I — Methodology (in own words)

**Core principle**: Domain model is a *living glossary*, not a spec. It evolves by active challenge, not passive documentation.

**Two artifacts, distinct purposes**:
- **CONTEXT.md** = ubiquitous language glossary (terms → canonical definitions). Zero implementation detail. Updated *inline* during conversation.
- **ADR** = architectural decision record for *hard-to-reverse, surprising, trade-off* decisions. Format: context, decision, consequences. Created sparingly.

**Active discipline loop** (runs continuously during any design/discussion):
1. **Listen** for term usage
2. **Challenge** against current CONTEXT.md (conflict? fuzzy? overloaded?)
3. **Stress-test** with concrete edge-case scenarios
4. **Verify** against actual code (code is truth)
5. **Resolve** → update CONTEXT.md immediately
6. **Evaluate** ADR criteria → create if all 3 met

**Multi-context support**: CONTEXT-MAP.md at root maps bounded contexts. Each context owns its glossary + ADRs. System-wide ADRs at root `/docs/adr/`.

**Cross-reference as truth check**: "Your code cancels entire Orders, but you said partial cancellation is possible. Which is right?" — code wins, glossary updates.

## A1 — Upstream Typical Applications

- New project: first term resolved → create CONTEXT.md
- Team onboarding: "what does 'cancellation' mean?" → CONTEXT.md answers
- Design discussion: "account means Customer or User?" → sharpen to canonical term
- Boundary dispute: "Order vs OrderLine responsibility" → invent scenario (partial cancel, split shipment) → force precision
- Decision recording: "why event-sourced orders?" → ADR 0001 (hard to reverse, surprising, trade-off vs CRUD)

## A2 — Trigger Scenarios (3 contexts + language signals + sibling distinction)

| Context | User Language Signals (≥3) | vs Sibling Skills |
|---------|---------------------------|-------------------|
| **Term confusion in discussion** | "what do you mean by X", "we use X for two things", "ambiguous term", "glossary" | vs codebase-design: domain-modeling owns *domain terms*; codebase-design owns *module interfaces/seams* |
| **Decision needs recording** | "why did we choose", "document this decision", "ADR", "trade-off" | vs grill-with-docs: grill-with-docs *drives* domain-modeling; domain-modeling is the *discipline* it invokes |
| **Code/language mismatch** | "code does X but we say Y", "implementation contradicts", "sync terms" | vs code-review: code-review checks *diff vs standards/spec*; domain-modeling aligns *running code vs glossary* |

## E — Execution Steps (each with "完成标准:")

1. **Ensure CONTEXT.md exists** — Check root or context-specific path. Create lazily on first term resolution.  
   完成标准: CONTEXT.md file exists at correct location (root or context dir).

2. **Challenge term usage in real time** — When user uses a term, check CONTEXT.md. Conflict? Fuzzy? Overloaded? Call out immediately.  
   完成标准: Every term conflict/fuzziness surfaced in conversation before moving on.

3. **Propose canonical sharpening** — For each fuzzy/overloaded term, propose precise canonical definition with examples.  
   完成标准: Canonical term + definition written to CONTEXT.md (per CONTEXT-FORMAT.md).

4. **Stress-test with scenarios** — Invent 2-3 concrete edge-case scenarios probing the term's boundaries. User answers force precision.  
   完成标准: Scenarios documented in CONTEXT.md as "examples" or "edge cases" for the term.

5. **Cross-reference code** — Search codebase for the term's implementation. Surface any contradiction.  
   完成标准: Code vs glossary alignment verified; discrepancies resolved (code or glossary updated).

6. **Evaluate ADR need** — Check 3 criteria: hard to reverse? surprising without context? genuine trade-off? If all yes, create ADR.  
   完成标准: ADR created per ADR-FORMAT.md or explicit "criteria not met" note.

## B — Boundaries & Limits

**不适用**:
- Reading CONTEXT.md for vocabulary only (that's a one-line habit, not this skill)
- Pure implementation decisions (not domain terms)
- Bug diagnosis (use diagnosing-bugs)
- Code review (use code-review)

**局限**: CONTEXT.md drift if not actively maintained. ADR criteria subjective—teams may over/under-create. Multi-context adds CONTEXT-MAP.md overhead. Requires discipline to update inline, not batch.

## Related Skills

- **codebase-design** (module interfaces reference domain terms), **grill-with-docs** (invokes this skill during grilling), **improve-codebase-architecture** (may surface domain confusion), **tdd** (tests use domain terms), **implement** (code reflects domain model), **to-spec** (spec uses canonical terms)

## Audit

V1✓ V2✓ V3✓ | 2026-08-26 | Source: D:\outcome\self\upstream\mattpocock__skills\skills\engineering\domain-modeling\SKILL.md