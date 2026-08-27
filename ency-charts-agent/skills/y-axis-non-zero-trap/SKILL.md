---
name: y-axis-non-zero-trap
description: |
  当用户考虑将柱状图的 Y 轴起点设为非零值时触发，用于警告这会放大微小差异并误导用户。触发场景：用户问"如何让两个数值的差异看起来更明显？"、"Y 轴可以从 90 开始吗？"、"截断 Y 轴是不是更好的展示方式？"。不适用于：折线图（可以截断）、对数坐标轴。关键 trigger 信号：Y 轴起点 / 截断 Y 轴 / 柱状图 Y 轴 / 放大差异。
source_book: 《ENCY-charts 数据可视化设计规范》 ENCY Design Team
source_chapter: 7. Do's #6
tags: [data-visualization, bar-chart, y-axis, misleading]
source_project: ENCY-charts 设计规范
related_skills: [chart-taboo-principles, chart-type-selection-framework]
---

# Y-Axis Non-Zero Trap（Y 轴不从零的误导）

## R (Reading) — 原文引用

> "Do's: 柱状图 Y 轴从 0 开始 — 避免视觉误导"

## I (Interpretation) — 方法论骨架

**核心问题**：柱状图的长度必须与数值成正比。如果 Y 轴不从 0 开始，柱子长度的比例将不再反映数值的真实比例，导致用户错误判断数据的重要性。

**失败机制**：
1. **比例失真**：Y 轴从 90 开始时，数值 95 和 100 的柱子高度比为 1:2，但实际数值比仅为 19:20（差距仅 5%）
2. **视觉放大**：微小差异被视觉上放大，用户误以为差异显著
3. **决策误导**：基于失真的视觉信息做出错误判断

**正确做法**：柱状图 Y 轴必须从 0 开始。如需突出微小差异，改用折线图或标注具体数值。

## A1 (Past Application) — 书中作者用过的案例

在 ENCY-charts 规范第 7 章 Do's 中，作者明确将"柱状图 Y 轴从 0 开始"列为必做项，并在新闻报道中常被用作反面教材（截断 Y 轴制造"戏剧性对比"）。

## A2 (Future Trigger) — 何时调用此 skill

**调用场景**：
- 分析师问"两个数值很接近，如何让差异更明显？"
- 产品经理说"Y 轴从 0 开始的话，柱子太短了，看不清"
- 设计师说"截断 Y 轴是不是更好的展示方式？"

**关键 trigger 词**：Y 轴起点 / 截断 Y 轴 / 柱状图 Y 轴 / 放大差异 / Y 轴从 90 开始

## E (Execution) — 可执行步骤

**步骤 1：检查 Y 轴配置** — 完成标准: 扫描脚本已跑通，输出"柱状图 Y 轴 min=0/ min≠0"判定结论
- 验证柱状图的 Y 轴最小值：
  ```javascript
  if (option.yAxis.min !== 0 && option.series.some(s => s.type === 'bar')) {
    console.error('柱状图 Y 轴必须从 0 开始');
  }
  ```

**步骤 2：修复 Y 轴起点** — 完成标准: option.yAxis.min 已设为 0，chartInstance.setOption 已调用且无报错
- 强制设置 Y 轴最小值为 0：
  ```javascript
  option.yAxis.min = 0;
  chartInstance.setOption(option);
  ```

**步骤 3：提供替代方案** — 完成标准: 已输出方案 A/B/C 至少一项并标注适用场景，若用户坚持柱状图则给出标注数值/表格展示的降级方案
- 如果需要突出微小差异：
  - **方案 A**：改用折线图（可以截断 Y 轴，因为折线图强调的是趋势而非绝对长度）
  - **方案 B**：在柱状图上标注具体数值
  - **方案 C**：使用表格展示精确数值

**步骤 4：验证比例准确性** — 完成标准: 手动检查柱子高度比等于数值比（如 50/100 高度比 1:2），输出"比例准确/失真"判定结论
- 手动检查：柱子高度比是否等于数值比
  - 例如：数值 50 和 100 的柱子高度比应为 1:2

## B (Boundary) — 边界与盲点

**例外情况**：
- 折线图：可以截断 Y 轴，因为强调的是趋势而非绝对长度
- 对数坐标轴：用于展示跨越多个数量级的数据

**相关 skills**：
- `chart-taboo-principles` — 图表禁忌清单
- `chart-type-selection-framework` — 图表类型选择决策框架
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