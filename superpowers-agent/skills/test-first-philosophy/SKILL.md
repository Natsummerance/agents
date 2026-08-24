---
name: test-first-philosophy
description: |
  当用户需要了解或执行 TDD（测试驱动开发）原则、RED-GREEN-REFACTOR 循环、或为什么测试应该是强制性的而不是可选的时候调用此 skill。适用于所有功能实现、Bug 修复、重构任务。不适用于：探索性编程、原型开发、一次性脚本。关键 trigger 信号："TDD"、"test-driven"、"RED-GREEN-REFACTOR"、"write tests first"、"delete code before tests"、"mandatory testing"。
source_book: 《Superpowers》 obra
source_chapter: How it works / The Basic Workflow / What's Inside / Philosophy
tags: [principle, tdd, testing, mandatory]
related_skills: ["mandatory-workflow", "evidence-over-claims", "skipping-tests-anti-pattern"]
---

# Test-First Philosophy (TDD is Mandatory)

## R (Reading) - 原文引用

> "It emphasizes true red/green TDD, YAGNI (You Aren't Gonna Need It), and DRY."

> "test-driven-development - Activates during implementation. Enforces RED-GREEN-REFACTOR: write failing test, watch it fail, write minimal code, watch it pass, commit. Deletes code written before tests."

> "Philosophy: Test-Driven Development - Write tests first, always"

## I (Interpretation) - 方法论骨架

Test-First Philosophy 是 Superpowers 的核心设计原则之一，强调 TDD 是强制性的，不是可选的。其核心是：

1. **RED-GREEN-REFACTOR 循环**：
   - **RED**：写一个失败的测试（描述期望的行为）
   - **GREEN**：写最少的代码让测试通过
   - **REFACTOR**：重构代码，保持测试通过
2. **删除在测试之前写的代码**：如果先写了代码后写测试，必须删除代码重新按 TDD 流程执行
3. **验证测试基线**：确保测试套件在干净状态下通过

这种方法的优势在于：通过测试先行保证代码质量，通过最小化实现避免过度设计，通过严格的重构保证代码可维护性。

## A1 (Past Application) - 书中作者用过的案例

在 Superpowers 的基本工作流中，第 5 步明确说明：实现过程中会激活 test-driven-development skill，强制执行 RED-GREEN-REFACTOR 循环。作者 Jesse Vincent 强调，TDD 不是建议而是强制性要求，违反者会被要求删除代码重新执行。

## A2 (Future Trigger) - 何时调用

**调用时机**：
- 用户需要实现新功能但不确定如何开始
- 用户需要修复 Bug 但不确定是否真的修复了
- 用户需要重构代码但担心引入回归
- 用户提到"TDD"、"test-driven"、"RED-GREEN-REFACTOR"、"write tests first"等关键词

**不调用时机**：
- 探索性编程：需要先尝试不同方案，TDD 可能过于严格
- 原型开发：快速验证想法，不需要完整测试
- 一次性脚本：不需要长期维护，TDD 成本过高

**与相邻 skill 的区分**：
- 与 `skipping-tests-anti-pattern` 的关系：test-first-philosophy 是正面指导；skipping-tests-anti-pattern 是反面警示
- 与 `evidence-over-claims` 的区别：test-first-philosophy 关注测试先行；evidence-over-claims 关注验证后再声明成功

**关键 trigger 信号**：用户提到"TDD"、"test-driven"、"RED-GREEN-REFACTOR"、"write tests first"、"delete code before tests"、"mandatory testing"等关键词。

## E (Execution) - 可执行步骤

1. **理解需求**：明确要实现的功能或要修复的 Bug
2. **写失败测试**：编写一个描述期望行为的测试，确认它失败（RED）
3. **运行测试**：确认测试确实失败，排除假阳性
4. **写最少代码**：编写刚好能让测试通过的代码，不做多余工作（GREEN）
5. **运行测试**：确认测试通过
6. **重构**：优化代码结构，保持测试通过（REFACTOR）
7. **提交**：将测试和代码一起提交
8. **重复**：回到步骤 2，处理下一个功能点

**判停条件**：所有功能点完成且测试全部通过，或用户明确要求停止。

## B (Boundary) - 边界意识

**不适用的场景**：
- 探索性编程：需要先尝试不同方案，TDD 可能限制创造力
- 原型开发：快速验证想法，不需要完整测试
- 一次性脚本：不需要长期维护，TDD 成本过高

**作者的盲点**：
- **TDD 学习曲线**：对于不熟悉 TDD 的开发者，RED-GREEN-REFACTOR 循环可能需要时间适应
- **测试覆盖率 vs 速度**：严格的 TDD 可能降低开发速度，对于快速迭代的项目可能不适用
- **"删除代码"的极端性**：要求删除在测试之前写的代码可能过于严格，在某些情况下可能导致大量返工
