# OpenClaw Agents Collection

> 基于 [RIA-TV++](#ria-tv--方法论) 六阶段流水线蒸馏的 8 个专业 Agent，覆盖数据可视化、工程实践、代码审查、内容创作与知识蒸馏。

## 目录结构

每个子目录是一个自包含的 OpenClaw Agent，遵循统一的结构约定：

```
<agent-name>/
├── AGENT.md          # Agent 核心配置（身份 / 职责 / 能力边界）
├── IDENTITY.md       # 身份定义（最高优先级约束）
├── SOUL.md           # 核心价值观和行为准则
├── USER.md           # 用户画像和协作方式
├── TOOLS.md          # 工具清单和使用规范
├── AGENTS.md         # 工作流程和场景定义
├── HEARTBEAT.md      # 定时任务模板
├── README.md         # Agent 说明文档
├── docs/             # 知识索引（DIGEST / GLOSSARY / INDEX）
└── skills/           # 原子化 skills（含测试用例）
```

> `mattpocock-engineering-agent` 的 skills 内置于上游项目，本仓库不重复存储 skill 文件；`content-distiller` 额外包含 `books/` 蒸馏产出和方法论模板。

## Agent 目录

| # | Agent | Skills 数量 | 领域 | 来源项目 | 许可证 |
|---|-------|------------|------|----------|--------|
| 1 | [ency-charts-agent](./ency-charts-agent/) | 19 | 数据可视化设计 | ENCY-charts 设计规范 | — |
| 2 | [mattpocock-engineering-agent](./mattpocock-engineering-agent/) | 25（内建） | 软件工程实践 | [mattpocock/skills](https://github.com/mattpocock/skills) | MIT |
| 3 | [alibaba-ocr-agent](./alibaba-ocr-agent/) | 9 | Open Code Review | [alibaba/open-code-review](https://github.com/alibaba/open-code-review) | Apache-2.0 |
| 4 | [content-distiller](./content-distiller/) | 1（元 skill） | 知识蒸馏 | Cangjie Skill Sandbox | — |
| 5 | [superpowers-agent](./superpowers-agent/) | 7 | 编码工作流 | [obra/superpowers](https://github.com/obra/superpowers) | — |
| 6 | [app-ideas-agent](./app-ideas-agent/) | 6 | 学习指导 | [florinpop17/app-ideas](https://github.com/florinpop17/app-ideas) | MIT |
| 7 | [addyosmani-agent-skills-agent](./addyosmani-agent-skills-agent/) | 8 | 工程技能 | [addyosmani/agent-skills](https://github.com/addyosmani/agent-skills) | MIT |
| 8 | [humanizer-agent](./humanizer-agent/) | 11 | AI 文本去痕 | [blader/humanizer](https://github.com/blader/humanizer) | MIT |

### 按场景选择

| 你想… | 推荐使用 |
|--------|----------|
| 让 AI 生成符合设计规范的 ECharts 图表 | `ency-charts-agent` |
| 用 TDD + 规格驱动开发实现功能 | `mattpocock-engineering-agent` 或 `superpowers-agent` |
| 对代码变更进行系统性审查 | `alibaba-ocr-agent` |
| 把一本书 / 课程 / 播客蒸馏成可调用的 skills | `content-distiller` |
| 为初学者推荐适合的项目练习 | `app-ideas-agent` |
| 移除 AI 生成文本中的机器痕迹 | `humanizer-agent` |

## 快速开始

### 前置要求

- [OpenClaw](https://github.com/openclaw/openclaw) 已安装并运行

### 安装单个 Agent

```bash
git clone https://github.com/Natsummerance/agents.git
cd agents/<agent-name>
```

将 `<agent-name>/` 目录注册到你的 OpenClaw workspace 即可。具体步骤参见各 agent 的 `README.md`。

### 安装全部 Agent

将整个 `agents/` 下的子目录逐一复制到 OpenClaw 的 `agents/` 目录：

```bash
cp -r agents/*/ ~/.openclaw/agents/
```

## RIA-TV++ 方法论

本仓库所有 Agent 的 skills 由 **RIA-TV++** 流水线蒸馏生成，流程如下：

1. **Adler 整书理解** — 通读源材料，建立全局框架
2. **并行提取** — 5 个提取器（原则 / 框架 / 案例 / 反例 / 术语）并行工作
3. **三重验证** — 交叉验证候选方法论单元的有效性
4. **RIA++ 构造** — Reading → Interpretation → Appropriation 构造原子 skill
5. **Zettelkasten 链接** — 建立 skill 间的引用网络
6. **压力测试** — 通过 test-prompts.json 进行触发验证，不通过的回炉或淘汰

详见 [content-distiller/SKILL.md](./content-distiller/SKILL.md)。

## 贡献

欢迎通过 PR 提交新 agent 或改进现有内容。提交前请确认：

1. Agent 目录包含完整的核心文件（AGENT.md / IDENTITY.md / SOUL.md / USER.md / TOOLS.md）
2. 每个 skill 有对应的 `SKILL.md` 和 `test-prompts.json`
3. 不包含运行时状态文件（如 `openclaw-workspace-state.json`）
4. 不包含大型二进制文件（图片 / 音频等）
5. 在主 README 的表格中添加条目

## 许可证

[MIT](./LICENSE)
