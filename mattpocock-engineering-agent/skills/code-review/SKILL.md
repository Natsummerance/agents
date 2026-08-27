---
name: code-review
description: Two-axis review of a git diff since a fixed point (commit, branch, tag, merge-base). Standards axis checks repo coding standards + Fowler smell baseline; Spec axis checks diff against originating issue/spec. Runs both axes as parallel sub-agents, aggregates side-by-side. Use for PR review, branch review, WIP review, or "review since X".
source_project: mattpocock/skills
tags: [review, diff, standards, spec, parallel-subagents, engineering]
---

## R — Reference (≤100 words)

Upstream: `skills/engineering/code-review/SKILL.md` (87 lines). Process: (1) Pin fixed point via `git diff <fixed>...HEAD` (three-dot merge-base). (2) Identify spec source: commit refs → user path → docs/specs match → ask user. (3) Identify standards: repo docs (CODING_STANDARDS.md) + **smell baseline** (13 Fowler smells: Mysterious Name, Duplicated Code, Feature Envy, Data Clumps, Primitive Obsession, Repeated Switches, Shotgun Surgery, Divergent Change, Speculative Generality, Message Chains, Middle Man, Refused Bequest). Repo overrides baseline; baseline always judgement calls. (4) Spawn parallel sub-agents with diff+standards/spec. (5) Aggregate under ## Standards / ## Spec, no cross-axis rerank. Summary: findings per axis + worst per axis.

## I — Methodology (in own words)

**Core principle**: Separate *how code is written* (Standards) from *what code does* (Spec) to prevent one axis masking the other.

**Two-axis independence**:
- Standards = conformance to documented conventions + universal smell heuristics
- Spec = traceability to originating requirements (issue, spec doc, PR description)
- Parallel sub-agents ensure no context pollution; each sees only its axis inputs

**Smell baseline as floor**: Even repos with zero docs get 13 structural heuristics. Each smell = labelled heuristic ("possible Feature Envy"), never hard violation. Tooling-enforced rules (lint, format) are skipped.

**Spec resolution hierarchy**: Commit references (strongest) → user-provided path → filesystem search → user clarification → "no spec" (Spec axis skipped).

**Output discipline**: Two separate sections, verbatim sub-agent reports lightly cleaned. No merging, no global ranking. One-line summary per axis only.

## A1 — Upstream Typical Applications

- PR review automation: "review since main" → Standards catches naming/duplication; Spec catches missing acceptance criteria
- Pre-merge gate: CI runs code-review on feature branch vs merge-base
- Post-hoc audit: "review since v1.0.0" on a released branch
- Standards drift detection: baseline smells reveal creeping complexity
- Spec scope creep detection: diff contains behaviour not in issue

## A2 — Trigger Scenarios (3 contexts + language signals + sibling distinction)

| Context | User Language Signals (≥3) | vs Sibling Skills |
|---------|---------------------------|-------------------|
| **PR/branch review request** | "review this PR", "review since main", "check my branch", "code review please" | vs diagnosing-bugs: code-review assumes code *exists*; diagnosing-bugs starts from *symptom* |
| **Standards compliance check** | "does this follow our conventions", "check for code smells", "lint this diff" | vs codebase-design: code-review evaluates *existing* diff; codebase-design shapes *future* modules |
| **Spec traceability audit** | "verify this implements the issue", "any scope creep", "missing requirements" | vs grill-with-docs: grill-with-docs sharpens *ideas*; code-review validates *delivered* code |

## E — Execution Steps (each with "完成标准:")

1. **Resolve fixed point** — Parse user input (commit SHA, branch, tag, `HEAD~n`). Run `git rev-parse` to validate; run `git diff <fixed>...HEAD` to capture diff; confirm non-empty.  
   完成标准: Fixed point resolves, diff command captured, diff non-empty, commit list noted.

2. **Locate spec source** — Search commit messages for issue refs; check user-provided path; search docs/specs/.scratch for matching names; prompt user if none found.  
   完成标准: Spec source identified (path or "none") with resolution method recorded.

3. **Collect standards sources** — Gather repo standards files (CODING_STANDARDS.md, CONTRIBUTING.md, .eslintrc, etc.). Append full 13-item smell baseline.  
   完成标准: Standards package = repo files + complete smell baseline, ready for sub-agent.

4. **Spawn parallel sub-agents** — Launch Standards agent (diff + standards package) and Spec agent (diff + spec source). Enforce 400-word limit each.  
   完成标准: Both sub-agents return reports; no cross-talk between them.

5. **Aggregate & present** — Render ## Standards and ## Spec sections verbatim. Add one-line summary: findings count per axis + worst issue per axis.  
   完成标准: Two distinct sections, no merged findings, summary line present.

## B — Boundaries & Limits

**不适用**:
- No git history / not a git repo
- Reviewing uncommitted working tree changes without a fixed point (use `git diff HEAD` explicitly)
- User wants architectural redesign (use codebase-design + grill-with-docs)
- User wants bug root cause (use diagnosing-bugs)

**局限**: Requires issue tracker config (docs/agents/issue-tracker.md) for commit-ref fetching. Smell baseline is heuristic—false positives possible. Spec axis degrades to "no spec" if traceability broken.

## Related Skills

- **diagnosing-bugs** (bug root cause), **codebase-design** (module design vocabulary), **implement** (builds code that gets reviewed), **tdd** (drives implementation), **to-spec/to-tickets** (produces specs that Spec axis checks), **grill-with-docs** (sharpens specs before code), **setup-matt-pocock-skills** (precondition for issue tracker)

## Audit

V1✓ V2✓ V3✓ | 2026-08-26 | Source: D:\outcome\self\upstream\mattpocock__skills\skills\engineering\code-review\SKILL.md