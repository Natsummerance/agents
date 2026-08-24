# 工程实践助手

> 基于 mattpocock/skills 构建的专业软件工程助手，融合 25 个原子化 skills。

## 🚀 快速启动

### 1. 初始化项目
```bash
# 在项目根目录运行
/setup-matt-pocock-skills
```
这将配置：
- 问题追踪器（GitHub / Linear / 本地文件）
- Triage 标签
- 文档保存位置

### 2. 开始使用

**需求澄清**：
```bash
/grill-with-docs    # 带文档的追问会话
/grill-me           # 纯追问会话（非代码类）
```

**规格说明**：
```bash
/to-spec            # 对话转规格说明
/to-tickets         # 规格说明转工单
```

**代码实现**：
```bash
/implement          # 实现工单（内部驱动 /tdd）
/tdd                # 测试驱动开发
```

**代码审查**：
```bash
/code-review        # 双轴代码审查
```

**架构改进**：
```bash
/improve-codebase-architecture  # 扫描架构债务
/wayfinder          # 大规模工作规划
```

## 📋 核心 Skills

### Engineering（18 个）
- **User-invoked**（9 个）：ask-matt, grill-with-docs, triage, improve-codebase-architecture, setup-matt-pocock-skills, to-spec, to-tickets, implement, wayfinder
- **Model-invoked**（9 个）：prototype, diagnosing-bugs, research, tdd, domain-modeling, codebase-design, code-review, resolving-merge-conflicts, wizard

### Productivity（7 个）
- **User-invoked**（5 个）：grill-me, handoff, teach, to-questionnaire, wait-what
- **Model-invoked**（2 个）：grilling, writing-for-agents

## 🎯 核心价值

**四大失败模式及解决方案**：
1. **沟通错位** → `grill-me`, `grill-with-docs` 强制追问
2. **冗余表达** → `domain-modeling`, `CONTEXT.md` 建立共享语言
3. **代码不工作** → `tdd`, `diagnosing-bugs` 提供反馈循环
4. **软件熵增** → `improve-codebase-architecture` 定期架构扫描

## 📚 相关文档

- [AGENT.md](./AGENT.md) - Agent 核心配置
- [IDENTITY.md](./IDENTITY.md) - 身份定义和核心职责
- [SOUL.md](./SOUL.md) - 核心价值观和行为准则
- [USER.md](./USER.md) - 用户画像和协作方式
- [TOOLS.md](./TOOLS.md) - 工具清单和使用规范
- [AGENTS.md](./AGENTS.md) - 工作流程和场景定义

## 🔗 来源

- **原始项目**: https://github.com/mattpocock/skills
- **作者**: Matt Pocock
- **许可证**: 遵循原项目许可证
