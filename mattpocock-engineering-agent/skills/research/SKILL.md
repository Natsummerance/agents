---
name: research
description: Investigate a question against high-trust primary sources and capture the findings as a Markdown file in the repo. Delegates reading legwork to a background agent so you keep working while it reads. Use when the user wants a topic researched, docs or API facts gathered, or reading legwork delegated. The produced file is a primary source to take into grill-with-docs or to-spec.
source_project: mattpocock/skills
tags: [research, background-agent, primary-sources, documentation, engineering]
---

## R — Reference (≤100 words)

Upstream: `skills/engineering/research/SKILL.md` (12 lines). Spin up a background agent to do the research, so you keep working while it reads. Its job: (1) Investigate the question against primary sources (official docs, source code, specs, first-party APIs), not secondary write-ups. Follow every claim back to the source that owns it. (2) Write the findings to a single Markdown file, citing each claim's source. (3) Save it where the repo already keeps such notes; match the existing convention, and if there is none, put it somewhere sensible and say where.

## I — Methodology (in own words)

**Core principle**: Research is *background reading legwork*, not decision-making. The agent reads primary sources and produces a cited Markdown file. The file feeds into the main flow (grill-with-docs, to-spec) rather than replacing it.

**Three invariants**:
1. **Primary sources only**: Official docs, source code, specs, first-party APIs. Never secondary write-ups. Every claim traced to its source.
2. **Single Markdown file**: All findings in one file with inline citations. Saved where the repo keeps notes (or sensible default if none exists).
3. **Non-blocking**: Background agent works while you keep working. The research file is a *feed* into the main flow, not a *gate*.

**Source hierarchy**: Official documentation > source code > specs > first-party API references. Blog posts, Stack Overflow, AI-generated content are secondary — use only to find pointers to primary sources.

**Citation format**: Every claim cites its source (URL, file path, commit SHA). No unsourced claims.

**Integration with main flow**: The research file is taken *into* grill-with-docs or to-spec. Research feeds thinking; it doesn't replace the grilling/spec process.

## A1 — Upstream Typical Applications

- API integration: "how does Stripe's webhook verification work?" → background agent reads Stripe docs → produces cited Markdown → taken into implement
- Library evaluation: "should we use Zod or Yup for validation?" → background agent researches both against official docs → comparison file → taken into grill-with-docs
- Framework migration: "what changed between React 17 and 18?" → background agent reads official migration guide → changelog file → taken into to-spec
- Protocol research: "how does gRPC streaming work?" → background agent reads gRPC specs → technical summary → taken into design discussion
- Internal codebase research: "how is auth currently implemented?" → background agent reads source code → architecture notes → taken into grill-with-docs

## A2 — Trigger Scenarios (3 contexts + language signals + sibling distinction)

| Context | User Language Signals (≥3) | vs Sibling Skills |
|---------|---------------------------|-------------------|
| **External documentation research** | "research how X works", "look up the docs for", "find the official documentation", "what does the spec say" | vs grill-with-docs: grill-with-docs sharpens *your idea*; research gathers *external facts* |
| **Internal codebase investigation** | "investigate how this is implemented", "read the source code for", "trace this code path", "understand the architecture" | vs diagnosing-bugs: diagnosing-bugs finds *why something is broken*; research finds *how something works* |
| **Fact-gathering delegation** | "delegate the reading", "background research on", "look this up while I keep working", "gather the facts" | vs implement: implement *builds code*; research *reads documentation* |

## E — Execution Steps (each with "完成标准:")

1. **Define the question** — Clarify what specific question needs research. Scope it tightly: "how does X work?" not "tell me about X".  
   完成标准: Research question stated as a specific, answerable question.

2. **Identify primary sources** — Determine which official docs, source code, specs, or API references are relevant. List them.  
   完成标准: List of primary sources identified with URLs/paths.

3. **Spawn background agent** — Launch sub-agent with the research task: investigate question against sources, cite every claim, write single Markdown file.  
   完成标准: Background agent spawned; you continue working without blocking.

4. **Receive findings** — Background agent returns: single Markdown file with cited claims, saved to repo-conventional location.  
   完成标准: Markdown file exists; every claim has inline citation; file follows repo convention.

5. **Integrate into main flow** — Take the research file into grill-with-docs, to-spec, or implement as appropriate.  
   完成标准: Research file referenced in the next step of the main flow.

## B — Boundaries & Limits

**不适用**:
- Decision-making (research gathers facts; grill-with-docs makes decisions)
- Bug diagnosis (use diagnosing-bugs)
- Code review (use code-review)
- Implementation (use implement/tdd)

**局限**: Research depends on primary source availability. Some topics lack good primary sources. Background agent may misinterpret documentation. Citations may become stale as docs update. Research is non-blocking but not instantaneous — large topics may take significant time.

## Related Skills

- **grill-with-docs** (consumes research output for decision-making), **to-spec** (consumes research output for specification), **diagnosing-bugs** (may spawn research for understanding code paths), **implement** (uses research to inform implementation), **setup-matt-pocock-skills** (precondition for repo note conventions)

## Audit

V1✓ V2✓ V3✓ | 2026-08-26 | Source: D:\outcome\self\upstream\mattpocock__skills\skills\engineering\research\SKILL.md
