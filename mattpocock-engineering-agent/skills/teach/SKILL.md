---
name: teach
description: Multi-session teaching workspace. Learn a concept over multiple sessions using the current directory as a stateful workspace. Produces lessons (self-contained HTML), reference documents (quick-reference cheat sheets), learning records (decision-like insights), and resources. Uses MISSION.md to ground all teaching in the user's goals. Zone of proximal development drives lesson selection. Use when the user says "teach me about X", "I want to learn Y", or "help me understand Z over multiple sessions".
source_project: mattpocock/skills
tags: [teach, learning, lessons, multi-session, education, productivity]
---

## R — Reference (≤100 words)

Upstream: `skills/productivity/teach/SKILL.md` (140 lines). Stateful multi-session teaching workspace. File structure: MISSION.md (reason for learning), reference/*.html (compressed learnings, cheat sheets), RESOURCES.md (high-trust resources), learning-records/*.md (non-obvious lessons, key insights), lessons/*.html (self-contained HTML teaching one thing), assets/* (reusable components), NOTES.md (user preferences). Philosophy: Knowledge (from high-trust resources), Skills (through interactive lessons), Wisdom (from community). Fluency vs Storage strength: desirability of difficulty for long-term retention (retrieval practice, spacing, interleaving). Lessons: beautiful (Tufte-like typography), short (stay in working memory), one tangible win, tied to mission, in zone of proximal development. Each lesson links to primary source and reminds user to ask followup questions.

## I — Methodology (in own words)

**Core principle**: Teaching is *mission-driven, skill-focused, community-anchored*. Knowledge acquisition serves skill acquisition; skill acquisition serves wisdom.

**Three learning types**:
1. **Knowledge**: From high-trust primary resources. Never trust parametric knowledge. Use RESOURCES.md to track.
2. **Skills**: Through interactive lessons with tight feedback loops. Difficulty is the tool — effortful retrieval builds storage strength.
3. **Wisdom**: From real-world interaction — testing skills in communities (forums, classes, groups).

**Fluency vs Storage**: Fluency (in-the-moment retrieval) gives illusory mastery. Storage strength (long-term retention) is the goal. Build storage through: retrieval practice (recall from memory), spacing (distribute practice), interleaving (mix related topics).

**Lesson design**: Beautiful typography (Tufte-like), short (stay in working memory), one tangible win per lesson, tied to mission, in zone of proximal development. Each lesson links to primary source and reminds user to ask followup questions.

**Workspace state**: MISSION.md grounds everything. Learning records track insights. Reference documents compress lessons for quick lookup. Assets enable reuse across lessons.

## A1 — Upstream Typical Applications

- Programming language: "teach me Rust" → MISSION.md captures why → lessons build from basics → reference docs for syntax → learning records track insights
- Physical skill: "teach me yoga" → MISSION.md captures fitness goals → lessons teach poses → reference docs for sequences → learning records track progress
- Theoretical topic: "teach me quantum computing" → MISSION.md captures curiosity → lessons build intuition → reference docs for formulas → learning records track understanding
- Professional skill: "teach me system design" → MISSION.md captures career goals → lessons teach patterns → reference docs for diagrams → learning records track decisions
- Creative skill: "teach me writing" → MISSION.md captures creative goals → lessons teach techniques → reference docs for grammar → learning records track style evolution

## A2 — Trigger Scenarios (3 contexts + language signals + sibling distinction)

| Context | User Language Signals (≥3) | vs Sibling Skills |
|---------|---------------------------|-------------------|
| **Multi-session learning** | "teach me about", "I want to learn", "help me understand", "over multiple sessions" | vs grill-me: grill-me is *stateless interview*; teach is *stateful multi-session workspace* |
| **Skill acquisition** | "teach me how to", "I want to get better at", "practice this skill", "interactive lessons" | vs research: research *gathers facts*; teach *builds skills through practice* |
| **Reference document creation** | "create a cheat sheet", "reference guide", "quick reference", "summary document" | vs writing-for-agents: writing-for-agents writes *for agents*; teach writes *for human learners* |

## E — Execution Steps (each with "完成标准:")

1. **Establish mission** — Ask user why they want to learn this. Write MISSION.md capturing the reason. If unclear, question until clear.  
   完成标准: MISSION.md exists; captures user's learning goal; grounds all subsequent lessons.

2. **Populate resources** — Find high-trust primary resources for the topic. Write RESOURCES.md with links and quality notes.  
   完成标准: RESOURCES.md populated with verified, high-trust sources.

3. **Assess zone of proximal development** — Read any existing learning-records. Determine what user already knows and what's the right next thing to teach.  
   完成标准: Zone of proximal development identified; lesson topic selected.

4. **Design lesson** — Create self-contained HTML lesson in lessons/*.html. Beautiful typography, short, one tangible win, tied to mission, in zone. Link to primary source. Include followup reminder.  
   完成标准: Lesson HTML exists; meets all design criteria; opens for user.

5. **Create reference document** — Compress lesson essence into reference/*.html (cheat sheet, quick reference). Designed for quick lookup, not sequential reading.  
   完成标准: Reference document exists; designed for quick lookup; linked from lesson.

6. **Record learning** — If lesson produced non-obvious insight, write learning-record in learning-records/*.md. Track what was learned and what may need revision.  
   完成标准: Learning record exists for significant insights; numbered sequentially.

## B — Boundaries & Limits

**不适用**:
- Single-session fact lookup (use research)
- Code review (use code-review)
- Bug diagnosis (use diagnosing-bugs)
- Design discussion (use grill-with-docs)

**局限**: Lessons require high-trust primary sources; topics without good sources degrade quality. Zone of proximal development is subjective — may misjudge difficulty. Multi-session state depends on filesystem; if files are deleted, progress is lost. Community wisdom is delegated — quality depends on community.

## Related Skills

- **research** (gathers facts for lesson content), **grill-with-docs** (sharpens learning goals), **writing-for-agents** (design principles for lesson structure), **to-questionnaire** (may gather learner preferences)

## Audit

V1✓ V2✓ V3✓ | 2026-08-26 | Source: D:\outcome\self\upstream\mattpocock__skills\skills\productivity\teach\SKILL.md
