# GLOSSARY.md - addyosmani/agent-skills 术语词典

> 整理自 candidates/glossary.md，包含所有 skill 的共享术语

## 📚 核心术语

### Skills（技能）
**定义**: 编码高级工程师使用的工作流、质量门禁和最佳实践，打包成 AI agents 可以一致遵循的格式。

**原文引用**:
> "Skills encode the workflows, quality gates, and best practices that senior engineers use when building software."

**相关技能**: 所有 skills

---

### Slash Commands（斜杠命令）
**定义**: 映射到开发生命周期的 8 个命令，每个命令自动激活相关的技能。

**原文引用**:
> "8 slash commands that map to the development lifecycle. Each one activates the right skills automatically."

**相关技能**: /spec, /plan, /build, /test, /review, /webperf, /code-simplify, /ship

---

### Quality Gates（质量门禁）
**定义**: 在开发流程的关键节点设置的质量检查点，确保代码符合标准才能进入下一阶段。

**原文引用**:
> "Skills encode the workflows, quality gates, and best practices..."

**相关技能**: /review, /test

---

### Test-driven（测试驱动）
**定义**: 每个任务都是测试驱动的，遵循 RED-GREEN-REFACTOR 循环。

**原文引用**:
> "every task is still test-driven and committed individually"

**相关技能**: /test, test-driven-development

---

### Auto-build（自动构建）
**定义**: 生成计划并一次性实现所有任务的模式，用户只需批准一次计划，然后自主运行。

**原文引用**:
> "**`/build auto`** generates the plan and implements every task in a single approved pass"

**相关技能**: /build auto

---

### Spec before code（规格先行）
**定义**: 在写代码之前先定义规格说明，确保需求明确化。

**原文引用**:
> "/spec | Define what to build | Spec before code"

**相关技能**: spec-driven-development

---

### Tests are proof（测试是证明）
**定义**: 测试作为证据，证明代码按预期工作，不是可选的。

**原文引用**:
> "/test | Prove it works | Tests are proof"

**相关技能**: test-driven-development

---

### Faster is safer（更快更安全）
**定义**: 快速部署到生产环境比长期分支更安全，小步快跑降低风险。

**原文引用**:
> "/ship | Ship to production | Faster is safer"

**相关技能**: faster-is-safer

---

*最后更新: 2026-08-24*
