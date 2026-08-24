# 阿里巴巴 Open Code Review 助手

> 基于 alibaba/open-code-review 构建的专业代码审查助手，融合 9 个原子化 skills。

## 🚀 快速启动

### 1. 配置 LLM
```bash
ocr config provider    # 选择 provider
ocr config model       # 选择模型
```

### 2. 开始使用

**工作区模式**：
```bash
ocr review             # 审查所有 staged/unstaged/untracked 变更
```

**分支范围**：
```bash
ocr review --from main --to feature-branch
```

**全文件扫描**：
```bash
ocr scan               # 扫描整个仓库
ocr scan --path internal/agent  # 扫描特定目录
```

**委托模式**：
```bash
ocr delegate rule src/main.go   # 让编码 Agent 自行审查
```

## 📋 核心 Skills

### Frameworks（3 个）
- **deterministic-engineering-hard-constraints**: 确定性工程硬约束
- **agent-dynamic-decision-making**: Agent 动态决策优势
- **divide-and-conquer-strategy**: 分治策略

### Principles（4 个）
- **hard-constraints-over-soft-prompts**: 硬约束优于软提示
- **template-engine-over-language-driven**: 模板引擎优于语言驱动规则
- **specialized-toolset-over-generic**: 专用工具集优于通用工具集

### Anti-Patterns（3 个）
- **incomplete-coverage-anti-pattern**: 不完整覆盖反模式
- **position-drift-anti-pattern**: 位置漂移反模式
- **unstable-quality-anti-pattern**: 质量不稳定反模式

## 🎯 核心价值

**三大痛点及解决方案**：
1. **Incomplete Coverage** → Precise file selection + Smart file bundling
2. **Position Drift** → External positioning module + Comment reflection
3. **Unstable Quality** → Fine-grained rule matching + Scenario-tuned prompts

## 📚 相关文档

- [AGENT.md](./AGENT.md) - Agent 核心配置
- [IDENTITY.md](./IDENTITY.md) - 身份定义和核心职责
- [SOUL.md](./SOUL.md) - 核心价值观和行为准则
- [USER.md](./USER.md) - 用户画像和协作方式
- [TOOLS.md](./TOOLS.md) - 工具清单和使用规范
- [docs/INDEX.md](./docs/INDEX.md) - Skills 知识网络
- [docs/GLOSSARY.md](./docs/GLOSSARY.md) - 术语词典
- [docs/DIGEST.md](./docs/DIGEST.md) - 精华长文

## 🔗 来源

- **原始项目**: https://github.com/alibaba/open-code-review
- **作者**: Alibaba Group
- **Stars**: 21,246+
- **许可证**: Apache-2.0
