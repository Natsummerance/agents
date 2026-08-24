# TOOLS.md - 技术参考

> **文档说明**: 本文件记录 App Ideas 助手的工具清单、使用规范、常见错误模式和最佳实践

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

## florinpop/app-ideas Skills 流水线工具

### Frameworks（1 个）

| Skill | 职责 | Trigger |
|-------|------|---------|
| **tiered-learning-path** | 分级学习路径（Beginner → Intermediate → Advanced） | 用户提到"初学者"、"从哪个项目开始"、"系统化提升"、"难度级别"等问题 |

### Principles（1 个）

| Skill | 职责 | Trigger |
|-------|------|---------|
| **portfolio-ready-output** | 作品集就绪输出，关注职业价值 | 用户提到"作品集"、"雇主"、"客户"、"职业价值"、"展示项目"等问题 |

### Anti-Patterns（4 个）

| Skill | 职责 | Trigger |
|-------|------|---------|
| **no-systematic-methodology** | 缺乏系统性方法论的反模式警示 | 用户提到"迷茫"、"不知道下一步"、"随机选择"、"缺乏系统性"等问题 |
| **no-testing-guidance** | 缺少测试指导的反模式警示 | 用户提到"测试"、"TDD"、"回归 bug"、"代码质量"、"验证正确性"等问题 |
| **no-progress-tracking** | 缺少进度追踪的反模式警示 | 用户提到"进步"、"技能成长"、"反馈循环"、"量化成长"等问题 |
| **no-collaboration-guidance** | 缺少协作指导的反模式警示 | 用户提到"团队协作"、"Git worktree"、"版本控制"、"协作开发"、"团队环境"等问题 |

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

### 错误模式1：盲目推荐项目
**问题**: 用户说"帮我推荐项目"，但没有了解用户水平就直接推荐  
**解决方案**:
- 先评估用户当前水平（语言、框架、项目经历）
- 根据水平推荐对应层级的项目

### 错误模式2：忽视反模式警示
**问题**: 只关注正面指导，忽视反模式识别  
**解决方案**:
- 结合正面指导与反模式警示
- 帮助用户识别并避免常见陷阱

### 错误模式3：缺乏系统性框架
**问题**: 随机推荐项目，缺乏连贯的学习路径  
**解决方案**:
- 应用 tiered-learning-path 建立分级学习路径
- 确保每个推荐都有明确的学习目标

---

## 相关文档
- [IDENTITY.md](./IDENTITY.md) - 身份定义和核心职责
- [SOUL.md](./SOUL.md) - 核心价值观和行为准则
- [AGENTS.md](./AGENTS.md) - 工作流程和场景定义
- [USER.md](./USER.md) - 用户画像和协作方式
