# TOOLS.md - 数据可视化设计 Agent 技术参考

## 📚 Skills 清单

本 Agent 融合了 19 个原子化 skills，按功能分类：

### 设计哲学层（2 个）
| Skill | 文件路径 | 职责 |
|-------|---------|------|
| clarity-first-principles | `skills/clarity-first-principles/SKILL.md` | 清晰性优先原则 |
| consistency-principles | `skills/consistency-principles/SKILL.md` | 一致性至上原则 |

### 视觉系统层（5 个）
| Skill | 文件路径 | 职责 |
|-------|---------|------|
| design-token-architecture | `skills/design-token-architecture/SKILL.md` | 三层 Token 架构 |
| seed-token-glossary | `skills/seed-token-glossary/SKILL.md` | Seed Token 定义 |
| categorical-palette-glossary | `skills/categorical-palette-glossary/SKILL.md` | 分类色板（18 色） |
| sequential-palette-glossary | `skills/sequential-palette-glossary/SKILL.md` | 顺序色板（7 级渐变） |
| semantic-colors-glossary | `skills/semantic-colors-glossary/SKILL.md` | 语义色（4 态） |

### 图表规范层（4 个）
| Skill | 文件路径 | 职责 |
|-------|---------|------|
| chart-type-selection-framework | `skills/chart-type-selection-framework/SKILL.md` | 8 种图表类型选择 |
| semantic-coloring-principles | `skills/semantic-coloring-principles/SKILL.md` | 语义化配色原则 |
| kpi-card-glossary | `skills/kpi-card-glossary/SKILL.md` | KPI 指标卡设计 |
| responsive-chart-strategy | `skills/responsive-chart-strategy/SKILL.md` | 5 断点响应式策略 |

### 质量保障层（5 个）
| Skill | 文件路径 | 职责 |
|-------|---------|------|
| chart-taboo-principles | `skills/chart-taboo-principles/SKILL.md` | 8 条图表禁忌 |
| 3d-pie-chart-trap | `skills/3d-pie-chart-trap/SKILL.md` | 3D 饼图陷阱 |
| y-axis-non-zero-trap | `skills/y-axis-non-zero-trap/SKILL.md` | Y 轴不从零的误导 |
| similar-color-confusion-trap | `skills/similar-color-confusion-trap/SKILL.md` | 相似色混淆陷阱 |
| tooltip-missing-unit-trap | `skills/tooltip-missing-unit-trap/SKILL.md` | Tooltip 缺单位歧义 |

### AI 协作层（3 个）
| Skill | 文件路径 | 职责 |
|-------|---------|------|
| ai-friendly-spec-framework | `skills/ai-friendly-spec-framework/SKILL.md` | AI 友好规范框架 |
| ai-iteration-check-principles | `skills/ai-iteration-check-principles/SKILL.md` | 10 条必检项 |
| agent-prompt-guide-glossary | `skills/agent-prompt-guide-glossary/SKILL.md` | Agent Prompt Guide |

## 🔗 引用关系

完整的引用关系图见 [docs/INDEX.md](./docs/INDEX.md) 中的 mermaid 图。

## 📖 核心文档

| 文档 | 文件路径 | 说明 |
|------|---------|------|
| INDEX.md | `docs/INDEX.md` | 19 个 skills 的完整索引和引用关系图 |
| GLOSSARY.md | `docs/GLOSSARY.md` | 13 个核心术语表 |
| DIGEST.md | `docs/DIGEST.md` | 精华长文（不读全书，只看精华） |
| test-results.md | `docs/test-results.md` | 压力测试结果（101 测试用例，100% 通过率） |
| verified.md | `docs/verified.md` | 通过的候选单元列表 |

## 🛠️ 常用代码片段

### Token 定义模板
```css
:root {
  /* Seed Token */
  --seed-brand: #4B7AFA;
  --chart-font-family: "PingFang SC", "Microsoft YaHei", sans-serif;
  --chart-gap: 16px;
  
  /* Component Token */
  --chart-card-bg: #FFFFFF;
  --chart-grid-line: #F2F3F5;
  --chart-tooltip-bg: rgba(29, 33, 41, 0.92);
  
  /* Semantic Token */
  --chart-success: #00B42A;
  --chart-warning: #FF7D00;
  --chart-danger: #F53F3F;
  --chart-info: #2469FF;
}
```

### ECharts 柱状图配置
```javascript
{
  series: [{
    type: 'bar',
    barWidth: '60%',
    itemStyle: { borderRadius: [4, 4, 0, 0] }
  }]
}
```

### 响应式断点
```css
@media (max-width: 727px) {
  .chart-grid { grid-template-columns: 1fr; }
  .chart-card { min-height: 200px; }
}
```

## 🎯 快速启动

1. **阅读 AGENT.md** — 了解身份和核心能力
2. **浏览 docs/INDEX.md** — 熟悉 19 个 skills 的引用关系
3. **查阅 docs/GLOSSARY.md** — 掌握核心术语
4. **开始对话** — 提出你的数据可视化设计问题
