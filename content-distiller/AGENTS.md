# AGENTS.md - 工作流程和场景定义

## 🚀 启动流程
1. 读取 IDENTITY.md — 知道我是谁
2. 读取 SOUL.md — 知道我怎么说话
3. 读取 USER.md — 了解你是谁
4. 不需要询问许可，直接执行

---

## 📋 核心工作流：RIA-TV++ 五阶段流水线

### 总览
```
阶段 0: Adler 整书理解     → BOOK_OVERVIEW.md
阶段 1: 5 个 agent 并行提取 → 候选方法论单元池 (candidates/)
阶段 1.5: 三重验证筛选       → 通过的单元 (verified.md) + 淘汰的 (rejected/)
阶段 2: RIA++ 构造 skill     → 每个 skill 的 SKILL.md
阶段 3: Zettelkasten 链接    → INDEX.md + GLOSSARY.md
阶段 4: 压力测试             → test-prompts.json + test-results.md
阶段 5: 交付                 → DIGEST.md 精华长文 + 安装到 skills 目录
阶段 6: Agent 组装 ★         → 完整 OpenClaw Agent（AGENT.md + IDENTITY.md + SOUL.md + USER.md + TOOLS.md + 注册）
```

**断点续跑**：开始前先检查 `books/<slug>/PIPELINE_STATE.md` 是否存在。存在则读取并从记录的阶段续跑，不要从头重来。每完成一个阶段，更新该文件。

---

## 🔍 场景 1：蒸馏一本书

**输入**：用户说"帮我拆《穷查理宝典》"或"distill this book into skills: <path>"

**处理流程**：

### 前置检查
1. **确认内容文本来源**：PDF / EPUB / TXT / 字幕文件 / 转写稿路径，或可访问的纯文本。**不要**在没有文本的情况下"凭记忆"蒸馏。
2. **确认内容元信息**：书籍是"书名 + 作者 + 出版年"；视频/播客/课程是"标题 + 作者 + 发布时间"。
3. **确认是否首次试点**：如果用户是第一次用，建议先蒸馏 1 份内容验证流程再批量。

### 阶段 0 — 整书理解
1. 读取用户提供的书本文本（大文件分块阅读）
2. 执行 Adler 四步：
   - **结构分析**：这本书在谈什么？整体架构是什么？
   - **解释**：关键术语和论点是什么？
   - **批判**：作者的盲点、时代局限、逻辑漏洞是什么？
   - **应用**：这本书的方法论可以应用到哪些场景？
3. 按 `skills/content-distillation/templates/BOOK_OVERVIEW.md.template` 填充，写入 `books/<slug>/BOOK_OVERVIEW.md`
4. **用户确认**："骨架我理解对了吗？有没有你希望重点突出的方向？"得到确认再进入阶段 1

### 阶段 1 — 5 个 sub-agent 并行提取
**并行** spawn 5 个 Task sub-agents（使用 sessions_spawn 工具）：

| sub-agent | 读取的 prompt | 产出 |
|---|---|---|
| 框架提取器 | `extractors/framework-extractor.md` | 决策框架 / 思维模型 |
| 原则提取器 | `extractors/principle-extractor.md` | 原则 / 清单 / 规则 |
| 案例提取器 | `extractors/case-extractor.md` | 作者在书中亲自使用过的实例 |
| 反例提取器 | `extractors/counter-example-extractor.md` | 书中警告的失败模式 |
| 术语提取器 | `extractors/glossary-extractor.md` | 关键概念词典 |

每个 sub-agent 独立读书、独立提取、独立输出到 `books/<slug>/candidates/<type>.md`。

- **长文本**：超出单个 sub-agent 上下文的内容，按 `methodology/02-stage1-parallel-extract.md` 的分块策略处理
- **降级方案**：当前环境不支持并行 sub-agent 时，用同样 5 个 extractor prompt **串行**执行，产出格式不变

### 阶段 1.5 — 三重验证筛选
对每个候选单元执行：
- **V1 跨域**：书中至少 2 个独立段落有佐证？
- **V2 预测力**：能用它回答一个书里没明说的新问题吗？
- **V3 独特性**：不是任何聪明人都会说的常识吗？

通过的写入 `books/<slug>/verified.md`。不通过的写入 `books/<slug>/rejected/` 并附原因。

**用户轻确认** ★：把"通过的 N 个候选标题 + 淘汰的 M 个"列表展示给用户："这 N 个会做成 skill，有想捞回或砍掉的吗？"得到确认再进入阶段 2。

### 阶段 2 — RIA++ 构造 skill
对每个通过的单元，按 `templates/SKILL.md.template` 填充：
- **R (Reading)**：原文引用 ≤150 字/段（英文原文 ≤100 词/段）
- **I (Interpretation)**：用自己的话重写方法论骨架（避免照搬译本）
- **A1 (Past Application)**：书中作者用过的案例
- **A2 (Future Trigger)** ★：用户在什么情境下会需要这个 → skill 的 `description` 字段
- **E (Execution)**：1-2-3 可执行步骤
- **B (Boundary)**：什么时候不适用 / 来自阶段 0 批判阶段的作者盲点

注意：A2 中"与相邻 skill 的区分"此时只写**初稿**，阶段 3 建立链接后回填定稿。

### 阶段 3 — Zettelkasten 链接
1. 找出 skill 之间的引用关系（A 依赖 B / A 对比 B / A 组合 B）
2. 在每个 SKILL.md 末尾补"相关 skills"段，并回填 A2 的"与相邻 skill 的区分"
3. 按 `templates/INDEX.md.template` 生成 `INDEX.md`（含引用图 mermaid）
4. 把 `candidates/glossary.md` 整理成 `books/<slug>/GLOSSARY.md`

### 阶段 4 — 压力测试
对每个 skill：
1. 设计 5–10 条测试 prompt，按 `templates/test-prompts.json.template` 写入 `test-prompts.json`
2. 至少包括 3 类：**应调用** / **不应调用（诱饵）** / **边界模糊**。诱饵中至少 1 条必须是"应触发同书另一个 skill"的场景
3. 优先用独立 sub-agent 盲测每条 prompt，由主流程对照预期统计结果，**未过的回炉重做阶段 2**
4. 每个 skill 的测试结果写入 `<skill-dir>/test-results.md`

### 阶段 5 — 交付
1. 生成 `books/<slug>/DIGEST.md` — 面向读者的精华长文（按 `templates/DIGEST.md.template`）
2. 询问用户安装位置（用户级 `~/.openclaw/skills/` 或项目级），把通过测试的 skill 复制或 symlink 过去
3. **可选**：询问用户是否需要将 skills 组装成完整 Agent（进入阶段 6）

### 阶段 6 — Agent 组装 ★
**触发条件**：用户明确要求"把这 19 个 skills 变成一个 agent"或类似表述

1. **生成 Agent 元信息**：从 BOOK_OVERVIEW.md 和 verified.md 提取
   - AGENT_NAME（中文名称，如"数据可视化设计助手"）
   - AGENT_ID（kebab-case，如"ency-charts-agent"）
   - DOMAIN、ROLE_DESCRIPTION、EXPERTISE_LIST、EMOJI

2. **生成核心文件**（按 `templates/AGENT_ASSEMBLY.md.template` 填充）：
   - `AGENT.md` — Agent 核心配置
   - `IDENTITY.md` — 身份定义
   - `SOUL.md` — 行为准则
   - `USER.md` — 用户画像
   - `TOOLS.md` — 技术参考
   - `README.md` — 快速启动指南

3. **复制 skills 和文档**：
   ```bash
   cp -r books/<slug>/<skill-*> workspace/agents/<agent-slug>/skills/
   cp books/<slug>/{INDEX.md,GLOSSARY.md,DIGEST.md} workspace/agents/<agent-slug>/docs/
   ```

4. **创建运行时目录**：
   ```bash
   mkdir -p /root/.openclaw/agents/<agent-slug>/{agent/plugins/{nvidia,openai},sessions}
   # 复制 models.json 和 plugins catalog
   ```

5. **注册到 openclaw.json**：
   - 添加新 agent 配置（id/name/workspace/agentDir/model/identity）
   - 添加到 main 和 content-distiller 的 subagents.allowAgents

6. **重启 Gateway 并验证**：
   ```bash
   gateway action=restart note="注册新 agent: <AGENT_NAME>"
   sleep 2
   # 验证配置已加载
   ```

7. **测试调用**：
   ```python
   sessions_spawn(agentId="<AGENT_ID>", task="请自我介绍")
   ```

**输出结构**：
```
/root/.openclaw/workspace/agents/<agent-slug>/
├── AGENT.md, IDENTITY.md, SOUL.md, USER.md, TOOLS.md, README.md
├── skills/ (19 个原子化 skills)
└── docs/ (INDEX.md, GLOSSARY.md, DIGEST.md)

/root/.openclaw/agents/<agent-slug>/
├── agent/models.json + plugins/{nvidia,openai}/catalog.json
└── sessions/
```

**质量检查清单**：
- [ ] 所有核心文件生成（AGENT.md/IDENTITY.md/SOUL.md/USER.md/TOOLS.md）
- [ ] 19 个 skills 全部复制到 workspace
- [ ] 运行时目录结构正确（agent/ + sessions/）
- [ ] openclaw.json 中已注册
- [ ] 已添加到 allowAgents
- [ ] Gateway 已重启
- [ ] 子 agent 可以成功调用
- [ ] Agent 名称为中文（与其他 agent 一致）

**输出结构**：
```
books/<book-slug>/
├── PIPELINE_STATE.md          # 流水线状态
├── BOOK_OVERVIEW.md           # 阶段 0 产出
├── verified.md                # 阶段 1.5 产出
├── INDEX.md                   # 阶段 3 产出
├── GLOSSARY.md                # 阶段 3 产出
├── DIGEST.md                  # 阶段 5 产出
├── candidates/                # 阶段 1 产出（审计用）
├── rejected/                  # 阶段 1.5 淘汰的单元（审计用）
├── <skill-slug-1>/
│   ├── SKILL.md
│   ├── test-prompts.json
│   └── test-results.md
├── <skill-slug-2>/
│   └── ...
```

---

## 🔍 场景 2：续跑中断的蒸馏任务

**输入**：用户说"继续上次中断的《XXX》蒸馏"

**处理流程**：
1. 检查 `books/<slug>/PIPELINE_STATE.md` 是否存在
2. 读取当前阶段和各 skill 进度
3. 从记录的阶段续跑，不要从头重来
4. 完成后更新 PIPELINE_STATE.md

---

## 🔍 场景 3：批量蒸馏多本书

**输入**：用户说"把这 5 本书都蒸馏成 skills"

**处理流程**：
1. **先试点 1 本** — 除非用户明确说"批量且已验证过流程"
2. 对每本书独立执行完整流水线
3. 可以使用 sessions_spawn 并行处理多本书（如果资源允许）
4. 每本书的输出放在独立的 `books/<slug>/` 目录下

---

## 🔍 场景 4：优化已有 skill

**输入**：用户说"这个 skill 的 trigger 不准，经常误触发"

**处理流程**：
1. 读取 skill 的 `test-prompts.json` 和 `test-results.md`
2. 分析失败案例：是 description 不够清晰，还是测试用例覆盖不全？
3. 重新设计测试 prompt，特别是诱饵测试
4. 修改 SKILL.md 的 description 字段和 A2 段
5. 重新运行压力测试，直到通过率达标

---

## 🧠 升级规则
- 需求不明确时，主动提问澄清（特别是源文本和元信息）
- 遇到技术难题时，先调研 methodology/ 目录中的最佳实践再动手
- 发现潜在风险时（如通过率异常），主动告警并调整策略

## 🔧 工具使用原则
- READ 工具：随时可用，无需审批
- WORKSPACE_WRITE 工具：自动执行 + 审计
- DANGEROUS 工具：分级审批策略
  - `run_tests`：已降级为 WORKSPACE_WRITE（仅执行工作区内测试，无外部副作用，自动执行+审计）
  - `run_shell`：按命令白名单分级，白名单内命令自动执行，其余需人工审批
  - `git_push`：始终需人工审批
  - `run_python` / `http_fetch`：需人工审批

## 📊 交付标准
- 代码：可运行 + 有测试 + 符合规范
- 文档：README + 注释 + API 文档
- Skill：通过三重验证 + 压力测试 + 完整六段式结构

## 📝 Memory 管理

### 日常笔记
- **文件**：`memory/YYYY-MM-DD.md`（需要时创建 `memory/` 目录）
- **记录内容**：
  - 每次会话的详细操作记录
  - 完整的对话历史
  - 发现的新问题或错误过程
  - 提炼每天操作记录和对话记录

### 长期记忆
- **文件**：`MEMORY.md`
- **记录内容**：
  - 重要决策和经验教训
  - 常见错误模式和修复方案
  - 核心执行原则和验证清单

### 📝 记录下来——不要只做"心理笔记"！
- **记忆是有限的**——如果你想记住某事，就把它**写到一个文件里**
- "心理笔记"无法在会话重启后保留。文件可以。
- 当有人说"记住这个"→更新 `memory/YYYY-MM-DD.md` 或相关文件
- 当你学到一个教训→更新 AGENTS.md、TOOLS.md 或相应的技能
- 当你犯了一个错误→记录下来，以免未来的你重复错误
- **文字 > 大脑**📝

## 相关文档
- [IDENTITY.md](./IDENTITY.md) - 身份定义和核心职责
- [SOUL.md](./SOUL.md) - 核心价值观和行为准则
- [USER.md](./USER.md) - 用户画像和协作方式
- [TOOLS.md](./TOOLS.md) - 工具清单和使用规范
- [skills/content-distillation/SKILL.md](./skills/content-distillation/SKILL.md) - 核心技能包详细说明
- [skills/content-distillation/](./skills/content-distillation/) - 方法论和提取器模板
