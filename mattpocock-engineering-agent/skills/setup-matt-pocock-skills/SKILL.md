---
name: setup-matt-pocock-skills
description: Configure a repo for the engineering skills: set up its issue tracker (GitHub, GitLab, local markdown, or other), triage label vocabulary, and domain doc layout (single-context or multi-context). Run once before first use of other engineering skills. Prompt-driven skill that explores, confirms, then writes. Use when the user says "setup skills", "configure the issue tracker", "initialize the repo for engineering skills".
source_project: mattpocock/skills
tags: [setup, configuration, issue-tracker, triage-labels, domain-docs, precondition, engineering]
---

## R — Reference (≤100 words)

Upstream: `skills/engineering/setup-matt-pocock-skills/SKILL.md` (116 lines). Scaffold per-repo configuration: issue tracker (GitHub by default; GitLab, local markdown, or other), triage labels (five canonical roles: needs-triage, needs-info, ready-for-agent, ready-for-human, wontfix), domain docs (single-context: root CONTEXT.md + docs/adr/; multi-context: CONTEXT-MAP.md). Process: (1) Explore — check git remote, AGENTS.md/CLAUDE.md, CONTEXT.md, docs/agents/, .scratch/, monorepo signals. (2) Present findings and ask — Section A: issue tracker, Section B: triage labels (skip if triage not installed), Section C: domain docs. (3) Confirm and edit — show draft of Agent skills block + docs files. (4) Write — edit CLAUDE.md or AGENTS.md, write docs files. (5) Done.

## I — Methodology (in own words)

**Core principle**: This is a *prompt-driven* skill, not a deterministic script. Explore, present findings, confirm with user, then write. One section at a time, one answer per section.

**Three configuration sections**:
- **Section A: Issue tracker** — Where issues live. Default: GitHub if remote points there. Options: GitHub (`gh` CLI), GitLab (`glab` CLI), local markdown (`.scratch/<feature>/`), other (freeform description). Record in `docs/agents/issue-tracker.md`.
- **Section B: Triage labels** — Skip if triage skill not installed. Default: five canonical role names as labels. Only override if tracker already uses different names.
- **Section C: Domain docs** — Default: single-context (one root `CONTEXT.md` + `docs/adr/`). Multi-context only if monorepo signals found.

**File selection rule**: Edit `CLAUDE.md` if it exists; else `AGENTS.md` if it exists; else ask user which to create. Never create one when the other exists.

**Agent skills block**: Added to the chosen file, includes: issue tracker summary + pointer, triage labels summary + pointer (if triage installed), domain docs summary + pointer.

## A1 — Upstream Typical Applications

- New repo setup: fresh clone → run setup-matt-pocock-skills → GitHub issues + default labels + single-context
- Existing repo onboarding: team adopts engineering skills → setup discovers existing .scratch/ convention → uses local markdown tracker
- GitLab migration: team moves to GitLab → setup detects gitlab.com remote → configures glab CLI
- Monorepo: pnpm-workspace.yaml found → setup offers multi-context layout → per-package CONTEXT.md
- Custom tracker: team uses Jira → setup records freeform description of Jira workflow

## A2 — Trigger Scenarios (3 contexts + language signals + sibling distinction)

| Context | User Language Signals (≥3) | vs Sibling Skills |
|---------|---------------------------|-------------------|
| **First-time setup** | "setup skills", "configure the repo", "initialize for engineering", "first time using these skills" | vs implement: implement *builds features*; setup-matt-pocock-skills *configures the environment* for other skills |
| **Tracker migration** | "switch to GitHub issues", "move to GitLab", "change the issue tracker", "use local markdown" | vs triage: triage *uses* the tracker; setup-matt-pocock-skills *configures* the tracker |
| **Monorepo configuration** | "multi-context setup", "per-package domain docs", "monorepo configuration", "CONTEXT-MAP" | vs domain-modeling: domain-modeling *maintains* CONTEXT.md; setup-matt-pocock-skills *creates the layout* |

## E — Execution Steps (each with "完成标准:")

1. **Explore the repo** — Check `git remote -v`, `.git/config`, `AGENTS.md`/`CLAUDE.md`, `CONTEXT.md`/`CONTEXT-MAP.md`, `docs/adr/`, `docs/agents/`, `.scratch/`, monorepo signals (pnpm-workspace.yaml, workspaces field).  
   完成标准: All explored files checked; starting state documented.

2. **Present findings and ask** — Summarize what exists and what's missing. Take sections in order: A (issue tracker), B (triage labels), C (domain docs). One answer per section. Lead with recommended answer.  
   完成标准: Each section answered; user choices recorded.

3. **Confirm and edit** — Show draft of: Agent skills block for CLAUDE.md/AGENTS.md, contents of docs/agents/ files. Let user edit before writing.  
   完成标准: User confirms or edits drafts; no unwritten changes.

4. **Write configuration** — Edit CLAUDE.md or AGENTS.md (add/update Agent skills block). Write docs files using seed templates. For "other" trackers, write from scratch using user's description.  
   完成标准: All files written; Agent skills block present; docs files complete.

5. **Report completion** — Tell user setup is complete and which engineering skills now read from these files. Mention they can edit docs/agents/*.md directly.  
   完成标准: User informed of completion; skill dependencies documented.

## B — Boundaries & Limits

**不适用**:
- Repo already configured (check docs/agents/ first — re-run only to switch trackers)
- No git repo (local markdown tracker is fallback, but git is assumed)
- User wants to configure a different skill system (this is specific to mattpocock/skills)

**局限**: Configuration is a snapshot — if the repo changes (new monorepo structure, tracker migration), setup needs re-running. Triage labels are canonical names; actual label strings depend on tracker. Seed templates may need customization for non-standard trackers. "Other" tracker descriptions may be incomplete.

## Related Skills

- **triage** (uses triage labels configured here), **to-spec/to-tickets** (uses issue tracker configured here), **wayfinder** (uses issue tracker for map/tickets), **domain-modeling** (uses CONTEXT.md layout configured here), **grill-with-docs** (uses CONTEXT.md/ADRs configured here)

## Audit

V1✓ V2✓ V3✓ | 2026-08-26 | Source: D:\outcome\self\upstream\mattpocock__skills\skills\engineering\setup-matt-pocock-skills\SKILL.md
