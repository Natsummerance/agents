---
name: semantic-colors-glossary
description: |
  当用户需要了解具有业务含义的颜色（成功/警告/危险/信息）时使用。触发场景：用户问"成功状态应该用什么颜色？"、"KPI 上涨用绿色还是红色？"、"告警系统的颜色怎么设计？"。不适用于：纯装饰性配色、无业务含义的数据系列（应使用分类色板）。关键 trigger 信号：语义色 / 成功失败颜色 / 告警颜色 / KPI 趋势色。
source_book: 《ENCY-charts 数据可视化设计规范》 ENCY Design Team
source_chapter: 2.3 语义色
tags: [semantic-colors, status-indicators, business-meaning, accessibility]
source_project: ENCY-charts 设计规范
related_skills: [semantic-coloring-principles, categorical-palette-glossary]
---

# Semantic Colors（语义色）

## R (Reading) — 原文引用

> ":root { --chart-success: #00B42A; --chart-warning: #FF7D00; --chart-danger: #F53F3F; --chart-info: #2469FF; }"

## I (Interpretation) — 方法论骨架

**定义**：具有明确业务含义的颜色，用于传达状态、趋势或阈值信息。

**核心特征**：
- **业务映射**：颜色与业务状态一一对应（成功/警告/危险/信息）
- **文化一致性**：遵循目标用户的文化习惯（如红色=危险）
- **辅助编码**：不依赖单一颜色，配合图标/文字辅助理解

**典型示例**：
- `--chart-success: #00B42A`（成功/上涨）
- `--chart-warning: #FF7D00`（警告）
- `--chart-danger: #F53F3F`（危险/下跌）
- `--chart-info: #2469FF`（信息/中性）

**适用场景**：
- KPI 指标卡的趋势标识
- 告警系统的状态展示
- 阈值线的视觉标记

## A1 (Past Application) — 书中作者用过的案例

在 ENCY-charts 规范中，作者定义了四态语义色，并在 KPI 卡片中使用绿色表示上涨、红色表示下跌。

## A2 (Future Trigger) — 何时调用此 skill

**调用场景**：
- 设计师问"成功状态应该用什么颜色？"
- 产品经理说"KPI 上涨用绿色还是红色？"

**关键 trigger 词**：语义色 / 成功失败颜色 / 告警颜色 / KPI 趋势色

## E (Execution) — 可执行步骤

**步骤 1：根据业务需求和文化习惯定义四态颜色** — 完成标准: 成功/警告/危险/信息四态 CSS 变量已定义且符合目标市场文化习惯（如中式股市红跌绿涨）
**步骤 2：配合图标/文字辅助理解（色盲友好）** — 完成标准: 所有语义色使用场景均含图标/文字辅助，Coblis 模拟器三模式验证通过
**步骤 3：验证对比度 ≥4.5:1** — 完成标准: 四态颜色在亮/暗两套背景下对比度均 ≥4.5:1，工具验证日志可查

## B (Boundary) — 边界与盲点

**不适用场景**：
- 纯装饰性配色
- 无业务含义的数据系列（使用分类色板）

**相关 skills**：
- `semantic-coloring-principles` — 语义化配色原则
- `categorical-palette-glossary` — 分类色板
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