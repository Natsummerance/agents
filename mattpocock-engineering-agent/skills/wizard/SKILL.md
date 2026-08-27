---
name: wizard
description: Generate an interactive bash wizard that walks a human through steps only they can perform. Opens URLs, captures values, writes to .env and GitHub secrets, confirms at each stage. Use when provisioning infrastructure, setting up credentials or CI secrets, walking an unfamiliar third-party dashboard, or running a one-off migration or cutover. Don't invoke for steps the agent can perform itself — this is for where a human is genuinely in the loop.
source_project: mattpocock/skills
tags: [wizard, bash-script, infrastructure, credentials, migration, human-in-loop, engineering]
---

## R — Reference (≤100 words)

Upstream: `skills/engineering/wizard/SKILL.md` (44 lines). A wizard is a bash script that walks a human through a manual procedure. Opens each URL, says exactly what to click and copy, captures values, writes them where they belong (.env, GitHub secrets), confirms at every stage, shows how many stages left. Template provides: stage-by-stage progress, confirmation gates, cross-platform URL opening (including WSL), hidden secret entry, idempotent .env upserts, gh secret/variable writes, closing summary. Process: (1) Scope the procedure — every manual step, every value captured. Read repo first (.env, .env.example, docker-compose, workflows). Show user ordered list of stages, confirm. (2) Map each stage's journey — precise path: URL → action → value → variable. (3) Author the wizard — copy template.sh, replace example stages with real stages, use library helpers (stage, say/step, open_url, ask/ask_secret, write_env, set_secret/set_var, pause/confirm). (4) Verify and hand off — bash -n, shellcheck, chmod +x. Don't run end-to-end. Tell user how to run.

## I — Methodology (in own words)

**Core principle**: A wizard is a *bash script* that makes tedious manual procedures reproducible. The human does the clicking; the script drives them.

**Four-step process**:
1. **Scope**: Every manual step, every value captured. Read repo for context (.env, workflows, docker-compose). Show user ordered stages, confirm.
2. **Map**: For each stage: which URL → what to do → where value is shown → which variable it fills. Never invent steps that may not exist.
3. **Author**: Copy template.sh. One stage per step. Use library helpers. Set TOTAL_STAGES. Hold the template's bar: open URL before asking, ask_secret for secrets, write_env for persisted values, confirm before irreversible actions.
4. **Verify**: bash -n, shellcheck, chmod +x. Don't run end-to-end (it opens browsers and blocks on input). Trace statically.

**Template library (above STAGES marker)**: Identical in every wizard — never hand-edit. Provides: stage-by-stage progress, confirmation gates, cross-platform URL opening, hidden secret entry, idempotent .env upserts, gh secret/variable writes, closing summary.

**Ephemeral by default**: Built for one run, saved to scratch or scripts/, deleted when done. Commit only when user wants a repeatable setup path.

## A1 — Upstream Typical Applications

- API key setup: wizard opens Stripe dashboard → Developer → API keys → Reveal test key → copy → writes to .env + GitHub secret
- CI/CD configuration: wizard opens GitHub repo → Settings → Secrets → creates DATABASE_URL secret → writes to GitHub secret
- Database migration: wizard dumps old DB → migrates schema → loads into new DB → confirms row counts
- Third-party integration: wizard opens Slack app page → creates app → copies webhook URL → writes to .env
- Infrastructure provisioning: wizard opens AWS console → creates IAM user → copies access key → writes to .env + GitHub secret

## A2 — Trigger Scenarios (3 contexts + language signals + sibling distinction)

| Context | User Language Signals (≥3) | vs Sibling Skills |
|---------|---------------------------|-------------------|
| **Human-only steps** | "I need to click through a dashboard", "set up credentials", "provision infrastructure", "only I can do this" | vs implement: implement *builds code*; wizard *generates a script for human steps* |
| **Reproducible setup** | "make this repeatable", "document the setup process", "script this procedure", "next time just run the script" | vs setup-matt-pocock-skills: setup-matt-pocock-skills *configures skill environment*; wizard *configures infrastructure/services* |
| **One-off migration** | "one-time migration", "cutover procedure", "move from A to B", "manual steps in a pipeline" | vs wayfinder: wayfinder *maps decisions*; wizard *generates a bash script for execution* |

## E — Execution Steps (each with "完成标准:")

1. **Scope the procedure** — Read repo (.env, .env.example, workflows, docker-compose). Identify every manual step and every value captured. Show user ordered list of stages. Confirm.  
   完成标准: All manual steps identified; all values listed; user confirms stages.

2. **Map each stage's journey** — For each stage: URL to open → action to take → value to capture → variable it fills. Ask user or check docs for unknowns — never invent steps.  
   完成标准: Every stage traced to concrete instructions a stranger could follow.

3. **Author the wizard** — Copy template.sh to target path. Replace example stages with real stages. Use library helpers. Set TOTAL_STAGES.  
   完成标准: Wizard script written; uses library helpers; TOTAL_STAGES set correctly.

4. **Verify** — Run `bash -n <script>`. Run shellcheck if available. `chmod +x <script>`. Trace statically: every value from step 1 captured and lands where step 1 said; every set_secret name matches a secrets.* reference.  
   完成标准: Syntax valid; permissions set; static trace confirms all values and secrets.

5. **Hand off** — Tell user how to run it. If repeatable, commit and link from README.  
   完成标准: User knows how to run; repeatable paths committed if desired.

## B — Boundaries & Limits

**不适用**:
- Steps the agent can perform itself (use implement, research, etc.)
- No human-in-the-loop needed (automate with implement/tdd)
- No infrastructure or credentials involved (use grill-with-docs for planning)
- Code review (use code-review)

**局限**: Wizard is ephemeral by default — if not committed, the procedure is lost. Template library is frozen; custom needs may require modifying the template (not recommended). Cross-platform URL opening may not work in all environments. Hidden secret entry depends on terminal capabilities. Wizard assumes the human can follow instructions — complex procedures may need more context than the script provides.

## Related Skills

- **setup-matt-pocock-skills** (configures skill environment, not infrastructure), **implement** (builds code), **research** (reads documentation for wizard steps), **handoff** (may reference wizard output), **grill-with-docs** (sharpens the procedure before scripting)

## Audit

V1✓ V2✓ V3✓ | 2026-08-26 | Source: D:\outcome\self\upstream\mattpocock__skills\skills\engineering\wizard\SKILL.md
