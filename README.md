# OpenClaw Agents Collection

> 23 个专业 OpenClaw Agent，覆盖数据可视化、UI 设计、编辑艺术、研究方法论、内容创作、SEO、数据提取、Agent 记忆与基础设施、安全隐私、量化预测等领域。所有 skills 由 RIA-TV++ 流水线蒸馏生成。

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
└── skills/           # 原子化 skills（含测试用例）
```

## Agent 目录

### 原有 Agent（8 个）

| # | Agent | Skills | 领域 | 来源 |
|---|-------|--------|------|------|
| 1 | [ency-charts-agent](./ency-charts-agent/) | 19 | 数据可视化设计 | ENCY-charts 设计规范 |
| 2 | [mattpocock-engineering-agent](./mattpocock-engineering-agent/) | 25 | 软件工程实践 | [mattpocock/skills](https://github.com/mattpocock/skills) |
| 3 | [alibaba-ocr-agent](./alibaba-ocr-agent/) | 9 | Open Code Review | [alibaba/open-code-review](https://github.com/alibaba/open-code-review) |
| 4 | [content-distiller](./content-distiller/) | 1（元 skill） | 知识蒸馏 | Cangjie Skill Sandbox |
| 5 | [superpowers-agent](./superpowers-agent/) | 7 | 编码工作流 | [obra/superpowers](https://github.com/obra/superpowers) |
| 6 | [app-ideas-agent](./app-ideas-agent/) | 6 | 学习指导 | [florinpop17/app-ideas](https://github.com/florinpop17/app-ideas) |
| 7 | [addyosmani-agent-skills-agent](./addyosmani-agent-skills-agent/) | 8 | 工程技能 | [addyosmani/agent-skills](https://github.com/addyosmani/agent-skills) |
| 8 | [humanizer-agent](./humanizer-agent/) | 11 | AI 文本去痕 | [blader/humanizer](https://github.com/blader/humanizer) |

### 新增 Agent（15 个）

| # | Agent | Skills | 领域 | 来源项目数 |
|---|-------|--------|------|-----------|
| 9 | [editorial-art-agent](./editorial-art-agent/) | 4 | 摄影编辑视觉艺术 | 4 |
| 10 | [data-viz-agent](./data-viz-agent/) | 2 | 数据可视化与学术图表 | 2 |
| 11 | [ui-design-agent](./ui-design-agent/) | 2 | UI/UX 设计智能 | 1 |
| 12 | [research-methodology-agent](./research-methodology-agent/) | 3 | 研究方法论 | 3 |
| 13 | [ppt-deck-agent](./ppt-deck-agent/) | 2 | 演示文稿创作 | 2 |
| 14 | [html-doc-agent](./html-doc-agent/) | 2 | HTML 与 Markdown 渲染 | 2 |
| 15 | [visual-media-agent](./visual-media-agent/) | 2 | 视觉媒体生成 | 2 |
| 16 | [seo-content-agent](./seo-content-agent/) | 4 | SEO 与内容营销 | 4 |
| 17 | [career-monetize-agent](./career-monetize-agent/) | 2 | 职业发展与变现 | 2 |
| 18 | [data-extraction-agent](./data-extraction-agent/) | 3 | PDF 解析与网页抓取 | 3 |
| 19 | [agent-memory-agent](./agent-memory-agent/) | 4 | Agent 记忆与知识管理 | 4 |
| 20 | [agent-harness-agent](./agent-harness-agent/) | 2 | Agent 编排基础设施 | 3 |
| 21 | [recording-agent](./recording-agent/) | 2 | 屏幕与会话录制 | 2 |
| 22 | [security-privacy-agent](./security-privacy-agent/) | 2 | 安全扫描与隐私保护 | 2 |
| 23 | [quant-prediction-agent](./quant-prediction-agent/) | 2 | 量化交易与预测 | 2 |

### 按场景选择

| 你想… | 推荐使用 |
|--------|----------|
| 让 AI 生成符合设计规范的 ECharts 图表 | `ency-charts-agent` 或 `data-viz-agent` |
| 用 TDD + 规格驱动开发实现功能 | `mattpocock-engineering-agent` 或 `superpowers-agent` |
| 将照片转化为编辑艺术作品 | `editorial-art-agent` |
| 设计 UI/UX 和设计系统 | `ui-design-agent` |
| 在编码前查 arXiv 文献 | `research-methodology-agent` |
| 生成 PPT 或演示文稿 | `ppt-deck-agent` |
| 渲染增强版 Markdown | `html-doc-agent` |
| 自动生成短视频或图像 prompt | `visual-media-agent` |
| 做 SEO 审计和内容优化 | `seo-content-agent` |
| AI 求职或变现 | `career-monetize-agent` |
| 从 PDF 或网页提取结构化数据 | `data-extraction-agent` |
| 给 Agent 添加记忆功能 | `agent-memory-agent` |
| 编排多 Agent 协作 | `agent-harness-agent` |
| 录制屏幕操作或 Web 会话 | `recording-agent` |
| 移除 AI 水印或扫描平台账号 | `security-privacy-agent` |
| 量化交易或多智能体预测 | `quant-prediction-agent` |
| 对代码变更进行系统性审查 | `alibaba-ocr-agent` |
| 把一本书蒸馏成可调用的 skills | `content-distiller` |
| 为初学者推荐项目练习 | `app-ideas-agent` |
| 移除 AI 生成文本中的机器痕迹 | `humanizer-agent` |

## 快速开始

```bash
git clone https://github.com/Natsummerance/agents.git
cd agents/<agent-name>
```

将 `<agent-name>/` 目录注册到你的 OpenClaw workspace 即可。

安装全部：

```bash
cp -r agents/*/ ~/.openclaw/agents/
```

## RIA-TV++ 方法论

本仓库所有 Agent 的 skills 由 **RIA-TV++** 流水线蒸馏生成：

1. **Adler 整书理解** — 通读源材料，建立全局框架
2. **并行提取** — 提取器并行提取框架、原则、案例、反例、术语
3. **三重验证** — 交叉验证候选方法论单元的有效性
4. **RIA++ 构造** — Reading → Interpretation → Appropriation 构造原子 skill
5. **Zettelkasten 链接** — 建立 skill 间的引用网络
6. **压力测试** — 通过 test-prompts.json 进行触发验证

2026-08-25 质量回填：新增 15 个 Agent 的 38 个 skills 全部按六段 RIA++ 结构重写，
每个 skill 配齐 darwin 格式测试用例（应触发/诱饵含跨技能混淆/边界用例）与推演记录。
结构红线校验：`powershell -File tools/validator.ps1 -Scope new15` → 798 项检查 0 失败。

详见 [content-distiller/SKILL.md](./content-distiller/SKILL.md)。

## vendor/ · 上游资产库

skills 引用的一手上游资产（HTML 模板、prompt 编译器、工具链脚本、风格规范等）统一存放于 [`vendor/`](./vendor/MANIFEST.md)，命名 `<owner>__<repo>`。库类上游（mem0/crawl4ai/rrweb 等可安装包）不入库，其用法已蒸馏进对应 skill。

## 贡献

欢迎通过 PR 提交新 agent 或改进现有内容。提交前请确认：

1. Agent 目录包含完整的核心文件（AGENT.md / IDENTITY.md / SOUL.md / USER.md / TOOLS.md / AGENTS.md）
2. 每个 skill 有对应的 `SKILL.md` 和 `test-prompts.json`
3. 不包含运行时状态文件或大型二进制文件
4. 在主 README 的表格中添加条目

## 许可证

[MIT](./LICENSE)