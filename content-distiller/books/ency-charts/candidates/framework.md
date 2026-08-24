# Framework Candidates

## F1: 图表类型选择决策框架（Chart Type Selection Framework）

**原文引用**：
> "柱状图 (Bar): barWidth: 60%, borderRadius: [4,4,0,0]... 折线图 (Line): lineWidth: 2px, symbol: 'circle'... 饼图 (Pie): radius: ['50%','70%']... 面积图 (Area): lineWidth: 0, 渐变 fill opacity: [0.15,0.02]..."（来自 4.6 图表类型样式速查表）

**框架描述**：
这是一个**数据特征到图表类型的映射决策框架**，根据数据的维度、关系和展示目的，选择最合适的可视化形式。

**框架骨架**：
1. **比较类数据** → 柱状图（Bar）：适合离散类别间的数值对比
2. **趋势类数据** → 折线图（Line）/面积图（Area）：适合时间序列或连续变量
3. **占比类数据** → 饼图/环形图（Pie）：适合部分与整体的关系（≤6 个扇区）
4. **分布类数据** → 散点图（Scatter）：适合两个变量的相关性分析
5. **进度类数据** → 仪表盘（Gauge）：适合单一指标的完成度展示
6. **流程类数据** → 漏斗图（Funnel）：适合转化率的阶段分析
7. **多维数据** → 雷达图（Radar）：适合多个维度的综合评估

**关键约束**：
- 饼图扇区不超过 6 个，超过时合并为"其他"
- 柱状图 Y 轴必须从 0 开始，避免视觉误导
- 数据点 ≥10 时，折线图隐藏 symbol 以保持清晰

**适用场景**：
- 任何数据可视化项目的图表选型
- Dashboard 设计时的图表搭配
- 数据分析报告的可视化呈现

**source_chapter**: 4.6 图表类型样式速查表 + 7. Do's and Don'ts

---

## F2: 设计系统 Token 架构（Design System Token Architecture）

**原文引用**：
> ":root { --seed-brand: #4B7AFA; --chart-font-family: ...; --chart-card-bg: ...; }"（来自 0. 品牌配置层）

**框架描述**：
这是一个**三层级的设计 Token 架构**，从基础种子（Seed）到组件（Component）再到页面（Page），确保设计一致性和可维护性。

**框架骨架**：
1. **Seed Token（种子层）**：定义最基础的原子值
   - 品牌色：`--seed-brand`, `--seed-brand-hover`
   - 字体：`--chart-font-family`, `--chart-font-size-sm/md/lg`
   - 间距：`--chart-gap`, `--chart-section-gap`
2. **Component Token（组件层）**：基于 Seed 组合成组件样式
   - 卡片：`--chart-card-bg`, `--chart-card-radius`, `--chart-card-shadow`
   - 坐标轴：`--chart-grid-line`, `--chart-axis-label`
   - Tooltip：`--chart-tooltip-bg`, `--chart-tooltip-text`
3. **Semantic Token（语义层）**：赋予业务含义的颜色
   - 成功/警告/危险/信息：`--chart-success/warning/danger/info`
   - 阈值线/平均线/基线：`--chart-target-line/average-line/baseline`

**核心价值**：
- 一致性：所有组件共享同一套 Token，避免样式冲突
- 可维护性：修改 Seed Token 即可全局更新
- 主题切换：通过 `[data-theme="dark"]` 覆盖 Token 实现暗色模式

**适用场景**：
- 任何设计系统的 Token 规划
- 多主题支持的架构设计
- 设计到开发的协作流程优化

**source_chapter**: 0. 品牌配置层 + 2. Color Palette & Roles

---

## F3: AI 友好的规范编写框架（AI-Friendly Specification Framework）

**原文引用**：
> "Quick Reference: ENCY Charts: 8 分类色板, 7 级顺序色板, 3 种卡片类型... Component Prompts: Prompt 1: 生成 KPI 指标卡片组... Iteration Guide: 1. 颜色第一位 2. 卡片是基本单位..."（来自 9. Agent Prompt Guide）

**框架描述**：
这是一个**让 AI 代理能够准确理解并执行设计规范的结构化框架**，通过 Quick Reference + Component Prompts + Iteration Guide 三件套，降低 AI 解析规范的难度。

**框架骨架**：
1. **Quick Reference（快速参考）**：用一句话总结核心规则
   - 格式："名称: 关键数字/颜色/尺寸, 名称: 关键数字/颜色/尺寸..."
   - 示例："ENCY Charts: 8 分类色板, 7 级顺序色板, 3 种卡片类型..."
2. **Component Prompts（组件提示词）**：提供典型场景的完整 prompt 模板
   - 包含：布局要求 + 样式细节 + 响应式规则
   - 示例："Prompt 1: 生成 KPI 指标卡片组... 使用 Grid 布局，卡片包含 label/value/trend..."
3. **Iteration Guide（迭代指南）**：列出 AI 生成代码后的检查清单
   - 10 条必检项：颜色第一位、卡片是基本单位、Tooltip 不离散、数据为空先处理...

**核心价值**：
- 降低 AI 误解概率：Quick Reference 提供压缩版知识
- 提高生成质量：Component Prompts 提供完整上下文
- 减少返工次数：Iteration Guide 提供自检清单

**适用场景**：
- 任何面向 AI 的设计规范编写
- Design System 文档的 AI 友好化改造
- AI 辅助开发的工作流优化

**source_chapter**: 9. Agent Prompt Guide

---

## F4: 响应式图表策略框架（Responsive Chart Strategy Framework）

**原文引用**：
> "断点: XL ≥1920px (3列), L ≥1440px (3列), M ≥1024px (2列), S ≥728px (2列), XS <728px (1列)... 移动端特殊行为: 柱状图转为水平柱状图, Legend 移至图表底部, Tooltip 固定于底部..."（来自 8. Responsive Behavior）

**框架描述**：
这是一个**从桌面到移动端的完整响应式适配框架**，涵盖断点定义、布局重排、交互优化三个层面。

**框架骨架**：
1. **断点定义**：5 个标准断点（XL/L/M/S/XS）
   - 每个断点对应不同的图表格列数和图表高度
2. **布局重排**：
   - 桌面端：多列网格布局
   - 平板端：减少列数，增加图表高度
   - 移动端：单列布局，横向柱状图替代纵向
3. **交互优化**：
   - Legend 位置：桌面端顶部/右侧 → 移动端底部
   - Tooltip 位置：桌面端跟随鼠标 → 移动端固定于底部
   - 触摸目标：最小 44x44px（符合 WCAG 标准）

**核心价值**：
- 无缝体验：用户在不同设备上获得一致的视觉层次
- 性能优化：移动端减少不必要的装饰元素
- 可用性保障：触摸目标符合人体工程学

**适用场景**：
- 任何数据可视化产品的响应式设计
- Dashboard 的多端适配
- 移动端图表交互优化

**source_chapter**: 5. Layout Principles + 8. Responsive Behavior
