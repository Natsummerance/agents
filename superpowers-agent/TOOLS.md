# TOOLS.md - 技术参考

> **文档说明**: 本文件记录 Superpowers 助手的工具清单、使用规范、常见错误模式和最佳实践

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

## obra/superpowers Skills 流水线工具

### Frameworks（3 个）

| Skill | 职责 | Trigger |
|-------|------|---------|
| **subagent-driven-development** | 分派子 Agent + 两阶段审查 | 用户提到"subagent"、"parallel agents"、"autonomous work"、"two-stage review"等问题 |
| **mandatory-workflow** | 7 步强制工作流 | 用户提到"7 steps"、"mandatory workflow"、"brainstorming"、"writing-plans"等问题 |
| **git-worktree-isolation** | Git worktree 隔离工作区 | 用户提到"git worktree"、"isolated workspace"、"parallel branches"等问题 |

### Principles（2 个）

| Skill | 职责 | Trigger |
|-------|------|---------|
| **test-first-philosophy** | TDD 是强制性的 | 用户提到"TDD"、"test-driven"、"RED-GREEN-REFACTOR"、"write tests first"等问题 |
| **evidence-over-claims** | 验证后再声明成功 | 用户提到"verify"、"ensure fixed"、"actually works"、"evidence"等问题 |

### Anti-Patterns（2 个）

| Skill | 职责 | Trigger |
|-------|------|---------|
| **skipping-tests-anti-pattern** | 跳过测试的反模式 | 用户提到"skip tests"、"code before tests"、"no tests"、"regression"等问题 |
| **ad-hoc-debugging-anti-pattern** | 凭猜测调试的反模式 | 用户提到"guessing"、"ad-hoc debugging"、"root cause"、"systematic debugging"等问题 |

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

### 错误模式1：跳过硬约束直接执行
**问题**: 用户说"帮我实现这个功能"，但没有确保 TDD 就直接执行  
**解决方案**:
- 先应用 test-first-philosophy 确保测试先行
- 确保 RED-GREEN-REFACTOR 循环完整执行

### 错误模式2：忽视分治策略
**问题**: 直接处理大型变更集，导致上下文污染  
**解决方案**:
- 使用 subagent-driven-development 进行子 Agent 分派
- 将大变更集分解为独立的审查单元

### 错误模式3：缺乏系统性调试
**问题**: 凭猜测调试导致 Bug 反复出现  
**解决方案**:
- 使用 ad-hoc-debugging-anti-pattern 识别问题
- 应用 systematic-debugging 的 4 阶段根因追踪流程

---

## 相关文档
- [IDENTITY.md](./IDENTITY.md) - 身份定义和核心职责
- [SOUL.md](./SOUL.md) - 核心价值观和行为准则
- [AGENTS.md](./AGENTS.md) - 工作流程和场景定义
- [USER.md](./USER.md) - 用户画像和协作方式
