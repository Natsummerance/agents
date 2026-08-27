---
name: handoff
description: Compact the current conversation into a handoff document for another agent or developer to pick up. Use when switching sessions, forking a side task mid-phase, moving work to a new directory, or delegating to a colleague. Generates a portable markdown summary with suggested skills, redacted secrets, and references to existing artifacts instead of duplicating content. Trigger phrases: "handoff", "switch session", "pass this to", "continue in a fresh window".
source_project: mattpocock/skills
tags: [handoff, context-transfer, session-boundary, productivity]
---

## R — Reference (≤100 words)

Upstream: `skills/productivity/handoff/SKILL.md` (16 lines). Write a handoff document summarising the current conversation so a fresh agent can continue the work. Save to the temporary directory of the user's OS — not the current workspace. Include a "suggested skills" section naming which skills the next agent should invoke. Do not duplicate content already captured in other artifacts (specs, plans, ADRs, issues, commits, diffs) — reference them by path or URL instead. Redact any sensitive information (API keys, passwords, PII). If the user passed arguments, treat them as a description of what the next session will focus on and tailor the doc accordingly.

## I — Methodology (in own words)

**Core principle**: Handoff is a *bridge*, not a dump. It compresses conversation context into a portable document that lets a fresh agent resume without re-reading the entire history.

**Key invariants**:
- Save to OS temp dir (`$TMPDIR` or `/tmp` or `%TEMP%`), never the workspace
- Reference existing artifacts by path/URL — never duplicate content already in specs, ADRs, issues, or commits
- Redact all secrets before writing
- Include a "suggested skills" section so the next agent knows which tools to reach for
- Tailor the document to the stated focus if arguments were provided

**Handoff document structure**:
1. **Context summary**: What was being worked on, key decisions made, current state
2. **Artifacts**: Paths/URLs to specs, ADRs, issues, commits, diffs — referenced, not copied
3. **Suggested skills**: Which skills the next agent should invoke and why
4. **Open questions**: What remains unresolved, what the next session should tackle
5. **Redaction log**: What was redacted and why (secrets, PII)

**When to use**:
- Switching to a fresh context window (session approaching smart zone limit)
- Forking a side task into its own session
- Moving work to a new directory (prototype detour)
- Delegating to a colleague or different agent

## A1 — Upstream Typical Applications

- Session compaction: context window approaching 150k tokens → handoff → fresh session picks up from document
- Prototype detour: main flow needs a throwaway UI → handoff to new session → prototype built → handoff back with findings
- Multi-agent collaboration: agent A does research → handoff doc → agent B implements based on findings
- Team handoff: AI session produced valuable context → handoff doc → human developer continues
- Mid-phase fork: grilling reveals a sub-question needing its own investigation → handoff to parallel session

## A2 — Trigger Scenarios (3 contexts + language signals + sibling distinction)

| Context | User Language Signals (≥3) | vs Sibling Skills |
|---------|---------------------------|-------------------|
| **Session boundary** | "handoff", "switch session", "fresh window", "context is getting long" | vs compact: compact compresses *within* a session; handoff exports *across* sessions/directories |
| **Side task fork** | "fork this into its own session", "parallel work", "delegate this part" | vs subagent: subagent runs in same session; handoff creates a *portable* document for a new session |
| **Collaboration transfer** | "pass this to a colleague", "continue in a fresh window", "someone else will pick this up" | vs writing-for-agents: writing-for-agents designs *skill documents*; handoff designs *session transfer documents* |

## E — Execution Steps (each with "完成标准:")

1. **Identify artifacts to reference** — Scan the conversation for specs, ADRs, issues, commits, diffs, CONTEXT.md entries. List their paths/URLs.  
   完成标准: Every artifact referenced by path/URL; none duplicated into the handoff doc.

2. **Determine focus from arguments** — If user passed arguments describing the next session's focus, tailor the document to emphasize relevant context.  
   完成标准: Document structure reflects the stated focus (if any); otherwise covers full session scope.

3. **Redact sensitive information** — Scan for API keys, passwords, tokens, PII. Replace with `<REDACTED>`. Build loops against env vars where possible.  
   完成标准: Zero secrets in output; all redactions logged with reason.

4. **Write handoff document** — Save to OS temp dir with descriptive filename. Include: context summary, artifact references, suggested skills, open questions, redaction log.  
   完成标准: File exists in temp dir; all 5 sections present; no duplicated content.

5. **Report path to user** — Tell the user the absolute path to the handoff document and which skills are suggested for the next session.  
   完成标准: User receives path and suggested skills list.

## B — Boundaries & Limits

**不适用**:
- No artifacts to reference and no conversation context to compress (nothing to hand off)
- User wants to continue in the same session (use compact instead)
- Need to transfer code, not context (use git commit/branch directly)

**局限**: Handoff document is a snapshot — if the conversation continues after handoff, the document becomes stale. Secrets redaction depends on detection; missed secrets require manual audit. OS temp dir may be cleaned by the system.

## Related Skills

- **compact** (in-session compression vs cross-session handoff), **grill-with-docs** (produces CONTEXT.md/ADRs that handoff references), **wayfinder** (map tickets may be referenced in handoff), **writing-for-agents** (design principles for handoff document structure), **setup-matt-pocock-skills** (precondition for issue tracker references)

## Audit

V1✓ V2✓ V3✓ | 2026-08-26 | Source: D:\outcome\self\upstream\mattpocock__skills\skills\productivity\handoff\SKILL.md
