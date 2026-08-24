# TOOLS.md - 技术参考

> **文档说明**: 本文件记录阿里巴巴 Open Code Review 助手的工具清单、使用规范、常见错误模式和最佳实践

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

## alibaba/open-code-review Skills 流水线工具

### Frameworks（3 个）

| Skill | 职责 | Trigger |
|-------|------|---------|
| **deterministic-engineering-hard-constraints** | 确定性工程硬约束 | 用户提到"必须精确"、"不能遗漏"、"位置不准"等问题 |
| **agent-dynamic-decision-making** | Agent 动态决策优势 | 用户提到"动态决策"、"上下文检索"、"提示优化"等问题 |
| **divide-and-conquer-strategy** | 分治策略 | 用户提到"大变更集"、"并发审查"、"文件捆绑"等问题 |

### Principles（4 个）

| Skill | 职责 | Trigger |
|-------|------|---------|
| **hard-constraints-over-soft-prompts** | 硬约束优于软提示 | 用户提到"硬约束"、"工程逻辑"、"稳定性"等问题 |
| **template-engine-over-language-driven** | 模板引擎优于语言驱动规则 | 用户提到"模板引擎"、"规则匹配"、"稳定性"等问题 |
| **specialized-toolset-over-generic** | 专用工具集优于通用工具集 | 用户提到"专用工具"、"生产数据"、"工具优化"等问题 |

### Anti-Patterns（3 个）

| Skill | 职责 | Trigger |
|-------|------|---------|
| **incomplete-coverage-anti-pattern** | 不完整覆盖反模式 | 用户提到"遗漏文件"、"偷工减料"、"覆盖不全"等问题 |
| **position-drift-anti-pattern** | 位置漂移反模式 | 用户提到"位置不准"、"行号漂移"、"文件引用错误"等问题 |
| **unstable-quality-anti-pattern** | 质量不稳定反模式 | 用户提到"质量波动"、"提示微调"、"难以调试"等问题 |

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
**问题**: 用户说"帮我审查这个 PR"，但没有确保硬约束就直接执行  
**解决方案**:
- 先应用 deterministic-engineering-hard-constraints 确保关键步骤正确
- 确保文件选择、规则匹配、位置定位都有硬约束

### 错误模式2：忽视分治策略
**问题**: 直接处理大型变更集，导致"偷工减料"  
**解决方案**:
- 使用 divide-and-conquer-strategy 进行智能文件捆绑
- 将大变更集分解为独立的审查单元

### 错误模式3：缺乏专用工具集
**问题**: 使用通用工具集导致不稳定  
**解决方案**:
- 使用 specialized-toolset-over-generic 从生产数据中提炼专用工具集
- 避免使用通用工具集处理代码审查场景

---

## 相关文档
- [IDENTITY.md](./IDENTITY.md) - 身份定义和核心职责
- [SOUL.md](./SOUL.md) - 核心价值观和行为准则
- [AGENTS.md](./AGENTS.md) - 工作流程和场景定义
- [USER.md](./USER.md) - 用户画像和协作方式
