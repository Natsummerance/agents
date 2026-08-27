---
name: no-systematic-methodology
description: |
  当用户安装了多个技能但仍感到迷茫、不知道如何系统提升工程能力，或随机选择技能缺乏连贯学习路径时调用此 skill。不适用于：已有明确学习计划的用户、只需要单个技能建议的场景。关键 trigger 信号：迷茫、不知道下一步、随机选择、缺乏系统性、完成技能但没进步。
source_book: Agent Skills Addy Osmani
source_project: addyosmani/agent-skills
source_chapter: Introduction / problem statement
tags: [anti-pattern, systematic-learning, methodology-gap]
related_skills: ["no-progress-tracking", "spec-driven-development"]
---

# SKILL.md - No Systematic Methodology（缺乏系统性方法论）

## R (Reading) - 原文引用

> "Skills encode the workflows, quality gates, and best practices that senior engineers use when building software."

## I (Interpretation) - 方法论骨架

**核心问题**：Agent Skills 只提供了技能列表，但没有提供系统性的学习方法论。用户可能安装了多个技能，但仍然不知道如何系统地提升工程能力或选择下一个要学习的技能。

**反模式特征**：
1. **随机选择技能**：用户根据兴趣或难度随机选择技能，缺乏连贯的学习路径
2. **完成技能但不确定是否掌握**：没有明确的技能评估标准
3. **无法将技能经验转化为可迁移的工程能力**：每个技能都是孤立的练习

**根本原因**：agent-skills 是一个技能集合，而不是一个结构化的学习框架。它提供了内容，但没有提供方法论。

## A1 (Past Application) - 书中作者用过的案例

Agent Skills 本身就是一个典型案例：它列出了 24+ 个技能，按开发生命周期分为 6 个阶段，但没有提供：
- 如何选择技能的系统性方法
- 如何评估自己是否真正掌握了某个技能
- 如何将技能经验转化为可迁移的能力

这种"只是技能列表"的设计导致用户可能完成多个技能，但仍然不知道自己的真实水平或下一步该做什么。

## A2 (Future Trigger) - 用户在什么情境下会需要这个

**适用场景**：
- 用户完成了几个技能，但仍感到迷茫，不知道下一步该做什么
- 用户随机选择技能，缺乏连贯的学习路径
- 用户想知道自己是否真正提升了工程能力
- 用户想建立系统性的学习方法，而不是随机练习

**与相邻 skill 的区分**：
- 与 `no-progress-tracking` 的区别：no-systematic-methodology 是**整体学习框架的缺失**，而 no-progress-tracking 是**具体进度追踪机制的缺失**。前者更宏观，后者更具体。
- 与 `spec-driven-development` 的区别：no-systematic-methodology 是**反模式警示**（指出 agent-skills 的缺陷），而 spec-driven-development 是**正面指导**（提供规格说明驱动开发）。两者互补：先识别问题，再应用解决方案。

## E (Execution) - 可执行步骤

1. **识别反模式症状**
   - 询问用户是否随机选择技能
   - 检查用户是否有明确的学习目标
   - 评估用户是否能清晰描述自己的技能成长
   - 完成标准: 三项症状核查完成并给出命中/未命中的明确结论

2. **引入系统性方法论**
   - 基于开发生命周期建立学习路径（DEFINE → PLAN → BUILD → VERIFY → REVIEW → SHIP）
   - 为每个阶段设定明确的技能目标
   - 建立技能之间的依赖关系
   - 完成标准: 学习路径覆盖六个阶段，每阶段有技能目标和前置依赖说明

3. **建立反馈循环**
   - 定期回顾已完成的技能
   - 评估是否真正掌握了该阶段的技能
   - 根据反馈调整下一个技能的选择
   - 完成标准: 回顾按固定周期执行且每次留有掌握度评估记录

4. **避免随机选择**
   - 不要仅凭兴趣选择技能
   - 确保每个技能都有明确的学习目标
   - 将技能串联成连贯的学习路径
   - 完成标准: 下一个技能的选择理由与既定学习路径一致，可追溯

## B (Boundary) - 什么时候不适用

**不适用场景**：
- 用户已经有明确的学习计划或课程大纲
- 用户只是为了兴趣而练习，不追求系统性提升
- 用户只需要单个技能建议，不需要整体框架

**作者的盲点**：
- Addy Osmani 假设"提供技能列表"就足以帮助用户提升工程能力，但实际上用户更需要的是方法论
- agent-skills 缺少对学习路径、技能评估和反馈循环的设计
- 这种"内容优先于方法"的思路可能导致用户完成多个技能但仍感到迷茫
