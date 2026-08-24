# GLOSSARY.md - obra/superpowers 术语词典

> 基于 candidates/glossary.md 整理的关键概念词典

## 📚 核心术语

### Subagent-driven-development (SDD)
**定义**: 分派新鲜子 Agent 处理每个工程任务，两阶段审查（规范合规性 + 代码质量）

**原文引用**:
> "dispatches fresh subagent per task with two-stage review (spec compliance, then code quality)"

**相关技能**: [subagent-driven-development](./subagent-driven-development/SKILL.md), mandatory-workflow

---

### RED-GREEN-REFACTOR
**定义**: TDD 的核心循环 - 写失败测试 → 看它失败 → 写最少代码 → 看它通过 → 提交

**原文引用**:
> "Enforces RED-GREEN-REFACTOR: write failing test, watch it fail, write minimal code, watch it pass, commit."

**相关技能**: [test-first-philosophy](./test-first-philosophy/SKILL.md), skipping-tests-anti-pattern

---

### Git Worktrees
**定义**: 使用 Git worktrees 创建隔离工作区，在新分支上工作，不影响主分支

**原文引用**:
> "Creates isolated workspace on new branch, runs project setup, verifies clean test baseline."

**相关技能**: [git-worktree-isolation](./git-worktree-isolation/SKILL.md), mandatory-workflow

---

### YAGNI / DRY
**定义**: 
- **YAGNI**: You Aren't Gonna Need It - 不要过度设计
- **DRY**: Don't Repeat Yourself - 避免重复代码

**原文引用**:
> "It emphasizes true red/green TDD, YAGNI (You Aren't Gonna Need It), and DRY."

**相关技能**: mandatory-workflow, test-first-philosophy

---

### Two-stage Review
**定义**: 两阶段审查 - 先检查规范合规性，再检查代码质量

**原文引用**:
> "having agents work through each engineering task, inspecting and reviewing their work"

> "two-stage review (spec compliance, then code quality)"

**相关技能**: [subagent-driven-development](./subagent-driven-development/SKILL.md), mandatory-workflow

---

### Verification-before-completion
**定义**: 验证确保修复，基于证据而非声称

**原文引用**:
> "verification-before-completion - Ensure it's actually fixed"

> "Philosophy: Evidence over claims - Verify before declaring success"

**相关技能**: [evidence-over-claims](./evidence-over-claims/SKILL.md), ad-hoc-debugging-anti-pattern

---

### Systematic Debugging
**定义**: 4 阶段根因追踪流程（根因追踪、防御性深度分析、基于条件的等待、验证）

**原文引用**:
> "systematic-debugging - 4-phase root cause process (includes root-cause-tracing, defense-in-depth, condition-based-waiting techniques)"

**相关技能**: [ad-hoc-debugging-anti-pattern](./ad-hoc-debugging-anti-pattern/SKILL.md), evidence-over-claims

---

### Mandatory Workflow
**定义**: 7 步强制工作流（brainstorming → using-git-worktrees → writing-plans → subagent-driven-development → test-driven-development → requesting-code-review → finishing-a-development-branch）

**原文引用**:
> "The agent checks for relevant skills before any task. Mandatory workflows, not suggestions."

**相关技能**: [mandatory-workflow](./mandatory-workflow/SKILL.md)

---

*最后更新: 2026-08-24*
