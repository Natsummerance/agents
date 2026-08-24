# Glossary Candidates

## G1: Seed Token（种子令牌）

**定义**：
设计系统中最基础的原子级 CSS 变量，作为所有组件样式的源头。Seed Token 不可再分解，是设计系统的"基因"。

**核心特征**：
- 原子性：不可再分解的基础值（如颜色、字体、间距）
- 全局性：所有组件共享同一套 Seed Token
- 稳定性：一旦定义，极少修改

**典型示例**：
- `--seed-brand: #4B7AFA`（品牌主色）
- `--chart-font-family: "PingFang SC", ...`（字体族）
- `--chart-gap: 16px`（基准间距）

**相关概念**：
- Component Token（组件令牌）：基于 Seed Token 组合而成
- Semantic Token（语义令牌）：赋予业务含义的颜色

**source_chapter**: 0. 品牌配置层 - Seed Token

---

## G2: 分类色板（Categorical Palette）

**定义**：
用于区分不同系列/分类数据的颜色集合，按优先级排列（从 --chart-c-1 到 --chart-c-18）。

**核心特征**：
- 离散性：每个颜色代表一个独立的类别
- 可区分性：相邻颜色相似度 ≤80%，色盲用户可区分
- 有序性：按视觉权重排序（主色优先）

**典型示例**：
- `--chart-c-1: #4B7AFA`（主色 / 第 1 系列）
- `--chart-c-2: #44C2FD`（第 2 系列）
- `--chart-c-3: #FFCE0E`（第 3 系列）

**适用场景**：
- 多系列柱状图/折线图
- 饼图/环形图的扇区着色
- Legend 中的颜色标识

**source_chapter**: 2.1 图表分类色板

---

## G3: 顺序色板（Sequential Palette）

**定义**：
用于连续数值/热力/密度表达的渐变色板，从浅色到深色表示数值从小到大。

**核心特征**：
- 连续性：颜色之间平滑过渡，无跳跃
- 单调性：亮度/饱和度随数值单调变化
-  perceptual uniformity：人眼感知的变化与数值变化一致

**典型示例**：
- `--chart-seq-1: #E8F3FF`（最小值）
- `--chart-seq-4: #5CA8FF`（中间值）
- `--chart-seq-7: #1A54D4`（最大值）

**适用场景**：
- 热力图（Heatmap）
- 地理分布图（Choropleth Map）
- 密度散点图

**source_chapter**: 2.2 顺序色板

---

## G4: 语义色（Semantic Colors）

**定义**：
具有明确业务含义的颜色，用于传达状态、趋势或阈值信息。

**核心特征**：
- 业务映射：颜色与业务状态一一对应（成功/警告/危险/信息）
- 文化一致性：遵循目标用户的文化习惯（如红色=危险）
- 辅助编码：不依赖单一颜色，配合图标/文字辅助理解

**典型示例**：
- `--chart-success: #00B42A`（成功/上涨）
- `--chart-warning: #FF7D00`（警告）
- `--chart-danger: #F53F3F`（危险/下跌）
- `--chart-info: #2469FF`（信息/中性）

**适用场景**：
- KPI 指标卡的趋势标识
- 告警系统的状态展示
- 阈值线的视觉标记

**source_chapter**: 2.3 语义色

---

## G5: KPI 指标卡（KPI Card）

**定义**：
一种特殊的图表容器组件，用于展示关键业务指标的核心数值、趋势和微型图表。

**核心组成**：
- Label（指标名）：12px / 400 字重 / #86909C
- Value（主数值）：28px / 600 字重 / DIN Alternate 字体
- Trend（趋势标识）：11px / 颜色编码（绿=涨，红=跌）
- Micro Chart（可选）：40px 高的迷你折线图

**典型示例**：
```css
.kpi-card__value {
  font-size: 28px;
  font-weight: 600;
  font-family: var(--chart-number-font);
  font-variant-numeric: tabular-nums;
}
```

**适用场景**：
- Dashboard 顶部的核心指标概览
- 业务报表的关键数据展示
- 实时监控面板的核心指标

**source_chapter**: 4.2 KPI 指标卡

---

## G6: 微型图表卡（Micro Chart Card）

**定义**：
一种轻量级的图表容器，将简化版的图表（通常是折线图或柱状图）嵌入到指标卡中，提供趋势上下文。

**核心特征**：
- 极简尺寸：高度通常 32-40px
- 单色显示：不使用多色系列，仅用品牌色
- 无交互：不支持 Tooltip 或缩放

**典型示例**：
```css
.micro-chart-card__chart {
  height: 32px;
}
```

**适用场景**：
- KPI 指标卡的底部趋势展示
- 表格单元格内的简化趋势
- 列表项中的快速预览

**source_chapter**: 4.3 微型图表卡

---

## G7: Agent Prompt Guide（AI 代理提示指南）

**定义**：
一套让 AI 代理能够准确理解并执行设计规范的结构化文档，包含 Quick Reference、Component Prompts 和 Iteration Guide 三部分。

**核心组成**：
1. **Quick Reference**：用一句话总结核心规则（压缩版知识）
2. **Component Prompts**：提供典型场景的完整 prompt 模板
3. **Iteration Guide**：列出 AI 生成代码后的 10 条检查清单

**核心价值**：
- 降低 AI 误解概率
- 提高生成代码质量
- 减少人工返工次数

**适用场景**：
- 面向 AI 的设计规范编写
- Design System 文档的 AI 友好化
- AI 辅助开发的工作流优化

**source_chapter**: 9. Agent Prompt Guide

---

## G8: 响应式断点（Responsive Breakpoints）

**定义**：
预设的屏幕宽度阈值，用于触发不同的布局和样式适配策略。

**标准断点**：
| 断点 | 宽度 | 图表格列数 | KPI 卡列数 |
|------|------|-----------|-----------|
| XL | ≥1920px | 3 列 | 6 列 |
| L | ≥1440px | 3 列 | 4-5 列 |
| M | ≥1024px | 2 列 | 3-4 列 |
| S | ≥728px | 2 列 | 2 列 |
| XS | <728px | 1 列 | 1 列 |

**核心价值**：
- 确保不同屏幕尺寸下的可读性
- 自动适配布局，无需手动干预
- 移动端优化触摸体验

**source_chapter**: 5.2 响应式断点 + 8.1 图表自适应策略
