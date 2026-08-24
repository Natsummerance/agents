# ENCY-charts Glossary（术语表）

> 基于《ENCY-charts 数据可视化设计规范》提取的核心术语，按字母顺序排列。

## A

### Agent Prompt Guide
- **定义**：一套让 AI 代理能够准确理解并执行设计规范的结构化文档
- **组成**：Quick Reference + Component Prompts + Iteration Guide
- **参见**：[agent-prompt-guide-glossary](./agent-prompt-guide-glossary/SKILL.md)

## C

### Categorical Palette（分类色板）
- **定义**：用于区分不同系列/分类数据的颜色集合，按优先级排列
- **示例**：`--chart-c-1: #4B7AFA`, `--chart-c-2: #44C2FD`...共 18 色
- **参见**：[categorical-palette-glossary](./categorical-palette-glossary/SKILL.md)

### Chart Type Selection（图表类型选择）
- **定义**：根据数据关系（比较/趋势/占比/分布）选择最合适的图表类型的决策框架
- **核心**：8 种常见图表类型的约束条件
- **参见**：[chart-type-selection-framework](./chart-type-selection-framework/SKILL.md)

### Clarity-First（清晰性优先）
- **定义**：数据可视化的第一性原理，清晰度优于美观性
- **子原则**：最高对比度、数据层级分明、克制装饰、可读性第一、合理留白
- **参见**：[clarity-first-principles](./clarity-first-principles/SKILL.md)

### Consistency（一致性）
- **定义**：通过统一的视觉语言降低用户认知成本
- **三个维度**：色彩一致性、字体一致性、间距一致性
- **参见**：[consistency-principles](./consistency-principles/SKILL.md)

## D

### Design Token Architecture（设计系统 Token 架构）
- **定义**：三层级的设计 Token 架构（Seed → Component → Semantic）
- **核心价值**：一致性、可维护性、主题切换能力
- **参见**：[design-token-architecture](./design-token-architecture/SKILL.md)

## K

### KPI Card（KPI 指标卡）
- **定义**：展示关键业务指标的核心数值、趋势和微型图表的组件
- **组成**：Label + Value + Trend + Micro Chart（可选）
- **参见**：[kpi-card-glossary](./kpi-card-glossary/SKILL.md)

## R

### Responsive Chart Strategy（响应式图表策略）
- **定义**：从桌面到移动端的完整响应式适配框架
- **三层策略**：断点定义层、布局重排层、交互优化层
- **参见**：[responsive-chart-strategy](./responsive-chart-strategy/SKILL.md)

## S

### Seed Token（种子令牌）
- **定义**：设计系统中最基础的原子级 CSS 变量
- **示例**：`--seed-brand: #4B7AFA`, `--chart-font-family`, `--chart-gap`
- **参见**：[seed-token-glossary](./seed-token-glossary/SKILL.md)

### Semantic Colors（语义色）
- **定义**：具有明确业务含义的颜色（成功/警告/危险/信息）
- **示例**：`--chart-success: #00B42A`, `--chart-danger: #F53F3F`
- **参见**：[semantic-colors-glossary](./semantic-colors-glossary/SKILL.md)

### Sequential Palette（顺序色板）
- **定义**：用于连续数值/热力/密度表达的渐变色板
- **示例**：7 级渐变 `--chart-seq-1` 到 `--chart-seq-7`
- **参见**：[sequential-palette-glossary](./sequential-palette-glossary/SKILL.md)

### Semantic Coloring（语义化配色）
- **定义**：将颜色与业务状态映射的设计原则
- **四条子原则**：业务含义映射、文化一致性、色盲友好、阈值可视化
- **参见**：[semantic-coloring-principles](./semantic-coloring-principles/SKILL.md)

## T

### Tooltip Unit（Tooltip 单位）
- **定义**：Tooltip 中必须包含的数据单位（万/亿/元/个/人/次/%）
- **重要性**：避免量级歧义，提供完整上下文
- **参见**：[tooltip-missing-unit-trap](./tooltip-missing-unit-trap/SKILL.md)

## 索引统计

- **总术语数**：13 个
- **覆盖范围**：设计系统、配色、图表类型、响应式、AI 友好规范
- **最后更新**：2026-08-24
