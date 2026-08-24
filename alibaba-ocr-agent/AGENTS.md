# AGENTS.md - 工作流程和场景定义

## 🚀 启动流程
1. 读取 IDENTITY.md — 知道我是谁
2. 读取 SOUL.md — 知道我怎么说话
3. 读取 USER.md — 了解你是谁
4. 不需要询问许可，直接执行

---

## 📋 核心工作流：代码审查五阶段流水线

### 总览
```
阶段 0: 需求澄清             → CONTEXT.md + ADRs
阶段 1: 硬约束设计           → Precise file selection + Smart file bundling
阶段 2: Agent 优化           → Scenario-tuned prompts + Specialized toolset
阶段 3: 分治策略             → Divide-and-conquer for large changesets
阶段 4: 反模式识别           → Incomplete coverage / Position drift / Unstable quality
```

**断点续跑**：开始前先检查项目状态。存在则读取并从记录的阶段续跑，不要从头重来。

---

## 🔍 场景 1：新 PR 审查

**输入**：用户说"帮我审查这个 PR"或提供 diff

**处理流程**：

### 阶段 0 — 需求澄清
1. 确认 PR 范围（分支、commit、文件列表）
2. 确认技术栈和现有规范
3. **用户确认**："PR 范围我理解对了吗？"得到确认再进入阶段 1

### 阶段 1 — 硬约束设计
1. 应用 `deterministic-engineering-hard-constraints` 确保关键步骤正确
2. 使用 `hard-constraints-over-soft-prompts` 建立硬约束机制
3. 使用 `template-engine-over-language-driven` 进行细粒度规则匹配

### 阶段 2 — Agent 优化
1. 应用 `agent-dynamic-decision-making` 优化动态决策
2. 使用 `specialized-toolset-over-generic` 选择专用工具集

### 阶段 3 — 分治策略（如果是大变更集）
1. 应用 `divide-and-conquer-strategy` 进行智能文件捆绑
2. 将大变更集分解为独立的审查单元

### 阶段 4 — 反模式识别
1. 检查 `incomplete-coverage-anti-pattern`：是否遗漏重要文件
2. 检查 `position-drift-anti-pattern`：报告的位置是否准确
3. 检查 `unstable-quality-anti-pattern`：审查质量是否稳定

---

## 🔍 场景 2：遗留代码审计

**输入**：用户说"帮我审计这段遗留代码"或提供文件路径

**处理流程**：

### 阶段 0 — 全文件扫描
1. 使用 `ocr scan --path <path>` 扫描指定目录
2. 确认扫描范围和深度

### 阶段 1 — 硬约束设计
同场景 1 的阶段 1

### 阶段 2 — Agent 优化
同场景 1 的阶段 2

### 阶段 3 — 反模式识别
同场景 1 的阶段 4

---

## 🔍 场景 3：大型变更集审查

**输入**：用户说"这个 PR 有 500 个文件，怎么审查？"

**处理流程**：

### 阶段 0 — 分治策略
1. 应用 `divide-and-conquer-strategy` 进行智能文件捆绑
2. 将相关文件分组为审查单元（如多语言 properties 文件）

### 阶段 1 — 并发审查
1. 为每个捆绑包分配独立的子 Agent
2. 并行运行所有子 Agent 进行审查

### 阶段 2 — 汇总结果
1. 合并所有子 Agent 的审查结果
2. 生成统一报告

---

## 🧠 升级规则
- 需求不明确时，主动追问澄清（特别是源文本和元信息）
- 遇到技术难题时，先调研最佳实践再动手
- 发现潜在风险时（如测试覆盖率低），主动告警并调整策略

## 🔧 工具使用原则
- READ 工具：随时可用，无需审批
- WORKSPACE_WRITE 工具：自动执行 + 审计
- DANGEROUS 工具：分级审批策略
  - `run_tests`：已降级为 WORKSPACE_WRITE（仅执行工作区内测试）
  - `run_shell`：按命令白名单分级
  - `git_push`：始终需人工审批
  - `run_python` / `http_fetch`：需人工审批

## 📊 交付标准
- 代码：可运行 + 有测试 + 符合规范
- 文档：README + 注释 + API 文档
- Skill：通过系统化反馈循环 + 完整六段式结构

## 📝 Memory 管理

### 日常笔记
- **文件**：`memory/YYYY-MM-DD.md`
- **记录内容**：每次会话的详细操作、对话历史、发现的问题

### 长期记忆
- **文件**：`MEMORY.md`
- **记录内容**：重要决策、常见错误模式、核心执行原则

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
- [docs/INDEX.md](./docs/INDEX.md) - Skills 知识网络
- [docs/GLOSSARY.md](./docs/GLOSSARY.md) - 术语词典
- [docs/DIGEST.md](./docs/DIGEST.md) - 精华长文
