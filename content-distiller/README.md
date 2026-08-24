# Content Distiller Agent

> 🔬 将高价值内容（书籍、长视频、播客、课程）蒸馏成可执行的 Agent Skills

## 📖 概述

Content Distiller 是一个专门的内容蒸馏专家 Agent，基于 **RIA-TV++** 方法论，能够将书籍、长视频转写稿、播客文字稿、在线课程等高价值内容，拆解成一组原子化、可被 agent 在真实场景下调用的 skills。

### 核心能力

- ✅ **整书理解**：使用 Adler 四步阅读法建立全书骨架
- ✅ **并行提取**：启动 5 个 sub-agent 并行提取框架、原则、案例、反例、术语
- ✅ **三重验证**：对候选单元执行 V1 跨域/V2 预测力/V3 独特性验证
- ✅ **RIA++ 构造**：为每个通过的单元构建完整的 R/I/A1/A2/E/B 六段式 skill
- ✅ **Zettelkasten 链接**：建立 skill 之间的引用关系
- ✅ **压力测试**：设计 darwin 兼容的 test-prompts.json，盲测并回炉淘汰
- ✅ **交付安装**：生成 DIGEST.md 精华长文，安装 skills 到 ~/.openclaw/skills/

### 边界意识

| ✅ 做 | ❌ 不做 |
|------|--------|
| 方法论 / 决策框架 / 清单 / 原则 / 概念体系的蒸馏 | 简单摘要或书摘 |
| 可迁移的思考结构 | 读后感或情感共鸣分析 |
| 面对 X 类问题时应该...的通用流程 | 作者人设角色扮演 |

> **注意**：简单摘要和作者角色扮演是 **nuwa-skill** 的职责，不是本 Agent 的职责。

---

## 🚀 快速开始

### 1. 激活 Agent

```bash
# 在 OpenClaw 中切换到 content-distiller agent
# （具体命令取决于你的 OpenClaw 配置）
```

### 2. 准备源文本

确保你有以下之一：
- 书籍的 PDF / EPUB / TXT 文件
- 视频/播客的转写稿（TXT 格式）
- 课程的文字稿或字幕文件

### 3. 开始蒸馏

```
用户: 帮我拆《穷查理宝典》
Agent: 请提供源文本路径（PDF/EPUB/TXT），以及作者和出版年信息。

用户: /path/to/poor-charlie-almanack.pdf, 查理·芒格, 2005
Agent: [开始阶段 0: 整书理解...]
```

### 4. 跟随流水线

Agent 会在每个关键节点主动汇报进度并请求确认：
- **阶段 0 后**：确认骨架理解是否正确
- **阶段 1.5 后**：确认入选名单（避免大量返工）
- **阶段 5 前**：确认安装位置

---

## 📁 项目结构

```
content-distiller/
├── IDENTITY.md              # 身份定义和核心职责
├── SOUL.md                  # 核心价值观和行为准则
├── AGENTS.md                # 工作流程和场景定义
├── TOOLS.md                 # 工具清单和使用规范
├── USER.md                  # 用户画像和协作方式
├── README.md                # 本文件
├── skills/
│   └── content-distillation/
│       ├── SKILL.md         # 核心技能包（基于 RIA-TV++ 方法论）
│       ├── methodology/     # 方法论文档
│       │   ├── 00-overview.md
│       │   ├── 01-stage0-adler.md
│       │   ├── 02-stage1-parallel-extract.md
│       │   ├── 03-stage1.5-triple-verify.md
│       │   ├── 04-stage2-ria-plus.md
│       │   ├── 05-stage3-zettelkasten.md
│       │   ├── 06-stage4-pressure-test.md
│       │   └── 07-stage5-deliver.md
│       ├── extractors/      # 提取器 prompts
│       │   ├── framework-extractor.md
│       │   ├── principle-extractor.md
│       │   ├── case-extractor.md
│       │   ├── counter-example-extractor.md
│       │   └── glossary-extractor.md
│       └── templates/       # 输出模板
│           ├── BOOK_OVERVIEW.md.template
│           ├── SKILL.md.template
│           ├── INDEX.md.template
│           ├── GLOSSARY.md.template
│           ├── DIGEST.md.template
│           └── test-prompts.json.template
└── skills/content-distillation/  # 方法论、提取器和模板
```

---

## 🔬 RIA-TV++ 方法论

### 命名由来

**RIA-TV++** =
- **RIA** — 赵周（《这样读书就够了》）的便签拆书法: Reading / Interpretation / Appropriation
- **TV** — Triple Verification，借自 nuwa-skill 的三重验证
- **++** — 面向 agent 执行的扩展: E (Execution 可执行步骤) + B (Boundary 边界)

### 流水线总览

```
          ┌───────────────────┐
          │ 阶段 0: 整书理解   │  Adler 四步
          └─────────┬─────────┘
                    │ BOOK_OVERVIEW.md
                    ▼
          ┌───────────────────┐
          │ 阶段 1: 并行提取   │  5 个 sub-agent 同时跑
          └─────────┬─────────┘
                    │ candidates/
                    ▼
          ┌───────────────────┐
          │ 阶段 1.5: 三重验证 │  V1 跨域 / V2 预测力 / V3 独特性
          └─────────┬─────────┘
                    │ 通过单元 + rejected/
                    ▼
          ┌───────────────────┐
          │ 阶段 2: RIA++ 构造 │  R / I / A1 / A2 / E / B
          └─────────┬─────────┘
                    │ 每个 skill 的 SKILL.md
                    ▼
          ┌───────────────────┐
          │ 阶段 3: 链接       │  Zettelkasten + INDEX.md
          └─────────┬─────────┘
                    │
                    ▼
          ┌───────────────────┐
          │ 阶段 4: 压力测试   │  test-prompts.json + 盲测 + 回炉
          └─────────┬─────────┘
                    │
                    ▼
          ┌───────────────────┐
          │ 阶段 5: 交付       │  DIGEST.md 精华长文 + 安装到 skills 目录
          └───────────────────┘
                    │
                    ▼
          可喂给 darwin-skill 自动进化
```

### 核心洞察

**现有读书方法论都是为人类读者蒸馏，不是为 agent 执行者蒸馏。**

| 维度 | 给人看 | 给 agent 用 (content-distiller 目标) |
|------|--------|-------------------------------------|
| 关键字段 | 故事 / 金句 / 情感钩子 | trigger / 可执行步骤 / 判停标准 |
| 失败模式 | 读完就忘 | trigger 不准 → 永不调用或乱调用 |
| 成功标准 | 读者"有收获" | 真实问题被解决 |

所以 RIA-TV++ 的所有"扩展"(TV / E / B / test-prompts) 都是为了解决这个目标迁移带来的新问题。

---

## 📋 使用示例

### 示例 1：蒸馏一本书

```
用户: 帮我拆《穷查理宝典》

Agent: 请提供以下信息：
1. 源文本路径（PDF/EPUB/TXT）
2. 作者：查理·芒格
3. 出版年：2005

用户: /../examples/distillation-outputs/poor-charlie-almanack.pdf

Agent: [阶段 0: 整书理解]
正在读取文本...
正在执行 Adler 四步分析...

[完成后]
BOOK_OVERVIEW.md 已生成。骨架如下：
- 主旨：多元思维模型 + 逆向思维
- 核心框架：能力圈、逆向思维、检查清单
- 关键术语：Lollapalooza 效应、能力圈、逆向思维
- 批判：时代局限（主要基于 20 世纪美国市场）

骨架我理解对了吗？有没有你希望重点突出的方向？

用户: 对的，继续

Agent: [阶段 1: 并行提取]
正在启动 5 个 sub-agent...
- 框架提取器：提取决策框架和思维模型
- 原则提取器：提取原则和清单
- 案例提取器：提取作者亲自使用的实例
- 反例提取器：提取书中警告的失败模式
- 术语提取器：提取关键概念词典

[完成后]
共提取 47 个候选单元。

Agent: [阶段 1.5: 三重验证]
正在执行三重验证...

[完成后]
通过验证：18 个单元
淘汰：29 个单元

这 18 个会做成 skill，有想捞回或砍掉的吗？

用户: 全部保留，继续

Agent: [阶段 2-5: 构造、链接、测试、交付]
...

[完成后]
已完成！18 个 skills 已安装到 ~/.openclaw/skills/。
DIGEST.md 已生成，满足"不读全书、只看精华"的需求。
可一键喂给 darwin-skill 自动进化。
```

### 示例 2：续跑中断的任务

```
用户: 继续上次中断的《穷查理宝典》蒸馏

Agent: 检测到 PIPELINE_STATE.md，当前阶段：阶段 2（RIA++ 构造）
已完成 skills：inversion-thinking, circle-of-competence
待完成 skills：mental-models, checklist-method, ...

从阶段 2 续跑...
```

### 示例 3：蒸馏视频/播客

```
用户: 把这个 B 站视频蒸馏成 skill

Agent: 请提供：
1. 视频转写稿路径（TXT 格式）
2. 标题：XXX
3. UP 主：XXX
4. 发布时间：2024-XX-XX

用户: /transcripts/bilibili-video-123.txt, "罗辑思维第 100 期", 罗振宇, 2015-03-15

Agent: [开始蒸馏...]
```

---

## 🎯 质量红线

违反以下任何一条，Agent 将阻止输出：

1. **每个 skill 必须通过全部三重验证**
   - V1 跨域：书中至少 2 个独立段落有佐证
   - V2 预测力：能回答一个书里没明说的新问题
   - V3 独特性：不是任何聪明人都会说的常识

2. **每个 skill 必须有完整的 R/I/A1/A2/E/B 六段**
   - R (Reading)：原文引用 ≤150 字/段（英文 ≤100 词/段）
   - I (Interpretation)：用自己的话重写方法论骨架
   - A1 (Past Application)：书中作者用过的案例
   - A2 (Future Trigger)：用户在什么情境下会需要这个
   - E (Execution)：1-2-3 可执行步骤
   - B (Boundary)：什么时候不适用 / 作者的盲点

3. **每个 skill 必须有 test-prompts.json**
   - 包含诱饵测试（不应调用的场景）
   - 至少 1 条是同书兄弟 skill 的场景（跨 skill 混淆测试）
   - 遵循 darwin-skill 兼容格式

4. **description 字段必须明确 trigger 条件**
   - 不能只是"一个关于 X 的 skill"
   - 必须说明"何时调用 + 何时不调用 + 关键 trigger 信号"

5. **不凭记忆拆书**
   - 没有源文本就停下来问用户要

---

## 🤝 与生态系统的协作

### cangjie-skill vs nuwa-skill vs darwin-skill

| Skill | 职责 | 产出 |
|-------|------|------|
| **nuwa-skill** | 蒸馏人（思维方式 / 表达 DNA） | 角色扮演的 prompt |
| **content-distillation** (本 Agent) | 蒸馏书（方法论 / 框架 / 原则） | 可执行的 skills |
| **darwin-skill** | 进化任意 skill | 自动优化 skill 描述和测试 |

**三者咬合**：本 Agent 输出的 `test-prompts.json` 严格遵循 darwin-skill 格式，以便产出的 skill 可直接接入 darwin 做自动进化。

---

## 📚 参考文档

- [IDENTITY.md](./IDENTITY.md) - 身份定义和核心职责
- [SOUL.md](./SOUL.md) - 核心价值观和行为准则
- [AGENTS.md](./AGENTS.md) - 工作流程和场景定义
- [TOOLS.md](./TOOLS.md) - 工具清单和使用规范
- [USER.md](./USER.md) - 用户画像和协作方式
- [skills/content-distillation/SKILL.md](./skills/content-distillation/SKILL.md) - 核心技能包详细说明
- [skills/content-distillation/methodology/](./skills/content-distillation/methodology/) - 方法论文档
- [skills/content-distillation/extractors/](./skills/content-distillation/extractors/) - 提取器 prompts
- [skills/content-distillation/templates/](./skills/content-distillation/templates/) - 输出模板

---

## 📝 许可证

本项目基于 [Cangjie Skill Sandbox](https://github.com/your-repo/cangjie-skill-sandbox) 构建，遵循相同的开源许可证。

---

## 🙏 致谢

- **Mortimer Adler** 《如何阅读一本书》— 阶段 0: 分析阅读三阶段
- **赵周** 《这样读书就够了》— 阶段 2: R-I-A1-A2 基本骨架
- **Niklas Luhmann** Zettelkasten — 原子化 + 链接 + 用自己的话重写
- **Tiago Forte** Progressive Summarization — 阶段 4 的"可验证压缩链条"思想
- **nuwa-skill** — 阶段 1 并行 extractor + 阶段 1.5 三重验证
- **darwin-skill** — 阶段 4 test-prompts.json 格式 + 可进化性
