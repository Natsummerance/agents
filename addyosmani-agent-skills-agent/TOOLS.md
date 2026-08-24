# TOOLS.md - 技术参考

> **文档说明**: 本文件记录 Agent Skills 助手的工具清单、使用规范、常见错误模式和最佳实践

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

## addyosmani/agent-skills Skills 流水线工具

### Frameworks（3 个）

| Skill | 职责 | Trigger |
|-------|------|---------|
| **spec-driven-development** | 规格说明驱动开发（Spec before code） | 用户提到"先写什么"、"需求模糊"、"避免盲目编码"等问题 |
| **test-driven-development** | 测试驱动开发（Tests are proof） | 用户提到"证明代码正确"、"测试什么时候写"、"如何确保质量"等问题 |
| **auto-build-mode** | 自动构建模式（平衡自动化与安全性） | 用户提到"一次性实现"、"提高效率"、"自动化"等问题 |

### Principles（1 个）

| Skill | 职责 | Trigger |
|-------|------|---------|
| **faster-is-safer** | 更快更安全（频繁部署降低风险） | 用户提到"部署频率"、"降低风险"、"快速迭代"等问题 |

### Anti-Patterns（4 个）

| Skill | 职责 | Trigger |
|-------|------|---------|
| **no-systematic-methodology** | 缺乏系统性方法论的反模式警示 | 用户提到"迷茫"、"不知道下一步"、"随机选择"等问题 |
| **no-progress-tracking** | 缺少进度追踪的反模式警示 | 用户提到"进步"、"技能成长"、"反馈循环"等问题 |
| **no-team-collaboration-guidance** | 缺少团队协作指导的反模式警示 | 用户提到"团队协作"、"Git worktree"、"版本控制"等问题 |
| **one-size-fits-all** | 一刀切的反模式警示 | 用户提到"过度工程化"、"项目类型"、"灵活性"等问题 |

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

### 错误模式1：盲目推荐技能
**问题**: 用户说"帮我推荐技能"，但没有了解用户水平就直接推荐  
**解决方案**:
- 先评估用户当前水平（语言、框架、项目经历）
- 根据水平推荐对应层级的技能

### 错误模式2：忽视反模式警示
**问题**: 只关注正面指导，忽视反模式识别  
**解决方案**:
- 结合正面指导与反模式警示
- 帮助用户识别并避免常见陷阱

### 错误模式3：缺乏系统性框架
**问题**: 随机推荐技能，缺乏连贯的学习路径  
**解决方案**:
- 应用 spec-driven-development 建立需求明确化流程
- 确保每个推荐都有明确的学习目标

---

## 相关文档
- [IDENTITY.md](./IDENTITY.md) - 身份定义和核心职责
- [SOUL.md](./SOUL.md) - 核心价值观和行为准则
- [AGENTS.md](./AGENTS.md) - 工作流程和场景定义
- [USER.md](./USER.md) - 用户画像和协作方式
