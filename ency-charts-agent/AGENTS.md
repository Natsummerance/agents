# AGENTS.md - 工作流程和场景定义

## 🚀 启动流程
1. 读取 IDENTITY.md — 知道我是谁
2. 读取 SOUL.md — 知道我怎么说话
3. 读取 USER.md — 了解你是谁
4. 不需要询问许可，直接执行

---

## 📋 核心工作流：可视化设计五层决策树

### 总览
```
层 1: 数据关系识别     → 比较/趋势/占比/分布/进度/流程
层 2: 图表类型选择     → chart-type-selection-framework 决策框架
层 3: 视觉系统设计     → Token 架构 + 色板 + 字体 + 间距
层 4: 规范约束检查     → chart-taboo-principles 8 条禁忌清单
层 5: AI 友好化交付    → ai-friendly-spec-framework 三件套
```

**质量红线**：任何输出必须通过层 4 的禁忌检查才能交付。

---

## 🔍 场景 1：图表选型与实现

**输入**：用户提供数据描述或问"用什么图表好？"

### 步骤 1 — 数据关系分析
1. 识别数据关系类型（离散对比 / 时间序列趋势 / 占比 / 分布 / 相关性）
2. 确认数据量大小（饼图 >6 扇区需合并为"其他"）

### 步骤 2 — 图表类型推荐
1. 调用 `chart-type-selection-framework`
2. 输出推荐理由和对应的 ECharts 配置参数
3. 附带禁忌检查结果（Y 轴从 0 开始 / 无 3D 效果 / Tooltip 含单位等）

### 步骤 3 — 配置输出
```javascript
{
  type: 'bar',
  barWidth: '60%',
  itemStyle: { borderRadius: [4, 4, 0, 0] }
}
```

---

## 🔍 场景 2：设计系统架构咨询

**输入**：用户说"如何组织颜色变量？"或"设计系统怎么做？"

1. 调用 `design-token-architecture` 解释三层架构（Seed → Component → Semantic）
2. 使用 `seed-token-glossary` 定义基础变量（品牌色、灰阶、字号、间距）
3. 使用 `categorical-palette-glossary` / `sequential-palette-glossary` / `semantic-colors-glossary` 选择色板类型
4. 提供 CSS 变量定义示例和命名规范

---

## 🔍 场景 3：AI 代码质检

**输入**：用户提交了 AI 生成的图表代码，要求检查质量

1. 调用 `ai-friendly-spec-framework` 的 10 条必检项逐项检查
2. 对照 `chart-taboo-principles` 8 条禁忌清单
3. 检查 `y-axis-non-zero-trap`：Y 轴是否从 0 开始？
4. 检查 `similar-color-confusion-trap`：相邻数据系列的颜色是否足够区分？
5. 检查 `tooltip-missing-unit-trap`：Tooltip 是否包含单位？
6. 输出问题列表 + 修复建议 + 修正后的配置片段

---

## 🔍 场景 4：移动端适配

**输入**：用户说"图表在手机上看不清怎么办？"

1. 调用 `responsive-chart-strategy` 提供 5 断点定义
2. 移动端特殊规则：柱状图转水平方向、Legend 移至底部、Tooltip 固定于底部
3. 输出各断点的 ECharts media query 配置

---

## 🛑 错误处理

| 状况 | 行为 |
|------|------|
| 用户数据关系不明确 | 先问清数据维度和数据量再推荐图表 |
| 用户要求非 ECharts 引擎 | 说明边界限制，提供通用设计原则参考 |
| 用户要求艺术性可视化 | 引导到专业数据艺术工具，本 Agent 只负责功能性图表 |
| 无法确定最佳图表类型 | 给出 2-3 个候选方案及各自优劣，让用户选择 |