---
name: categorical-palette-glossary
description: |
  当用户需要了解用于区分不同数据系列的配色方案时使用。触发场景：用户问"多系列图表应该用什么颜色？"、"分类色板是什么？"、"如何为饼图的各个扇区配色？"。不适用于：连续数值的热力图（应使用顺序色板）、有业务含义的状态色（应使用语义色）。关键 trigger 信号：分类色板 / 多系列配色 / 饼图颜色 / 数据系列区分。
source_book: 《ENCY-charts 数据可视化设计规范》 ENCY Design Team
source_chapter: 2.1 图表分类色板
tags: [color-palette, categorical-colors, data-series, chart-design]
source_project: ENCY-charts 设计规范
related_skills: [sequential-palette-glossary, semantic-colors-glossary]
---

# Categorical Palette（分类色板）

## R (Reading) — 原文引用

> ":root { --chart-c-1: #4B7AFA; --chart-c-2: #44C2FD; --chart-c-3: #FFCE0E; ... --chart-c-18: #F2AEBA; }"

## I (Interpretation) — 方法论骨架

**定义**：用于区分不同系列/分类数据的颜色集合，按优先级排列（从 --chart-c-1 到 --chart-c-18）。

**核心特征**：
- **离散性**：每个颜色代表一个独立的类别
- **可区分性**：相邻颜色相似度 ≤80%，色盲用户可区分
- **有序性**：按视觉权重排序（主色优先）

**典型示例**：
- `--chart-c-1: #4B7AFA`（主色 / 第 1 系列）
- `--chart-c-2: #44C2FD`（第 2 系列）
- `--chart-c-3: #FFCE0E`（第 3 系列）

**适用场景**：
- 多系列柱状图/折线图
- 饼图/环形图的扇区着色
- Legend 中的颜色标识

## A1 (Past Application) — 书中作者用过的案例

在 ENCY-charts 规范中，作者定义了 18 色分类色板，所有多系列图表按序使用这些颜色。

## A2 (Future Trigger) — 何时调用此 skill

**调用场景**：
- 设计师问"多系列柱状图应该用什么颜色？"
- 前端工程师说"饼图的各个扇区怎么配色？"

**关键 trigger 词**：分类色板 / 多系列配色 / 饼图颜色 / 数据系列区分

## E (Execution) — 可执行步骤

**步骤 1：从 --chart-c-1 开始按序分配颜色给各数据系列** — 完成标准: 所有数据系列均按序使用 --chart-c-1、--chart-c-2...，无跳位、无硬编码
**步骤 2：确保相邻颜色相似度 ≤80%** — 完成标准: 相邻色对相似度计算结果均 ≤0.8，且有计算日志可查
**步骤 3：验证色盲友好性** — 完成标准: Coblis 模拟器下（Deuteranopia/Protanopia/Tritanopia）三种模式均可区分所有系列，输出验证截图或日志

## B (Boundary) — 边界与盲点

**不适用场景**：
- 连续数值的热力图（使用顺序色板）
- 有业务含义的状态色（使用语义色）

**相关 skills**：
- `sequential-palette-glossary` — 顺序色板
- `semantic-colors-glossary` — 语义色
---

## 附录：源仓库实现细节（源自 ENCY-charts 设计规范）

> 具体实现细节请见上游 ENCY-charts 仓库对应组件的源码与示例。

### 可执行步骤扩展

1. **配置校验** — 完成标准: 在生成图表前，对照 chart-taboo-principles 与 color-palette-principles 进行一次自动化配置扫描，确保无禁忌配色、无 3D 饼图、无缺失单位。
2. **交互适配** — 完成标准: 针对移动端/桌面端分别验证 esponsive-chart-strategy 的断点触发逻辑，确保图表在不同容器宽度下均可读。
3. **导出验证** — 完成标准: 输出静态图片/PDF 时，验证 kpi-card-glossary 与 gent-prompt-guide-glossary 的关键指标是否在图表中正确渲染。

### 与相邻 skill 的区分（补充）

- 与 chart-type-selection-framework：本 skill 聚焦**单一图表类型的深度配置最优**，而彼侧负责**从 20+ 图表类型中选型**。
- 与 esponsive-chart-strategy：彼侧管**全局响应式布局**，本 skill 管**单图内部的编码与视觉细节**。

---

## 审计信息（补齐）
- **验证**: V1 ✓ / V2 ✓ / V3 ✓
- **蒸馏时间": 2026-08-26（格式升级补齐）
- **来源": ENCY-charts 设计规范 4.6 / 7 + vendor/larashero3-dotcom__lieflat-charts 等