# TOOLS.md - 技术参考

> **文档说明**: 本文件记录工程实践助手的工具清单、使用规范、常见错误模式和最佳实践

---

## 工具清单

### READ 权限（8 个）

- `read_file` — 读取文件内容（上限 512KB）
- `list_dir` — 列出目录内容（上限 200 条）
- `grep` — 文本搜索（上限 100 条命中）
- `glob` — 文件模式匹配（上限 200）
- `git_status` — 查看 Git 工作区状态
- `git_diff` — 查看 Git 差异
- `count_tokens` — Token 统计
- `ask_user` — 向用户提问

### WORKSPACE_WRITE 权限（10 个）

- `write_file` — 写入文件（UTF-8，自动创建父目录）
- `edit_file` — 编辑文件（多 hunk 替换，原子性）
- `mkdir` — 创建目录
- `git_init` — 初始化 Git 仓库
- `git_add` — Git 暂存文件
- `git_commit` — Git 提交
- `git_revert` — Git 还原提交
- `apply_patch` — 批量应用文件补丁
- `run_tests` — 运行测试套件（仅执行工作区内测试）
- `sessions_spawn` — 启动子代理执行独立子任务

### DANGEROUS 权限（4 个，需审批）

- `run_shell` — 执行 Shell 命令（需人工审批）
- `run_python` — 执行 Python 代码（需人工审批）
- `http_fetch` — 抓取 URL 内容（需人工审批）
- `git_push` — Git 推送（始终需人工审批）

---

## mattpocock/skills 流水线工具

### Engineering Skills（18 个）

#### User-invoked（9 个）

| Skill | 职责 | Trigger |
|-------|------|---------|
| **ask-matt** | 技能路由器 | 用户不确定该用哪个 skill 时 |
| **grill-with-docs** | 带文档的追问会话 | 需求不明确，需要建立共享语言时 |
| **triage** | 问题分类状态机 | 需要处理大量 issues 时 |
| **improve-codebase-architecture** | 架构改进扫描 | 定期扫描架构债务时 |
| **setup-matt-pocock-skills** | 初始化配置 | 新项目首次使用时 |
| **to-spec** | 对话转规格说明 | 已有讨论，需要结构化输出时 |
| **to-tickets** | 规格说明转工单 | 需要将计划分解为可执行工单时 |
| **implement** | 实现工单 | 有明确的 specs/tickets 需要实现时 |
| **wayfinder** | 大规模工作规划 | 超出单个 session 能hold住的工作量时 |

#### Model-invoked（9 个）

| Skill | 职责 | Trigger |
|-------|------|---------|
| **prototype** | 快速原型构建 | 需要验证设计假设时 |
| **diagnosing-bugs** | 系统性调试 | 遇到难以定位的 bug 时 |
| **research** | 高可信度研究 | 需要查阅官方文档/源码时 |
| **tdd** | 测试驱动开发 | 实现新功能或修复 bug 时 |
| **domain-modeling** | 领域建模 | 需要建立/完善共享语言时 |
| **codebase-design** | 代码库设计 | 设计新模块或重构现有代码时 |
| **code-review** | 双轴代码审查 | PR 合并前或定期质量检查时 |
| **resolving-merge-conflicts** | 合并冲突解决 | git merge/rebase 冲突时 |
| **wizard** | 交互式向导生成 | 需要人类手动执行的步骤时 |

### Productivity Skills（7 个）

#### User-invoked（5 个）

| Skill | 职责 | Trigger |
|-------|------|---------|
| **grill-me** | 深度追问会话 | 非代码类的需求澄清时 |
| **handoff** | 会话交接文档 | 需要将工作移交给另一个 agent 时 |
| **teach** | 多会话教学 | 需要系统化传授知识时 |
| **to-questionnaire** | 决策问卷生成 | 需要他人输入才能做决策时 |
| **wait-what** | 消息重述 | 消息没有传达到位时 |

#### Model-invoked（2 个）

| Skill | 职责 | Trigger |
|-------|------|---------|
| **grilling** | 通用追问原语 | 被 user-invoked skills 调用时 |
| **writing-for-agents** | 面向 Agent 的写作 | 编写 skills/AGENTS.md 等文档时 |

---

## 质量检查清单

### 通用检查
- [ ] 代码可运行
- [ ] 有单元测试
- [ ] 符合编码规范
- [ ] 无安全问题（SQL 注入/XSS/敏感信息泄露）
- [ ] 无性能问题（N+1 查询/内存泄漏）
- [ ] 有 README + 注释

### Skill 专项检查
- [ ] 每个 skill 有明确的 trigger 条件
- [ ] description 字段说明"何时调用 + 何时不调用"
- [ ] 已安装到 skills 目录

---

## 常见错误模式和解决方案

### 错误模式1：跳过追问直接执行
**问题**: 用户说"帮我实现这个功能"，但没有澄清需求就直接写代码  
**解决方案**:
- 先调用 `/grill-with-docs` 或 `/grill-me` 追问细节
- 确保需求对齐后再进入实现阶段

### 错误模式2：没有反馈循环
**问题**: 直接写代码，没有先写测试  
**解决方案**:
- 使用 `/tdd` skill，遵循红绿重构循环
- 先写失败测试 → 修复 → 重构

### 错误模式3：忽视架构设计
**问题**: 代码逐渐变成泥球，难以维护  
**解决方案**:
- 定期运行 `/improve-codebase-architecture` 扫描架构债务
- 使用 `/codebase-design` 设计深模块

### 错误模式4：缺乏共享语言
**问题**: agent 用 20 个词描述一个概念  
**解决方案**:
- 使用 `/domain-modeling` 建立 CONTEXT.md
- 挑战术语对照词汇表，更新 ADRs

---

## 相关文档
- [IDENTITY.md](./IDENTITY.md) - 身份定义和核心职责
- [SOUL.md](./SOUL.md) - 核心价值观和行为准则
- [AGENTS.md](./AGENTS.md) - 工作流程和场景定义
- [USER.md](./USER.md) - 用户画像和协作方式
