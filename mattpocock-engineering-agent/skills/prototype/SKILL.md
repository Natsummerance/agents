---
name: prototype
description: Build a throwaway prototype to answer a design question. Two branches: LOGIC (state model validation via interactive HTML) or UI (variation exploration via multiple UI renders). Use when the user asks "does this state model feel right?", "what should this UI look like?", or wants to sanity-check a design before implementing. Always captured as primary source on throwaway branch.
source_project: mattpocock/skills
tags: [prototype, throwaway, design-validation, state-model, ui-exploration, engineering]
---

## R — Reference (≤100 words)

Upstream: `skills/engineering/prototype/SKILL.md` (26 lines). A prototype is throwaway code that answers a question. Two branches: **LOGIC** — single shareable HTML file with free-play buttons and guided walkthroughs pushing state machine through hard cases, non-developer can drive; **UI** — generate several radically different UI variations on a single route, switchable via URL search param and floating bottom bar. Rules: throwaway from day one, trivial to run, no persistence by default, skip the polish, surface the state after every action, capture when done (commit to throwaway branch, leave context pointer on implementation issue).

## I — Methodology (in own words)

**Core principle**: A prototype answers *one question* with throwaway code. The question decides the branch (LOGIC vs UI). Getting the branch wrong wastes the entire prototype.

**Branch selection**:
- "Does this logic/state model feel right?" → LOGIC.md branch
- "What should this look like?" → UI.md branch
- Ambiguous + user unavailable → default to branch matching surrounding code (backend → logic, frontend → UI), state assumption at top

**Universal rules**:
1. Throwaway from day one, clearly marked
2. Trivial to run (`pnpm <name>`, double-click HTML, etc.)
3. No persistence by default (state in memory)
4. Skip the polish (no tests, no error handling beyond runnable)
5. Surface state after every action/variant switch
6. Capture when done: fold validated decision into real code, commit prototype to throwaway branch, leave context pointer on implementation issue

**Capture discipline**: Main branch keeps only the validated decision. Prototype lives on `prototype/<name>` branch as a primary source. The answer (verdict + question it settled) is recorded in the issue or a commit message.

## A1 — Upstream Typical Applications

- State machine validation: "should checkout have separate payment vs confirmation states?" → LOGIC prototype with interactive buttons → user drives through edge cases → decides to merge states
- UI variation: "what should the dashboard look like?" → UI prototype with 3 radically different layouts → user picks layout C → folded into real implementation
- API contract testing: "does this webhook payload make sense?" → LOGIC prototype with mock webhook → developer tests integration points
- Data flow validation: "should we use events or direct calls?" → LOGIC prototype simulating both approaches → team decides on events
- Design exploration: "should the form be multi-step or single-page?" → UI prototype with both variants → user testing reveals multi-step wins

## A2 — Trigger Scenarios (3 contexts + language signals + sibling distinction)

| Context | User Language Signals (≥3) | vs Sibling Skills |
|---------|---------------------------|-------------------|
| **State model question** | "does this state model feel right?", "validate the logic", "test the state machine", "edge cases" | vs implement: implement builds *production code*; prototype builds *throwaway validation* |
| **UI design question** | "what should this look like?", "explore UI options", "visual variations", "layout exploration" | vs codebase-design: codebase-design shapes *module interfaces*; prototype explores *visual/behavioral variations* |
| **Pre-implementation sanity check** | "before we code this, let's check", "sanity check the design", "cheap way to validate" | vs grill-with-docs: grill-with-docs sharpens *ideas through interview*; prototype validates through *running code* |

## E — Execution Steps (each with "完成标准:")

1. **Identify the question** — What specific design question does the prototype answer? Determine branch (LOGIC or UI) from the question type.  
   完成标准: Question stated; branch selected (LOGIC or UI) with rationale.

2. **Build the prototype** — Follow the branch-specific guide (LOGIC.md or UI.md). Create throwaway code near where it will be used. Make it trivial to run.  
   完成标准: Prototype exists; runs with one command/click; clearly marked as throwaway.

3. **Surface state** — After every action (LOGIC) or variant switch (UI), render full relevant state so user can see what changed.  
   完成标准: State visible after each interaction; no hidden state.

4. **Validate with user** — User drives the prototype, explores edge cases, tests variations. Capture their decisions.  
   完成标准: User has explored the prototype; decisions captured (which variations, which state transitions, which approach).

5. **Capture and fold** — Fold validated decisions into real code. Commit prototype to throwaway branch (`prototype/<name>`). Leave context pointer on implementation issue.  
   完成标准: Real code reflects validated decisions; prototype committed to throwaway branch; context pointer exists.

## B — Boundaries & Limits

**不适用**:
- Production code implementation (use implement/tdd)
- Pure code review (use code-review)
- Architecture design discussion (use codebase-design + grill-with-docs)
- Bug diagnosis (use diagnosing-bugs)

**局限**: Prototype is throwaway — if decisions aren't captured, the prototype is wasted effort. LOGIC branch requires understanding state machines; UI branch requires design variation capability. Branch misidentification wastes the entire prototype. No persistence by default means state is lost on refresh.

## Related Skills

- **implement** (folds prototype decisions into production code), **codebase-design** (shapes the interface prototype validates), **grill-with-docs** (sharpens the question before prototyping), **wayfinder** (may spawn prototype as a decision ticket), **tdd** (tests the implementation after prototype validation)

## Audit

V1✓ V2✓ V3✓ | 2026-08-26 | Source: D:\outcome\self\upstream\mattpocock__skills\skills\engineering\prototype\SKILL.md
