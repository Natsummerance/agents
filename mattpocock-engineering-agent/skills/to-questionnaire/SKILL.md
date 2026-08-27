---
name: to-questionnaire
description: Turn a decision you can't fully answer into a questionnaire for someone else to fill in. Grills the *send* (who it goes to, what you need back), not the *subject*. Produces a structured Markdown document aimed at the knowledge gap between recipient and requester. Use when the user says "I need to ask someone about X", "generate questions for Y", "I don't know enough to decide", or "create a questionnaire".
source_project: mattpocock/skills
tags: [questionnaire, knowledge-gap, async-communication, decision-support, productivity]
---

## R — Reference (≤100 words)

Upstream: `skills/productivity/to-questionnaire/SKILL.md` (54 lines). Turn something the user can't answer alone into a questionnaire: a Markdown document they hand to one person to fill in async, or fill out together over a meeting. **Grill the send, not the subject.** Interview the user only about the *send*, which they can always answer: who it goes to, and what they need back. Process: (1) Who is it going to? — recipient's role, expertise, relationship. (2) What do you need back? — specific decisions or facts. (3) Write the questionnaire — draft questions aimed at the gap, following template (Purpose, From/To/How, Context, How to answer, Theme headings with questions, Anything else). Write to `to-questionnaire-<slug>.md`.

## I — Methodology (in own words)

**Core principle**: *Grill the send, not the subject.* The user can always answer who the recipient is and what they need. The recipient holds knowledge the user lacks. The questionnaire bridges that gap.

**Three-step process**:
1. **Who is it going to?** — In one exchange: recipient's role, expertise, relationship to user. This fixes tone and context depth.
2. **What do you need back?** — In one exchange: specific decisions or facts the user can't resolve alone. Concrete list of what user must walk away able to do/decide.
3. **Write the questionnaire** — Questions aimed at the gap from steps 1-2. Follow template structure. Write to file.

**Document structure** (from template):
- Purpose: why this exists, decision riding on it
- From/To/How: sender, recipient, how answers will be used
- Context: one paragraph orienting the recipient
- How to answer: deadline, effort, partial answers OK
- Theme headings with questions (most-important-first)
- Anything else: closing catch-all

**Question design**: One idea per question (never compound), answer stub beneath, "why this matters" only where question could be misread or invite throwaway answer.

## A1 — Upstream Typical Applications

- Architecture decision: "should we use PostgreSQL or MongoDB?" → questionnaire to DBA covering performance, scaling, ops burden
- Vendor evaluation: "which payment processor?" → questionnaire to finance covering fees, compliance, integration effort
- Requirements gathering: "what should the dashboard show?" → questionnaire to stakeholders covering metrics, priorities, access patterns
- Technical investigation: "how does the legacy system work?" → questionnaire to original developer covering architecture, gotchas, dependencies
- Policy clarification: "what's our deployment policy?" → questionnaire to DevOps covering staging, canary, rollback procedures

## A2 — Trigger Scenarios (3 contexts + language signals + sibling distinction)

| Context | User Language Signals (≥3) | vs Sibling Skills |
|---------|---------------------------|-------------------|
| **Knowledge gap** | "I need to ask someone about", "I don't know enough to decide", "generate questions for" | vs grill-me: grill-me interviews *the user*; to-questionnaire produces questions for *someone else* |
| **Async information gathering** | "create a questionnaire", "draft questions for", "what should I ask them", "structured inquiry" | vs research: research *reads primary sources*; to-questionnaire *asks a person* |
| **Decision support** | "I can't decide without input from", "need their expertise on", "what do they know that I don't" | vs grill-with-docs: grill-with-docs sharpens *your thinking*; to-questionnaire gathers *others' thinking* |

## E — Execution Steps (each with "完成标准:")

1. **Identify the recipient** — Ask: who is this going to? What's their role, expertise, relationship to you?  
   完成标准: Recipient identified with role, expertise, relationship; tone/context fixed.

2. **Identify what you need back** — Ask: what specific decisions or facts can't you resolve alone? Concrete list.  
   完成标准: Concrete list of needed decisions/facts; user knows what they must walk away able to do.

3. **Write the questionnaire** — Draft questions aimed at the gap. Follow template: Purpose, From/To/How, Context, How to answer, Theme headings, Anything else. One idea per question.  
   完成标准: Questionnaire file exists (to-questionnaire-<slug>.md); every needed item covered by a question; follows template structure.

4. **Report the file** — Tell user the path to the questionnaire and suggest how to deliver it (async email, meeting, etc.).  
   完成标准: User receives file path and delivery suggestion.

## B — Boundaries & Limits

**不适用**:
- User knows the answer themselves (use grill-me or grill-with-docs to sharpen their own thinking)
- No specific recipient in mind (use research to find facts directly)
- Need to make the decision now without waiting for input (use grill-with-docs)
- Pure code review or bug diagnosis (use code-review or diagnosing-bugs)

**局限**: Questionnaire quality depends on correctly identifying the knowledge gap. Recipient may not answer or may answer incompletely. Async delivery means delay. Questions may be misinterpreted without followup clarification. "Grill the send" assumes the user can articulate what they need.

## Related Skills

- **grill-me** (interviews the user about their own thinking), **grill-with-docs** (sharpens ideas with docs), **research** (gathers facts from primary sources), **to-spec** (converts discussion to spec), **writing-for-agents** (design principles for document structure)

## Audit

V1✓ V2✓ V3✓ | 2026-08-26 | Source: D:\outcome\self\upstream\mattpocock__skills\skills\productivity\to-questionnaire\SKILL.md
