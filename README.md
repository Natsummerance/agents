# OpenClaw Agents Collection

<p align="center">
  <strong>23 个专业 Agent · 124 个蒸馏 Skills · 38 个上游资产库 · 2,583 项质量检查全绿</strong>
</p>

<p align="center">
  <a href="#-快速开始">快速开始</a> ·
  <a href="#-agent-全景图">全景图</a> ·
  <a href="#-按场景选择">场景导航</a> ·
  <a href="#-skill-内部结构">内部结构</a> ·
  <a href="#-质量保障体系">质量体系</a> ·
  <a href="#-vendor-上游资产库">资产库</a> ·
  <a href="#-ria-tv-蒸馏方法论">方法论</a> ·
  <a href="#-贡献">贡献</a>
</p>

---

## 快速开始

### 安装单个 Agent

```bash
git clone https://github.com/Natsummerance/agents.git
cd agents/<agent-name>
# 将整个目录注册到你的 OpenClaw workspace
```

### 安装全部 Agent

```bash
git clone https://github.com/Natsummerance/agents.git
cp -r agents/*/ ~/.openclaw/agents/
```

### 验证质量

```powershell
powershell -File tools/validator.ps1 -RepoRoot . -Scope all
# 期望输出：TOTAL CHECKS: 2583  FAILED: 0  PASS-RATE: 100%
```

---

## Agent 全景图

### 工程实践（3 个 Agent · 42 Skills）

| Agent | Skills | 核心能力 | 来源 |
|-------|--------|---------|------|
| [mattpocock-engineering-agent](./mattpocock-engineering-agent/) | 25 | 需求澄清 → TDD → 代码审查 → 架构扫描的全链路工程实践 | [mattpocock/skills](https://github.com/mattpocock/skills) |
| [superpowers-agent](./superpowers-agent/) | 7 | 强制工作流、测试优先、证据驱动的编码纪律 | [obra/superpowers](https://github.com/obra/superpowers) |
| [addyosmani-agent-skills-agent](./addyosmani-agent-skills-agent/) | 8 | 规格驱动开发、TDD、架构设计模式 | [addyosmani/agent-skills](https://github.com/addyosmani/agent-skills) |

### 数据可视化（3 个 Agent · 30 Skills）

| Agent | Skills | 核心能力 | 来源 |
|-------|--------|---------|------|
| [ency-charts-agent](./ency-charts-agent/) | 19 | ECharts 图表全链路：选型 → Token 架构 → 禁忌检查 → AI 友好化 | ENCY-charts 设计规范 |
| [data-viz-agent](./data-viz-agent/) | 2 | 数据可视化与学术图表设计 | 2 个上游 |
| [ppt-deck-agent](./ppt-deck-agent/) | 2 | 演示文稿创作（guizang 风格 + 原生 PPT） | 2 个上游 |

### 内容创作（4 个 Agent · 21 Skills）

| Agent | Skills | 核心能力 | 来源 |
|-------|--------|---------|------|
| [humanizer-agent](./humanizer-agent/) | 11 | AI 文本去痕：两遍改写 + 语气匹配 + 模式检测 | [blader/humanizer](https://github.com/blader/humanizer) |
| [seo-content-agent](./seo-content-agent/) | 4 | SEO 审计与内容营销策略 | 4 个上游 |
| [html-doc-agent](./html-doc-agent/) | 2 | HTML 与 Markdown 渲染增强 | 2 个上游 |
| [visual-media-agent](./visual-media-agent/) | 2 | 短视频与图像 prompt 生成 | 2 个上游 |

### 研究与知识（4 个 Agent · 12 Skills）

| Agent | Skills | 核心能力 | 来源 |
|-------|--------|---------|------|
| [research-methodology-agent](./research-methodology-agent/) | 3 | 研究方法论：文献综述 → 实验设计 → 论证逻辑 | 3 个上游 |
| [content-distiller](./content-distiller/) | 1 | 知识蒸馏元技能（RIA++ 流水线规范） | Cangjie Skill Sandbox |
| [agent-memory-agent](./agent-memory-agent/) | 4 | Agent 记忆与知识管理系统 | 4 个上游 |
| [data-extraction-agent](./data-extraction-agent/) | 3 | PDF 解析与网页结构化抓取 | 3 个上游 |

### 设计与视觉（2 个 Agent · 6 Skills）

| Agent | Skills | 核心能力 | 来源 |
|-------|--------|---------|------|
| [editorial-art-agent](./editorial-art-agent/) | 4 | 摄影编辑视觉艺术：以"Truth as Anchor"为锚点 | 4 个上游 |
| [ui-design-agent](./ui-design-agent/) | 2 | UI/UX 设计智能与设计系统 | 1 个上游 |

### 基础设施与安全（3 个 Agent · 8 Skills）

| Agent | Skills | 核心能力 | 来源 |
|-------|--------|---------|------|
| [agent-harness-agent](./agent-harness-agent/) | 2 | 多 Agent 编排基础设施 | 3 个上游 |
| [alibaba-ocr-agent](./alibaba-ocr-agent/) | 9 | 代码审查：硬约束 + 上下文感知提示 | [alibaba/open-code-review](https://github.com/alibaba/open-code-review) |
| [security-privacy-agent](./security-privacy-agent/) | 2 | 安全扫描与隐私保护 | 2 个上游 |

### 职业与量化（2 个 Agent · 4 Skills）

| Agent | Skills | 核心能力 | 来源 |
|-------|--------|---------|------|
| [career-monetize-agent](./career-monetize-agent/) | 2 | 职业发展与技能变现 | 2 个上游 |
| [quant-prediction-agent](./quant-prediction-agent/) | 2 | 量化交易与多智能体预测 | 2 个上游 |

### 录制与学习（2 个 Agent · 8 Skills）

| Agent | Skills | 核心能力 | 来源 |
|-------|--------|---------|------|
| [recording-agent](./recording-agent/) | 2 | 屏幕与 Web 会话录制 | 2 个上游 |
| [app-ideas-agent](./app-ideas-agent/) | 6 | 分层学习路径：项目推荐 + 进度追踪 | [florinpop17/app-ideas](https://github.com/florinpop17/app-ideas) |

---

## 按场景选择

### 我想…

| 场景 | 推荐 Agent | 快速指令 |
|------|-----------|---------|
| 让 AI 生成符合设计规范的 ECharts 图表 | `ency-charts-agent` | "用柱状图展示 Q1-Q4 营收，参照 ENCY 规范" |
| 用 TDD + 规格驱动开发实现功能 | `mattpocock-engineering-agent` | "先 /to-spec 再 /implement 这个功能" |
| 对代码变更进行系统性审查 | `alibaba-ocr-agent` | "审查这个 PR 的规范合规性" |
| 将照片转化为编辑艺术作品 | `editorial-art-agent` | "把这张照片处理成杂志封面风格" |
| 设计 UI/UX 和设计系统 | `ui-design-agent` | "设计一个暗色主题的仪表盘" |
| 在编码前查 arXiv 文献 | `research-methodology-agent` | "搜索 transformer 最新进展并总结" |
| 生成 PPT 或演示文稿 | `ppt-deck-agent` | "用 guizang 风格生成年终总结 PPT" |
| 渲染增强版 Markdown | `html-doc-agent` | "把这个 Markdown 转成带代码高亮的 HTML" |
| 自动生成短视频或图像 prompt | `visual-media-agent` | "生成一个赛博朋克风格的视频脚本" |
| 做 SEO 审计和内容优化 | `seo-content-agent` | "审计这个页面的 SEO 问题" |
| AI 求职或变现 | `career-monetize-agent` | "帮我写一份 AI 工程师简历" |
| 从 PDF 或网页提取结构化数据 | `data-extraction-agent` | "从这个 PDF 提取表格数据为 JSON" |
| 给 Agent 添加记忆功能 | `agent-memory-agent` | "设计一个 Agent 记忆持久化方案" |
| 编排多 Agent 协作 | `agent-harness-agent` | "设计一个多 Agent 工作流" |
| 录制屏幕操作或 Web 会话 | `recording-agent` | "录制这个 Web 应用的操作流程" |
| 移除 AI 水印或扫描平台账号 | `security-privacy-agent` | "检查这个工具是否有隐私风险" |
| 量化交易或多智能体预测 | `quant-prediction-agent` | "设计一个多智能体预测系统" |
| 把一本书蒸馏成可调用的 skills | `content-distiller` | "用 RIA++ 流水线蒸馏这本书" |
| 为初学者推荐项目练习 | `app-ideas-agent` | "推荐 React 中级项目" |
| 移除 AI 生成文本中的机器痕迹 | `humanizer-agent` | "让这段文字更像人写的" |
| 强制 TDD + 工作流纪律 | `superpowers-agent` | "用强制工作流实现这个功能" |
| 规格驱动 + 架构设计 | `addyosmani-agent-skills-agent` | "先写规格再实现" |
| 数据可视化设计咨询 | `data-viz-agent` | "这个数据集用什么图表好" |

---

## Skill 内部结构

每个 Skill 遵循 **RIA++ 六段式**结构，确保知识可追溯、可测试、可链接：

```
<skill-name>/
├── SKILL.md              # 六段式知识文档
│   ├── R (Reading)       # 源材料精炼（≤100 词 + 来源标注）
│   ├── I (Interpretation) # 方法论骨架（自己话重写）
│   ├── A1 (Past Application) # 上游典型案例
│   ├── A2 (Future Trigger)   # 触发场景（3 情境 + 语言信号 + 兄弟区分）
│   ├── E (Execution)          # 执行步骤（每步含完成标准）
│   └── B (Boundary)           # 不适用 + 局限
├── test-prompts.json      # Darwin 格式测试用例（6-7 条）
└── test-results.md        # 纸面推演记录（全 PASS + 100%）
```

### 测试用例三类覆盖

| 类型 | 用途 | 示例 |
|------|------|------|
| `should_trigger` × 2-3 | 验证正确触发 | "用柱状图展示 Q1 营收" |
| `should_not_trigger` × 2-3 | 验证不误触发（含跨技能诱饵） | "实现用户认证" → 应触发 `implement` 而非本 skill |
| `edge_case` × 1-2 | 验证边界条件 | "数据关系不明确时" |

---

## 质量保障体系

### Validator 检查项（2,583 项）

| 检查维度 | 说明 |
|---------|------|
| `sk-lines>=70` | SKILL.md 行数 ≥ 70 |
| `description>=40` | frontmatter 描述长度 ≥ 40 字符 |
| `A1/A2/E/B-section` | 六段结构完整性 |
| `e-completion-criteria>=2` | E 段至少 2 个完成标准 |
| `cases-count-5..10` | 测试用例 5-10 条 |
| `case-type-{should_trigger,should_not_trigger,edge_case}` | 三类用例齐全 |
| `cross-skill-confusion-bait` | 跨技能诱饵命中 |
| `case-fields-complete` | 用例字段完整（id/prompt/type/expected_behavior/notes） |
| `test-results.md-exists` | 推演记录存在 |
| `source-project-present` | 溯源字段存在 |

### 运行验证

```powershell
# 全量检查
powershell -File tools/validator.ps1 -RepoRoot . -Scope all

# 仅检查特定 agent
powershell -File tools/validator.ps1 -RepoRoot . -Scope ency-charts-agent

# 仅检查特定 skill
powershell -File tools/validator.ps1 -RepoRoot . -Scope ency-charts-agent/chart-type-selection-framework
```

---

## Vendor 上游资产库

skills 引用的一手上游资产统一存放于 [`vendor/`](./vendor/MANIFEST.md)：

| 指标 | 数值 |
|------|------|
| 上游仓库 | 38 个（全量镜像） |
| 总文件数 | 32,759 |
| 总大小 | ~1.19 GB |
| 命名规范 | `<owner>__<repo>` |

### 关键资产速查

| 资产 | 路径 |
|------|------|
| guizang 双风格 HTML 模板 | `vendor/op7418__guizang-ppt-skill/assets/` |
| ppt-master 工具链 + 12k SVG 图标池 | `vendor/hugohe3__ppt-master/skills/ppt-master/` |
| editorial 四件套 prompt 库 | `vendor/{LiamGvchi,wnby,Zeejay0,ZzzLc0405}__*/` |
| ui-ux 设计规范族 | `vendor/nextlevelbuilder__ui-ux-pro-max-skill/cli/assets/skills/` |
| 学术插图 references | `vendor/ChenLiu-1996__figures4papers/scientific-figure-making/` |
| mattpocock 工程实践源码 | `vendor/mattpocock__skills/skills/` |

> **注意**：库类上游（mem0/crawl4ai/rrweb 等）的代码仅为参考镜像，运行时能力以官方发布包为准。用法已蒸馏进对应 skill。

---

## RIA-TV++ 蒸馏方法论

本仓库所有 Skills 由 **RIA-TV++** 流水线蒸馏生成：

```
源材料 → Adler 整书理解 → 并行提取 → 三重验证 → RIA++ 构造 → Zettelkasten 链接 → 压力测试
```

| 阶段 | 方法 | 产出 |
|------|------|------|
| 1. Adler 整书理解 | 通读源材料，建立全局框架 | 结构化理解 |
| 2. 并行提取 | 提取器并行提取框架、原则、案例、反例、术语 | 候选方法论单元 |
| 3. 三重验证 | 交叉验证候选单元的有效性 | 验证后的知识原子 |
| 4. RIA++ 构造 | Reading → Interpretation → Appropriation | 六段式 SKILL.md |
| 5. Zettelkasten 链接 | 建立 Skill 间的引用网络 | `related_skills` 字段 |
| 6. 压力测试 | 通过 test-prompts.json 进行触发验证 | Darwin 格式测试用例 |

详见 [content-distiller/SKILL.md](./content-distiller/SKILL.md)。

---

## 贡献

欢迎通过 PR 提交新 Agent 或改进现有内容。

### 新 Agent 检查清单

- [ ] 目录包含完整核心文件（AGENT.md / IDENTITY.md / SOUL.md / USER.md / TOOLS.md / AGENTS.md）
- [ ] 每个 Skill 有 `SKILL.md` + `test-prompts.json` + `test-results.md`
- [ ] `SKILL.md` ≥ 70 行，六段结构完整
- [ ] 测试用例 5-10 条，三类齐全（should_trigger / should_not_trigger / edge_case）
- [ ] 通过 Validator 全量检查：`powershell -File tools/validator.ps1 -Scope all`
- [ ] 在 README 的对应分类表格中添加条目
- [ ] 不包含运行时状态文件或大型二进制文件

### 蒸馏新 Skill

```bash
# 1. 确保 content-distiller 可用
cd content-distiller

# 2. 使用 RIA++ 流水线蒸馏
# 参照 SKILL.md 中的流水线规范
```

---

## 许可证

[MIT](./LICENSE)

---

<p align="center">
  <sub>Built with RIA-TV++ distillation pipeline · Validated with 2,583 structural checks</sub>
</p>
