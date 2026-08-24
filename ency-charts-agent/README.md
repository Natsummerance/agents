# 数据可视化设计 Agent

> 基于《ENCY-charts 数据可视化设计规范》构建的专业数据可视化设计助手。

## 🚀 快速启动

### 1. 了解身份
阅读 [AGENT.md](./AGENT.md) 了解本 Agent 的核心能力和典型对话场景。

### 2. 浏览 Skills
- [docs/INDEX.md](./docs/INDEX.md) — 19 个 skills 的完整索引和引用关系图
- [docs/GLOSSARY.md](./docs/GLOSSARY.md) — 13 个核心术语表
- [docs/DIGEST.md](./docs/DIGEST.md) — 精华长文（不读全书，只看精华）

### 3. 开始对话
提出你的数据可视化设计问题，例如：
- "我有各产品线的销售额数据，应该用什么图表对比？"
- "如何组织设计系统的颜色变量？"
- "如何让图表在手机上也能看清？"
- "如何让 AI 生成符合规范的图表代码？"

## 📂 目录结构

```
ency-charts-agent/
├── AGENT.md              # Agent 核心配置
├── IDENTITY.md           # 身份定义
├── SOUL.md               # 行为准则
├── USER.md               # 用户画像
├── TOOLS.md              # 技术参考
├── README.md             # 本文件
├── skills/               # 19 个原子化 skills
│   ├── chart-type-selection-framework/
│   ├── design-token-architecture/
│   ├── ai-friendly-spec-framework/
│   ├── responsive-chart-strategy/
│   ├── clarity-first-principles/
│   ├── consistency-principles/
│   ├── semantic-coloring-principles/
│   ├── ai-iteration-check-principles/
│   ├── chart-taboo-principles/
│   ├── 3d-pie-chart-trap/
│   ├── y-axis-non-zero-trap/
│   ├── similar-color-confusion-trap/
│   ├── tooltip-missing-unit-trap/
│   ├── seed-token-glossary/
│   ├── categorical-palette-glossary/
│   ├── sequential-palette-glossary/
│   ├── semantic-colors-glossary/
│   ├── kpi-card-glossary/
│   └── agent-prompt-guide-glossary/
└── docs/                 # 配套文档
    ├── INDEX.md          # Skills 索引
    ├── GLOSSARY.md       # 术语表
    ├── DIGEST.md         # 精华长文
    ├── test-results.md   # 压力测试结果
    └── verified.md       # 通过的候选单元
```

## 🎯 核心能力

本 Agent 融合了 19 个原子化 skills，涵盖数据可视化的五个层面：

1. **设计哲学层**：清晰性优先、一致性至上
2. **视觉系统层**：三层 Token 架构、分类色板、顺序色板、语义色
3. **图表规范层**：8 种图表类型选择、语义化配色、KPI 指标卡、响应式策略
4. **质量保障层**：8 条禁忌清单、4 个反例陷阱
5. **AI 协作层**：AI 友好规范框架、10 条必检项、Agent Prompt Guide

## 📊 知识来源

本 Agent 的知识完全蒸馏自《ENCY-charts 数据可视化设计规范》（ENCY Design Team, 2026-06-12），通过 RIA-TV++ 五阶段流水线提取、验证、构造而成。

## 🔗 相关资源

- [原始蒸馏项目](../content-distiller/books/ency-charts/) — 完整的蒸馏过程和审计轨迹
- [content-distiller Agent](../content-distiller/) — 内容蒸馏专家 Agent

---

**最后更新**: 2026-08-24  
**版本**: 1.0.0
