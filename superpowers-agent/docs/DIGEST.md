# DIGEST.md - obra/superpowers 精华长文

> 基于 obra/superpowers 蒸馏的核心方法论，不读全书、只看精华。

## 🎯 核心价值主张

Superpowers 是一个拥有 **276,712+ stars** 的 agentic skills 框架和软件开发方法论，由 Jesse Vincent (Prime Radiant) 创建。其核心创新在于为编码 Agent 提供一套**完整的、强制性的软件开发工作流**，让 Agent 能够自主工作数小时而不偏离计划。

---

## 🔥 传统编码助手的痛点

### 1. Jumping into Code Without Understanding
**现象**: Agent 直接跳进写代码而不先理解需求  
**根本原因**: 缺乏 brainstorming 和需求细化步骤  
**解决方案**: 激活 brainstorming skill，通过问题细化需求，分块展示设计供验证

### 2. Skipping Tests or Writing Code Before Tests
**现象**: 跳过测试或先写代码后写测试，导致代码质量下降、回归 bug 频发  
**根本原因**: TDD 不是强制性的  
**解决方案**: 强制执行 RED-GREEN-REFACTOR 循环，删除在测试之前写的代码

### 3. Ad-hoc Debugging Instead of Systematic Root Cause Tracing
**现象**: 凭猜测调试而不是系统性根因追踪，导致 Bug 反复出现  
**根本原因**: 缺乏系统性调试方法  
**解决方案**: 使用 4 阶段根因追踪流程（根因追踪、防御性深度分析、基于条件的等待、验证）

---

## 💡 核心设计哲学：Mandatory 7-Step Workflow

Superpowers 的核心是一个**7 步强制工作流**，每个步骤在特定时机自动激活，不是建议而是强制要求：

1. **brainstorming** - 激活于写代码前，通过问题细化需求，分块展示设计供验证
2. **using-git-worktrees** - 激活于设计批准后，创建隔离工作区，验证测试基线
3. **writing-plans** - 激活于设计批准后，将工作分解为 2-5 分钟的小任务
4. **subagent-driven-development / executing-plans** - 激活于计划后，分派子 Agent 或批量执行
5. **test-driven-development** - 激活于实现中，强制执行 RED-GREEN-REFACTOR
6. **requesting-code-review** - 激活于任务间，按严重性报告问题
7. **finishing-a-development-branch** - 激活于任务完成，验证测试，清理工作区

**关键特点**：Agent 在执行任何任务前都会检查相关 skills，确保流程完整执行。

---

## 🛠️ 核心 Skills 库

### Frameworks（3 个）
- **subagent-driven-development**: 分派新鲜子 Agent + 两阶段审查（规范合规性 + 代码质量）
- **mandatory-workflow**: 7 步强制工作流框架
- **git-worktree-isolation**: 使用 Git worktrees 创建隔离工作区

### Principles（2 个）
- **test-first-philosophy**: TDD 是强制性的，RED-GREEN-REFACTOR 循环
- **evidence-over-claims**: 验证后再声明成功，基于证据而非声称

### Anti-Patterns（2 个）
- **skipping-tests-anti-pattern**: 跳过测试或先写代码后写测试的反模式
- **ad-hoc-debugging-anti-pattern**: 凭猜测调试而不是系统性根因追踪的反模式

---

## 🧠 可迁移的思维模型

### 1. Subagent-driven-Development (SDD)
分派新鲜子 Agent 处理每个工程任务，两阶段审查保证质量。Agent 可以自主工作数小时而不偏离计划。

**应用场景**: 大型功能开发、多任务并行、需要长时间自主工作的场景

### 2. Test-First Philosophy
TDD 是强制性的，不是可选的。RED-GREEN-REFACTOR 循环：写失败测试 → 看它失败 → 写最少代码 → 看它通过 → 提交。

**应用场景**: 所有功能实现、Bug 修复、重构任务

### 3. Evidence over Claims
验证后再声明成功，基于证据而非声称。系统性验证确保问题真正解决。

**应用场景**: Bug 修复验证、功能完成确认、性能优化验证

### 4. Systematic Debugging
4 阶段根因追踪流程：根因追踪 → 防御性深度分析 → 基于条件的等待 → 验证。

**应用场景**: 复杂 Bug 调试、问题反复出现的场景

---

## ⚠️ 边界意识

### ✅ 适用场景
- 新项目启动
- 功能开发
- 重构任务
- Bug 修复
- 团队协作

### ❌ 不适用场景
- 一次性脚本
- 纯艺术性代码
- 紧急 hotfix
- 探索性编程（TDD 可能过于严格）

---

## 📚 延伸阅读

- [官方仓库](https://github.com/obra/superpowers)
- [Release Announcement](https://blog.fsck.com/2025/10/09/superpowers/)
- [Discord Community](https://discord.gg/35wsABTejz)

---

*最后更新: 2026-08-24*
