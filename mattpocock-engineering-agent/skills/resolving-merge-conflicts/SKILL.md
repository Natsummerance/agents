---
name: resolving-merge-conflicts
description: Resolve an in-progress git merge or rebase conflict hunk by hunk. Traces each side's intent to its primary source (commit messages, PRs, original issues), resolves by intent rather than picking lines, runs automated checks, and finishes the operation. Never runs --abort. Use when the user says "resolve this merge conflict", "help with rebase conflict", or is mid-conflict.
source_project: mattpocock/skills
tags: [git, merge, rebase, conflict-resolution, version-control, engineering]
---

## R — Reference (≤100 words)

Upstream: `skills/engineering/resolving-merge-conflicts/SKILL.md` (14 lines). Process: (1) See the current state of the merge/rebase. Check git history and conflicting files. (2) Find the primary sources for each conflict. Understand deeply why each change was made, and what the original intent was. Read the commit messages, check the PRs, check original issues/tickets. (3) Resolve each hunk. Preserve both intents where possible. Where incompatible, pick the one matching the merge's stated goal and note the trade-off. Do not invent new behaviour. Always resolve; never --abort. (4) Discover the project's automated checks and run them, typically typecheck, then tests, then format. Fix anything the merge broke. (5) Finish the merge/rebase. Stage everything and commit. If rebasing, continue the rebase process until all commits are rebased.

## I — Methodology (in own words)

**Core principle**: Resolve by *intent*, not by *picking lines*. Every conflict has two sides, each with a primary source explaining *why* the change was made. Understanding intent prevents mechanical merges that break semantics.

**Five-step discipline**:
1. **See**: Understand current state — which files conflict, what the merge/rebase goal is
2. **Find sources**: For each conflict, trace both sides to commit messages, PRs, issues, tickets. Read the *why*.
3. **Resolve by intent**: Preserve both intents where possible. Where incompatible, pick the one matching the merge's stated goal. Note the trade-off. Never invent new behavior. Always resolve; never --abort.
4. **Check**: Run automated checks (typecheck → tests → format). Fix anything the merge broke.
5. **Finish**: Stage and commit. If rebasing, continue until all commits rebased.

**Never abort**: Abort is not an option. The merge must complete. If resolution is impossible, document the conflict and escalate.

**Intent preservation**: When both sides modify the same code for different reasons, preserve both reasons. This may mean refactoring to accommodate both intents, not just picking one.

## A1 — Upstream Typical Applications

- Feature branch merge: two developers modified the same auth module for different features → trace each to their PR → preserve both intents by refactoring
- Rebase conflict: main branch moved a function while feature branch added parameters → trace to commits → merge both changes
- Dependency update: library upgrade conflicts with local patches → trace to original patch reason → decide which to keep
- Schema migration: two migrations modify the same table → trace to original issues → sequence them properly
- Code review feedback: reviewer requested changes that conflict with other changes → trace to review comments → integrate both

## A2 — Trigger Scenarios (3 contexts + language signals + sibling distinction)

| Context | User Language Signals (≥3) | vs Sibling Skills |
|---------|---------------------------|-------------------|
| **Mid-merge conflict** | "resolve this conflict", "merge conflict help", "rebase is stuck", "conflicting files" | vs code-review: code-review evaluates *completed diff*; resolving-merge-conflicts resolves *in-progress conflict* |
| **Rebase in progress** | "rebase conflict", "interactive rebase stuck", "continuing rebase", "rebasing failed" | vs implement: implement *builds code*; resolving-merge-conflicts *resolves version control conflicts* |
| **Post-conflict verification** | "merge broke tests", "conflict resolution broke things", "check if merge is correct" | vs diagnosing-bugs: diagnosing-bugs finds *root cause of bugs*; resolving-merge-conflicts verifies *conflict resolution correctness* |

## E — Execution Steps (each with "完成标准:")

1. **See current state** — Check `git status`, identify conflicting files, understand the merge/rebase goal.  
   完成标准: List of conflicting files; merge/rebase goal understood.

2. **Find primary sources for each conflict** — For each conflicting file: read commit messages, check PRs, check original issues/tickets. Understand *why* each side made their change.  
   完成标准: Each conflict traced to primary sources; both sides' intent documented.

3. **Resolve each hunk** — Preserve both intents where possible. Where incompatible, pick the one matching the merge's stated goal. Note the trade-off. Never invent new behavior.  
   完成标准: All conflicts resolved; trade-offs noted; no new behavior invented.

4. **Run automated checks** — Execute typecheck, then tests, then format. Fix anything the merge broke.  
   完成标准: All checks pass; merge-induced breakages fixed.

5. **Finish merge/rebase** — Stage everything and commit. If rebasing, continue until all commits rebased.  
   完成标准: Merge/rebase complete; clean working tree; commit created.

## B — Boundaries & Limits

**不适用**:
- No conflict exists (just a normal merge/rebase — use git directly)
- User wants to abort the merge (this skill never aborts; escalate if truly impossible)
- Code review of merged code (use code-review)
- Bug diagnosis after merge (use diagnosing-bugs)

**局限**: Complex conflicts may require human judgment on intent preservation. Some conflicts are genuinely incompatible — resolution requires choosing one side and documenting the loss. Automated checks may not catch semantic breakage. Rebase conflicts with many commits can be tedious.

## Related Skills

- **code-review** (reviews the merged result), **diagnosing-bugs** (if merge introduces bugs), **implement** (may be running when conflicts arise), **setup-matt-pocock-skills** (precondition for issue tracker references in commit messages)

## Audit

V1✓ V2✓ V3✓ | 2026-08-26 | Source: D:\outcome\self\upstream\mattpocock__skills\skills\engineering\resolving-merge-conflicts\SKILL.md
