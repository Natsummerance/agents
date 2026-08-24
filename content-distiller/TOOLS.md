# TOOLS.md - 技术参考

> **文档说明**: 本文件记录 Content Distiller 的工具清单、使用规范、常见错误模式和最佳实践

---

## 工具清单

### READ 权限（8 个）

- `read_file` — 读取文件内容（上限 512KB）
  - 参数：`path`(string, 必填), `offset`(int, 可选, 起始行), `limit`(int, 可选, 读取行数)
  - 示例：`read_file(path="../examples/distillation-outputs/poor-charlie/book-overview.md", offset=0, limit=100)`

- `list_dir` — 列出目录内容（上限 200 条）
  - 参数：`path`(string, 必填)
  - 示例：`list_dir(path="../examples/distillation-outputs/poor-charlie/candidates")`

- `grep` — 文本搜索（上限 100 条命中）
  - 参数：`pattern`(string, 必填), `path`(string, 可选), `file_pattern`(string, 可选)
  - 示例：`grep(pattern="逆向思维", path="../examples/distillation-outputs/poor-charlie/", file_pattern="*.md")`

- `glob` — 文件模式匹配（上限 200）
  - 参数：`pattern`(string, 必填), `path`(string, 可选)
  - 示例：`glob(pattern="**/*.test.json", path="../examples/distillation-outputs/poor-charlie/")`

- `git_status` — 查看 Git 工作区状态
  - 参数：`path`(string, 可选, 仓库路径)
  - 示例：`git_status(path=".")`

- `git_diff` — 查看 Git 差异
  - 参数：`target`(string, 可选, 分支/commit), `path`(string, 可选)
  - 示例：`git_diff(target="HEAD~1")`

- `count_tokens` — Token 统计
  - 参数：`text`(string, 必填)
  - 示例：`count_tokens(text="Hello world")`

- `ask_user` — 向用户提问
  - 参数：`question`(string, 必填)
  - 示例：`ask_user(question="请确认源文本路径：是 PDF 还是 TXT？")`

### WORKSPACE_WRITE 权限（10 个）

- `write_file` — 写入文件（UTF-8，自动创建父目录）
  - 参数：`path`(string, 必填), `content`(string, 必填)
  - 示例：`write_file(path="../examples/distillation-outputs/poor-charlie/BOOK_OVERVIEW.md", content="# ...")`

- `edit_file` — 编辑文件（多 hunk 替换，原子性）
  - 参数：`path`(string, 必填), `edits`(array, 必填, 每项含 `old` 和 `new`)
  - 示例：`edit_file(path="skills/inversion-thinking/SKILL.md", edits=[{old: "foo", new: "bar"}])`

- `mkdir` — 创建目录
  - 参数：`path`(string, 必填)
  - 示例：`mkdir(path="../examples/distillation-outputs/poor-charlie/rejected")`

- `git_init` — 初始化 Git 仓库
  - 参数：`path`(string, 可选, 默认当前目录)
  - 示例：`git_init(path="../examples/distillation-outputs/poor-charlie")`

- `git_add` — Git 暂存文件
  - 参数：`path`(string, 必填, 文件或目录路径)
  - 示例：`git_add(path="../examples/distillation-outputs/poor-charlie/")`

- `git_commit` — Git 提交
  - 参数：`message`(string, 必填)
  - 示例：`git_commit(message="feat: add inversion thinking skill")`

- `git_revert` — Git 还原提交
  - 参数：`commit`(string, 必填, commit hash)
  - 示例：`git_revert(commit="abc1234")`

- `apply_patch` — 批量应用文件补丁（统一格式，原子性执行）
  - 参数：`patches`(array, 必填, 每项含 `path` 和 `content`)
  - 示例：`apply_patch(patches=[{path: "a.ts", content: "..."}, {path: "b.ts", content: "..."}])`

- `run_tests` — 运行测试套件（WORKSPACE_WRITE — 仅执行工作区内测试，不产生外部副作用）
  - 参数：`command`(string, 可选, 测试命令), `path`(string, 可选, 测试目录)
  - 示例：`run_tests(command="npm test", path="tests/")`

- `run_subagent` / `sessions_spawn` — 启动子代理执行独立子任务（需指定任务描述和工具权限范围）
  - 参数：`task`(string, 必填, 任务描述), `allowed_tools`(array, 可选, 可用工具列表)
  - 示例：`sessions_spawn(task="提取框架候选单元", allowed_tools=["read_file", "write_file"])`

### DANGEROUS 权限（4 个，需审批）

- `run_shell` — 执行 Shell 命令（需人工审批）
  - 参数：`command`(string, 必填), `cwd`(string, 可选, 工作目录)
  - 示例：`run_shell(command="cp -r ../examples/distillation-outputs/poor-charlie/skills ~/.openclaw/skills/", cwd=".")`

- `run_python` — 执行 Python 代码（需人工审批）
  - 参数：`code`(string, 必填)
  - 示例：`run_python(code="import json; print(json.dumps(data))")`

- `http_fetch` — 抓取 URL 内容（需人工审批）
  - 参数：`url`(string, 必填), `method`(string, 可选, 默认 GET)
  - 示例：`http_fetch(url="https://example.com/transcript.txt")`

- `git_push` — Git 推送（始终需人工审批）
  - 参数：`remote`(string, 可选, 默认 origin), `branch`(string, 可选)
  - 示例：`git_push(remote="origin", branch="main")`

---

## RIA-TV++ 流水线工具

### 阶段 0：Adler 整书理解
**关键输出**：`BOOK_OVERVIEW.md`
**模板位置**：`skills/content-distillation/templates/BOOK_OVERVIEW.md.template`
**方法论**：`skills/content-distillation/methodology/01-stage0-adler.md`

**检查清单**：
- [ ] 结构分析：全书骨架是否清晰？
- [ ] 解释：关键术语是否定义？
- [ ] 批判：作者盲点是否识别？
- [ ] 应用：方法论适用场景是否明确？
- [ ] 用户确认：是否得到用户对骨架的确认？

### 阶段 1：并行提取
**关键输出**：`candidates/<type>.md`（5 个文件）
**Extractor 位置**：`skills/content-distillation/extractors/`

| Extractor | 文件 | 职责 |
|-----------|------|------|
| 框架提取器 | `framework-extractor.md` | 决策框架 / 思维模型 |
| 原则提取器 | `principle-extractor.md` | 原则 / 清单 / 规则 |
| 案例提取器 | `case-extractor.md` | 作者亲自使用的实例 |
| 反例提取器 | `counter-example-extractor.md` | 书中警告的失败模式 |
| 术语提取器 | `glossary-extractor.md` | 关键概念词典 |

**并行策略**：
- 优先使用 `sessions_spawn` 同时启动 5 个 sub-agent
- 每个 sub-agent 独立读书、独立提取、独立输出
- 长文本按 `methodology/02-stage1-parallel-extract.md` 分块处理
- 降级方案：串行执行，产出格式不变

**检查清单**：
- [ ] 5 个 extractor 全部完成
- [ ] 每个候选单元有原文引用（≤150 字）
- [ ] 每个候选单元有 source_chapter 标注
- [ ] 边界模糊时宁可多提取，交给阶段 1.5 去重

### 阶段 1.5：三重验证
**关键输出**：`verified.md` + `rejected/`
**方法论**：`skills/content-distillation/methodology/03-stage1.5-triple-verify.md`

**验证标准**：
- **V1 跨域**：书中至少 2 个独立段落有佐证
- **V2 预测力**：能回答一个书里没明说的新问题
- **V3 独特性**：不是任何聪明人都会说的常识

**检查清单**：
- [ ] 每个候选单元都跑了 V1/V2/V3
- [ ] 通过的写入 verified.md，附带判定理由
- [ ] 未通过的写入 rejected/，附带不通过的原因
- [ ] 用户轻确认：展示入选名单，得到确认再进入阶段 2

**数量预期**：
- 方法论密集的书（如《穷查理宝典》）通过率约 30–50%
- 散文类书可能只有 5–10%
- 通过率过低 (<5%) 或过高 (>80%) 都要警惕

### 阶段 2：RIA++ 构造
**关键输出**：每个 skill 的 `SKILL.md`
**模板位置**：`skills/content-distillation/templates/SKILL.md.template`
**方法论**：`skills/content-distillation/methodology/04-stage2-ria-plus.md`

**六段式结构**：
- **R (Reading)**：原文引用 ≤150 字/段（英文 ≤100 词/段）
- **I (Interpretation)**：用自己的话重写方法论骨架
- **A1 (Past Application)**：书中作者用过的案例
- **A2 (Future Trigger)** ★：用户在什么情境下会需要这个
- **E (Execution)**：1-2-3 可执行步骤
- **B (Boundary)**：什么时候不适用 / 作者的盲点

**检查清单**：
- [ ] 每个 skill 有完整的 R/I/A1/A2/E/B 六段
- [ ] description 字段明确 trigger 条件（≤300 字）
- [ ] A2 中"与相邻 skill 的区分"写初稿（阶段 3 回填定稿）
- [ ] 原文引用不超过限制

### 阶段 3：Zettelkasten 链接
**关键输出**：`INDEX.md` + `GLOSSARY.md` + 回填 related_skills
**方法论**：`skills/content-distillation/methodology/05-stage3-zettelkasten.md`
**模板位置**：`skills/content-distillation/templates/INDEX.md.template`

**链接类型**：
- `depends-on`: A 依赖 B（必须先理解 B 才能用 A）
- `contrasts-with`: A 对比 B（两者解决类似问题但方法不同）
- `composes-with`: A 组合 B（两者可以一起使用）

**检查清单**：
- [ ] 找出所有 skill 之间的引用关系
- [ ] 在每个 SKILL.md 末尾补"相关 skills"段
- [ ] 回填 A2 的"与相邻 skill 的区分"为定稿
- [ ] 生成 INDEX.md（含 mermaid 引用图）
- [ ] 整理 GLOSSARY.md（所有 skill 的共享词典）

### 阶段 4：压力测试
**关键输出**：`test-prompts.json` + `test-results.md`
**方法论**：`skills/content-distillation/methodology/06-stage4-pressure-test.md`
**模板位置**：`skills/content-distillation/templates/test-prompts.json.template`

**测试用例设计**：
- **应调用**：3–5 条，用户确实需要这个 skill 的场景
- **不应调用（诱饵）**：2–3 条，用户不需要这个 skill 的场景
  - 至少 1 条必须是"应触发同书另一个 skill"的场景（跨 skill 混淆测试）
- **边界模糊**：1–2 条，难以判断的场景

**检查清单**：
- [ ] 每个 skill 有 5–10 条测试 prompt
- [ ] 包含诱饵测试（不应调用的场景）
- [ ] 至少 1 条是同书兄弟 skill 的场景
- [ ] 遵循 darwin-skill 兼容格式
- [ ] 未过的回炉重做阶段 2（不做"表面修补"）

### 阶段 5：交付
**关键输出**：`DIGEST.md` + 安装到 skills 目录
**方法论**：`skills/content-distillation/methodology/07-stage5-deliver.md`
**模板位置**：`skills/content-distillation/templates/DIGEST.md.template`

**检查清单**：
- [ ] 生成 DIGEST.md（面向读者的精华长文）
- [ ] 询问用户安装位置（用户级 `~/.openclaw/skills/` 或项目级）
- [ ] 把通过测试的 skill 复制或 symlink 过去
- [ ] **可选**：询问用户是否需要将 skills 组装成完整 Agent（进入阶段 6）

### 阶段 6：Agent 组装 ★
**关键输出**：完整 OpenClaw Agent（AGENT.md + IDENTITY.md + SOUL.md + USER.md + TOOLS.md + 注册）
**方法论**：`skills/content-distillation/methodology/08-stage6-agent-assembly.md`
**模板位置**：`skills/content-distillation/templates/AGENT_ASSEMBLY.md.template`

**触发条件**：用户明确要求"把这 N 个 skills 变成一个 agent"或类似表述

**执行步骤**：
1. 生成 Agent 元信息（从 BOOK_OVERVIEW.md 和 verified.md 提取）
2. 生成核心文件（AGENT.md、IDENTITY.md、SOUL.md、USER.md、TOOLS.md、README.md）
3. 复制 skills 和文档到 workspace/agents/<agent-slug>/
4. 创建运行时目录（agent/models.json + plugins/）
5. 注册到 openclaw.json（添加到 list 和 allowAgents）
6. 重启 Gateway 并验证
7. 测试调用（sessions_spawn）

**检查清单**：
- [ ] 所有核心文件生成（AGENT.md/IDENTITY.md/SOUL.md/USER.md/TOOLS.md）
- [ ] 19 个 skills 全部复制到 workspace
- [ ] 运行时目录结构正确（agent/ + sessions/）
- [ ] openclaw.json 中已注册
- [ ] 已添加到 main 和 content-distiller 的 allowAgents
- [ ] Gateway 已重启
- [ ] 子 agent 可以成功调用
- [ ] Agent 名称为中文（与其他 agent 一致）

---

## 编码规范

### Skill 命名规范
- **skill-slug**：kebab-case，简短有意义
  - 好例：`inversion-thinking`, `stop-doing-list`, `circle-of-competence`
  - 坏例：`skill-1`, `poor-charlie-skill-001`

### 文件命名规范
- `BOOK_OVERVIEW.md`：全大写，固定名称
- `SKILL.md`：全大写，固定名称
- `INDEX.md`, `GLOSSARY.md`, `DIGEST.md`：全大写，固定名称
- `test-prompts.json`：kebab-case，固定名称
- `PIPELINE_STATE.md`：全大写，固定名称

### YAML Frontmatter 规范
```yaml
---
name: {{skill-slug}}
description: |
  {{何时调用 + 何时不调用 + 关键 trigger 信号, ≤300 字}}
source_book: 《{{BOOK_TITLE}}》 {{AUTHOR}}
source_chapter: {{章节}}
tags: [{{tag1}}, {{tag2}}]
related_skills: []    # 阶段 3 填充
---
```

---

## 质量检查清单

### 通用检查
- [ ] 代码可运行
- [ ] 有单元测试（test-prompts.json）
- [ ] 符合编码规范
- [ ] 无安全问题（SQL 注入/XSS/敏感信息泄露）
- [ ] 无性能问题（N+1 查询/内存泄漏）
- [ ] 有 README + 注释

### Skill 专项检查
- [ ] 每个 skill 通过全部三重验证
- [ ] 每个 skill 有完整的 R/I/A1/A2/E/B 六段
- [ ] 原文引用 ≤150 字/段（英文 ≤100 词/段）
- [ ] 每个 skill 有 test-prompts.json，且包含诱饵测试
- [ ] description 字段明确 trigger 条件
- [ ] 已安装到 skills 目录

---

## 常见错误模式和解决方案

### 错误模式1：没有源文本就凭记忆蒸馏
**问题**: 用户说"帮我拆《穷查理宝典》"，但没有提供文本
**解决方案**:
- 停下来问用户要源文本（PDF / EPUB / TXT / 转写稿）
- 视频/播客建议先用 video-downloader 类工具拿到转写文本
- **绝不**在没有文本的情况下"凭记忆"蒸馏

### 错误模式2：跳过用户确认节点
**问题**: 阶段 0 或阶段 1.5 之后没有让用户确认，直接进入下一阶段
**解决方案**:
- 阶段 0 之后必须问："骨架我理解对了吗？有没有你希望重点突出的方向？"
- 阶段 1.5 之后必须问："这 N 个会做成 skill，有想捞回或砍掉的吗？"
- 这两个确认能避免大量返工

### 错误模式3：三重验证作弊
**问题**: V1 把同一例子换个说法算两处；V2 用书里讨论过的问题冒充"新问题"；V3 只要"说得比较文雅"就认为不是常识
**解决方案**:
- V1：必须是不同章节 + 不同对象 + 不同结论
- V2：新问题应该让人第一眼不知道书里怎么说
- V3：看**内容**本身是否反直觉，而不是措辞

### 错误模式4：description 字段不清晰
**问题**: description 只是"一个关于 X 的 skill"，没有明确 trigger 条件
**解决方案**:
- 必须说明"何时调用 + 何时不调用 + 关键 trigger 信号"
- 好例："用户在纠结一个决策、列举正面理由却理不出头绪时；或在问'怎么做 X 才能成功'时。不适用于：纯信息查询、日常琐碎选择。"
- 关键 trigger 词建议中英双写，提高英文提问场景的触发准确率

### 错误模式5：压力测试不充分
**问题**: 只设计了"应调用"的测试，没有诱饵测试或跨 skill 混淆测试
**解决方案**:
- 至少包括 3 类：应调用 / 不应调用（诱饵）/ 边界模糊
- 诱饵中至少 1 条必须是"应触发同书另一个 skill"的场景
- 未过的回炉重做阶段 2，不做"表面修补"

### 错误模式6：忽视审计轨迹
**问题**: 删除了 candidates/ 或 rejected/ 目录，无法追溯决策过程
**解决方案**:
- candidates/ 和 rejected/ 都要保留
- rejected/ 中的每个文件必须写明不通过的是哪一项、原因是什么
- PIPELINE_STATE.md 必须及时更新

### 错误模式7：没有安装到 skills 目录
**问题**: 完成了所有阶段，但没有把 skill 安装到 `~/.openclaw/skills/`
**解决方案**:
- 阶段 5 必须询问用户安装位置
- 把通过测试的 skill 复制或 symlink 过去
- **没有这一步，产出的 skill 无法被真正调用**

### 错误模式8：忽视断点续跑
**问题**: 中断后从头重来，浪费时间和 token
**解决方案**:
- 开始前先检查 `../examples/distillation-outputs/<slug>/PIPELINE_STATE.md` 是否存在
- 存在则读取并从记录的阶段续跑
- 每完成一个阶段，更新该文件

---

## 相关文档
- [IDENTITY.md](./IDENTITY.md) - 身份定义和核心职责
- [SOUL.md](./SOUL.md) - 核心价值观和行为准则
- [AGENTS.md](./AGENTS.md) - 工作流程和场景定义
- [USER.md](./USER.md) - 用户画像和协作方式
- [skills/content-distillation/SKILL.md](./skills/content-distillation/SKILL.md) - 核心技能包详细说明
- [skills/content-distillation/](./skills/content-distillation/) - 方法论和提取器模板
