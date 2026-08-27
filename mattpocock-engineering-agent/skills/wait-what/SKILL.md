---
name: wait-what
description: Stop — that last message did not land. Re-pitch it with more context, using ASD-STE100 Simplified Technical English and the ubiquitous language from CONTEXT.md. Use mid-conversation inside any other skill when the user says "wait, what?", "I don't understand", "explain that again", "what do you mean?". The corrective for miscommunication; grilling-with-docs is the upfront cure.
source_project: mattpocock/skills
tags: [communication, re-pitch, simplified-english, context-md, productivity]
---

## R — Reference (≤100 words)

Upstream: `skills/productivity/wait-what/SKILL.md` (7 lines). Wait, I don't understand where you've got to here. Re-pitch that: give me a little bit of context, talk in ASD-STE100 Simplified Technical English, and use the ubiquitous language from `CONTEXT.md` (follow `CONTEXT-MAP.md` to the right one if the repo has more than one). The corrective for a message that didn't land. Works after the fact; grill-with-docs is the upfront cure, because a shared language agreed early is what stops the jargon arriving at all.

## I — Methodology (in own words)

**Core principle**: When communication fails, *re-pitch* with more context, simpler language, and domain vocabulary. Don't just repeat — restructure.

**Three adjustments on re-pitch**:
1. **Add context**: The original message assumed knowledge the listener didn't have. Supply the missing context.
2. **Simplify language**: Use ASD-STE100 Simplified Technical English — short sentences, one meaning per sentence, controlled vocabulary.
3. **Use domain vocabulary**: Apply the ubiquitous language from CONTEXT.md. If the repo has multiple contexts, follow CONTEXT-MAP.md to the right one.

**When to use**: Mid-conversation, inside any other skill. The user says "wait, what?" or equivalent. This is a *corrective* — it fixes miscommunication after it happens.

**vs grill-with-docs**: grill-with-docs is the *upfront cure* — a shared language agreed early prevents jargon from arriving. wait-what is the *after-the-fact fix* when the upfront cure wasn't applied or didn't work.

**Scope**: wait-what only re-pitches the *last message*. It doesn't restart the conversation or redesign the approach. It's a surgical correction, not a reset.

## A1 — Upstream Typical Applications

- Technical jargon: agent used "leverage" in the codebase-design sense → user confused → wait-what re-pitches with plain English + CONTEXT.md definition
- Context gap: agent referenced an ADR the user hasn't read → user confused → wait-what adds the ADR context
- Assumed knowledge: agent assumed familiarity with a library → user confused → wait-what explains the library briefly
- Domain term mismatch: agent used "account" differently than CONTEXT.md defines → user confused → wait-what aligns with CONTEXT.md
- Complex explanation: agent gave a multi-step explanation → user lost → wait-what restructures into simpler steps

## A2 — Trigger Scenarios (3 contexts + language signals + sibling distinction)

| Context | User Language Signals (≥3) | vs Sibling Skills |
|---------|---------------------------|-------------------|
| **Mid-conversation confusion** | "wait, what?", "I don't understand", "explain that again", "what do you mean?" | vs grill-me: grill-me interviews *about a topic*; wait-what re-pitches *the last message* |
| **Jargon correction** | "you're using jargon", "I don't know that term", "speak plainly", "use simpler language" | vs domain-modeling: domain-modeling *updates CONTEXT.md*; wait-what *uses existing CONTEXT.md* to re-pitch |
| **Context gap** | "you assumed I knew that", "what are you referring to?", "give me more context", "I haven't read that" | vs grill-with-docs: grill-with-docs *builds shared language upfront*; wait-what *fixes miscommunication after the fact* |

## E — Execution Steps (each with "完成标准:")

1. **Identify the misunderstanding** — What specifically did the user not understand? Which part of the last message failed to land?  
   完成标准: Specific misunderstanding identified; which part of the message failed.

2. **Locate CONTEXT.md** — Check if CONTEXT.md exists. If multiple contexts, follow CONTEXT-MAP.md to the right one.  
   完成标准: CONTEXT.md located (or "no CONTEXT.md" noted); ubiquitous language available.

3. **Re-pitch with three adjustments** — (1) Add missing context. (2) Simplify to ASD-STE100. (3) Use CONTEXT.md vocabulary. One meaning per sentence.  
   完成标准: Re-pitched message uses plain English, includes context, applies domain vocabulary.

4. **Confirm understanding** — Ask user if the re-pitched message landed. If not, iterate with further simplification.  
   完成标准: User confirms understanding; no further confusion.

## B — Boundaries & Limits

**不适用**:
- No CONTEXT.md exists (can't use domain vocabulary — just simplify language)
- User wants to discuss a new topic (use grill-me or grill-with-docs)
- User wants to review code (use code-review)
- User wants to diagnose a bug (use diagnosing-bugs)

**局限**: wait-what only fixes the *last message* — if confusion accumulated over multiple messages, a full re-explanation may be needed. ASD-STE100 may be too restrictive for complex technical concepts. CONTEXT.md may not have the right term. Works mid-conversation; can't fix confusion discovered after the conversation ended.

## Related Skills

- **grill-with-docs** (upfront cure: builds shared language early), **domain-modeling** (maintains CONTEXT.md vocabulary), **grill-me** (stateless interview for topic discussion), **writing-for-agents** (design principles for clear communication)

## Audit

V1✓ V2✓ V3✓ | 2026-08-26 | Source: D:\outcome\self\upstream\mattpocock__skills\skills\productivity\wait-what\SKILL.md
