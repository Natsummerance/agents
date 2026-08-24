---
name: no-systematic-methodology
description: |
  当用户完成多个项目但仍感到迷茫、不知道下一步该做什么，或随机选择项目缺乏连贯学习路径时调用此 skill。不适用于：已有明确学习计划的用户、只需要单个项目建议的场景。关键 trigger 信号：迷茫、不知道下一步、随机选择、缺乏系统性、完成项目但没进步。
source_book: App Ideas Collection Florin Pop
source_chapter: Introduction / problem statement
tags: [anti-pattern, systematic-learning, methodology-gap]
related_skills: ["tiered-learning-path", "no-progress-tracking", "no-testing-guidance", "no-collaboration-guidance"]
---

# SKILL.md - No Systematic Methodology（缺乏系统性方法论）

## R (Reading) - 原文引用

> "Have you ever wanted to build something but you had no idea what to do? Just as authors sometimes have \"writers block\" it's also true for developers. This list is intended to solve this issue once and for all! 👍"

## I (Interpretation) - 方法论骨架

**核心问题**：App Ideas Collection 只解决了"不知道要构建什么"的问题，但没有提供系统性的学习方法论。学习者可能完成了多个项目，但仍然不知道如何系统地提升技能或选择下一个项目。

**反模式特征**：
1. **随机选择项目**：学习者根据兴趣或难度随机选择项目，缺乏连贯的学习路径
2. **完成项目但不确定是否掌握**：没有明确的技能评估标准
3. **无法将项目经验转化为可迁移的技能**：每个项目都是孤立的练习

**根本原因**：app-ideas 是一个项目列表，而不是一个结构化的学习框架。它提供了内容，但没有提供方法论。

## A1 (Past Application) - 书中作者用过的案例

App Ideas Collection 本身就是一个典型案例：它列出了 89 个项目，按难度分为三个层级，但没有提供：
- 如何选择项目的系统性方法
- 如何评估自己是否真正掌握了某个层级的技能
- 如何将项目经验转化为可迁移的能力

这种"只是项目列表"的设计导致学习者可能完成多个项目，但仍然不知道自己的真实水平或下一步该做什么。

## A2 (Future Trigger) - 用户在什么情境下会需要这个

**适用场景**：
- 用户完成了几个项目，但仍感到迷茫，不知道下一步该做什么
- 用户随机选择项目，缺乏连贯的学习路径
- 用户想知道自己是否真正提升了技能
- 用户想建立系统性的学习方法，而不是随机练习

**与相邻 skill 的区分**：
- 与 `tiered-learning-path` 的区别：no-systematic-methodology 是**反模式警示**（指出 app-ideas 的缺陷），而 tiered-learning-path 是**正面指导**（提供分级学习路径）。两者互补：先识别问题，再应用解决方案。
- 与 `no-progress-tracking` 的区别：no-systematic-methodology 关注**整体学习框架的缺失**，而 no-progress-tracking 关注**具体进度追踪机制的缺失**。前者更宏观，后者更具体。

## E (Execution) - 可执行步骤

1. **识别反模式症状**
   - 询问用户是否随机选择项目
   - 检查用户是否有明确的学习目标
   - 评估用户是否能清晰描述自己的技能成长

2. **引入系统性方法论**
   - 应用 `tiered-learning-path` 建立分级学习路径
   - 为每个层级设定明确的技能目标（如 Tier 1 完成后应能独立完成 UI 应用）
   - 建立项目之间的依赖关系（如先做 Calculator 再做 Currency Converter）

3. **建立反馈循环**
   - 定期回顾已完成的项目
   - 评估是否真正掌握了该层级的技能
   - 根据反馈调整下一个项目的选择

4. **避免随机选择**
   - 不要仅凭兴趣选择项目
   - 确保每个项目都有明确的学习目标
   - 将项目串联成连贯的学习路径

## B (Boundary) - 什么时候不适用

**不适用场景**：
- 用户已经有明确的学习计划或课程大纲
- 用户只是为了兴趣而练习，不追求系统性提升
- 用户只需要单个项目建议，不需要整体框架

**作者的盲点**：
- Florin Pop 假设"提供项目列表"就足以解决开发者的瓶颈，但实际上学习者更需要的是方法论
- app-ideas 缺少对学习路径、技能评估和反馈循环的设计
- 这种"内容优先于方法"的思路可能导致学习者完成多个项目但仍感到迷茫
