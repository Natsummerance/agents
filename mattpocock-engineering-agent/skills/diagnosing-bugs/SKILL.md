---
name: diagnosing-bugs
description: Six-phase diagnosis loop for hard bugs and performance regressions. Phase 1: build a tight, deterministic, fast feedback loop that goes red on the exact bug. Phase 2: reproduce and minimise to smallest red scenario. Phase 3: generate 3-5 ranked falsifiable hypotheses. Phase 4: instrument one variable at a time (debugger > tagged logs > never log everything). Phase 5: write regression test at correct seam before fix; if no correct seam, that's the finding. Phase 6: cleanup (original loop green, regression passes, debug logs removed, hypothesis in commit). Use when user says "diagnose", "debug this", or reports broken/throwing/failing/slow.
source_project: mattpocock/skills
tags: [debugging, diagnosis, regression, feedback-loop, hypothesis, instrumentation, engineering]
---

## R — Reference (≤100 words)

Upstream: `skills/engineering/diagnosing-bugs/SKILL.md` (138 lines). **Phase 1** (core): build tight feedback loop—10 ways (failing test, curl, CLI diff, headless browser, replay trace, throwaway harness, property/fuzz, bisection harness, differential loop, HITL script). Tighten: faster, sharper signal, deterministic. Non-deterministic: raise repro rate. No loop → stop, ask for access/artifact/instrumentation. Completion: one command, red-capable, deterministic, fast, agent-runnable. **Phase 2**: run loop, confirm user's exact symptom, minimise to load-bearing elements only. **Phase 3**: 3-5 ranked falsifiable hypotheses with predictions ("If X, then changing Y makes bug disappear"). Show user before testing. **Phase 4**: one variable at a time; debugger > tagged logs (`[DEBUG-xxx]`); perf: baseline then bisect. **Phase 5**: regression test at correct seam (exercises real bug pattern at call site); if no correct seam, document as finding. **Phase 6**: cleanup checklist (original green, regression passes, debug logs grep-removed, throwaway deleted, hypothesis in commit).

## I — Methodology (in own words)

**Core principle**: *No hypothesis without a loop.* The feedback loop is the product; everything else consumes it.

**Phase 1 is the skill**: Spend disproportionate effort here. Be aggressive, creative, refuse to give up. A 2-second deterministic loop is a superpower; 30-second flaky is barely better than none.

**Minimisation as hypothesis-space reducer**: Each cut element removed shrinks Phase 3 search space. Minimal repro becomes the regression test.

**Falsifiability gate**: Every hypothesis must state a concrete prediction. "If X causes it, then changing Y will make it disappear/worse." Vibes discarded.

**Instrumentation hygiene**: Tagged logs (`[DEBUG-a4f2]`) die by single grep. Untagged logs survive as technical debt. Perf bugs: measure first (baseline, profiler, query plan), bisect second.

**Seam correctness for regression**: Test must exercise the *real bug pattern at the call site*. Shallow seam (single-caller unit test for multi-caller bug) gives false confidence. No correct seam = architectural finding → flag for improve-codebase-architecture.

**Cleanup as closure**: Debug artifacts removed, hypothesis recorded in commit message—next debugger learns.

## A1 — Upstream Typical Applications

- Flaky CI test: "test fails 1 in 20 runs" → Phase 1: loop 100× with stress → Phase 3: hypotheses about timing/state → Phase 4: tagged logs at boundaries
- Performance regression: "API 3x slower after deploy" → Phase 1: timing harness → Phase 4 perf branch: baseline → bisect
- Heisenbug: "works locally, fails in prod" → Phase 1: replay captured trace / HITL script → Phase 2 minimise → Phase 5: regression at correct seam
- Legacy bug: "nobody knows this code" → Phase 1: throwaway harness isolating code path → Phase 3: hypotheses from code reading *after* loop exists

## A2 — Trigger Scenarios (3 contexts + language signals + sibling distinction)

| Context | User Language Signals (≥3) | vs Sibling Skills |
|---------|---------------------------|-------------------|
| **Hard-to-reproduce bug** | "intermittent", "flaky", "can't reproduce", "happens sometimes", "race condition" | vs code-review: code-review checks *static diff*; diagnosing-bugs needs *dynamic loop* |
| **Performance regression** | "slower", "timeout", "latency spike", "regression", "degraded" | vs improve-codebase-architecture: diagnosing-bugs finds *root cause*; improve-codebase-architecture fixes *architectural gap* preventing lockdown |
| **Unknown codebase bug** | "legacy", "nobody knows", "throw error", "crash", "wrong output" | vs prototype: prototype answers *design questions*; diagnosing-bugs answers *why broken* |

## E — Execution Steps (each with "完成标准:")

1. **Build feedback loop (Phase 1)** — Try the 10 methods in order until one works. Tighten: faster, sharper signal, deterministic. For flakes: raise repro rate. Document the one command + redacted output.  
   完成标准: One command exists, run at least once, red-capable on exact bug, deterministic, fast (seconds), agent-runnable.

2. **Reproduce & minimise (Phase 2)** — Run loop, confirm user's exact symptom. Cut inputs/callers/config/data one at a time; keep only load-bearing elements.  
   完成标准: Minimal repro where removing any element makes loop go green; exact symptom captured.

3. **Generate hypotheses (Phase 3)** — Produce 3-5 ranked, falsifiable hypotheses with concrete predictions. Present to user before testing.  
   完成标准: List of 3-5 hypotheses, each with "If X then Y" prediction; user seen (or AFK noted).

4. **Instrument & test (Phase 4)** — For each hypothesis: one variable change, debugger/REPL first, tagged logs at boundaries. Perf: baseline → bisect.  
   完成标准: Each probe maps to a prediction; tagged logs prefixed; perf has baseline measurement.

5. **Fix + regression test (Phase 5)** — Write failing test at correct seam (real bug pattern at call site). Apply fix. Watch pass. Re-run original loop. If no correct seam: document as architectural finding.  
   完成标准: Regression test fails before fix, passes after; original loop green; or seam absence documented.

6. **Cleanup (Phase 6)** — Verify original repro green, regression passes, grep-remove `[DEBUG-*]`, delete throwaway prototypes, record winning hypothesis in commit.  
   完成标准: All 5 checklist items green; commit message contains hypothesis.

## B — Boundaries & Limits

**不适用**:
- Trivial bugs with obvious cause (overkill)
- Feature development (use implement/tdd)
- Architecture redesign (use codebase-design + grill-with-docs)
- No ability to run code (need at least one feedback loop method)

**局限**: Requires execution environment. Non-deterministic bugs may need prod access. "Correct seam" may not exist—then the finding is architectural, not a fix. Phase 1 can consume most of the session.

## Related Skills

- **improve-codebase-architecture** (post-mortem when no correct seam), **code-review** (reviews the fix), **tdd** (drives the regression test), **implement** (applies the fix), **grill-with-docs** (if bug reveals design confusion), **domain-modeling** (if bug reveals term confusion)

## Audit

V1✓ V2✓ V3✓ | 2026-08-26 | Source: D:\outcome\self\upstream\mattpocock__skills\skills\engineering\diagnosing-bugs\SKILL.md