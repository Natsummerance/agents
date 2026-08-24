# DIGEST.md - Open Code Review 精华长文

> 基于 alibaba/open-code-review 蒸馏的核心方法论，不读全书、只看精华。

## 🎯 核心价值主张

Open Code Review (OCR) 是阿里巴巴集团内部孵化的 AI 驱动代码审查工具，经过大规模实战验证（服务数万名开发者，识别数百万代码缺陷），开源后迅速获得 21,246+ stars。其核心创新在于 **Deterministic Engineering × Agent Hybrid** 架构，解决了通用 Agent 在代码审查中的三大痛点。

---

## 🔥 通用 Agent 的三大痛点

### 1. Incomplete Coverage（不完整覆盖）
**现象**: 在大变更集上"偷工减料"，只审查部分文件而遗漏其他重要文件  
**根本原因**: 纯语言驱动架构缺乏对审查过程的硬约束  
**解决方案**: Precise file selection + Smart file bundling

### 2. Position Drift（位置漂移）
**现象**: 报告的问题与实际代码位置不匹配，行号或文件引用漂移  
**根本原因**: 缺乏独立的外部定位模块  
**解决方案**: External positioning module + Comment reflection

### 3. Unstable Quality（质量不稳定）
**现象**: 自然语言驱动的 Skills 难以调试，审查质量随提示微小变化而波动  
**根本原因**: 纯语言驱动缺乏稳定性保障  
**解决方案**: Fine-grained rule matching + Scenario-tuned prompts

---

## 💡 核心设计哲学：Deterministic Engineering × Agent Hybrid

### Deterministic Engineering（确定性工程）— 硬约束

对于**不能出错**的审查步骤，由**工程逻辑**而非语言模型保证正确性：

1. **Precise file selection**: 精确确定哪些文件需要审查、哪些应该过滤
2. **Smart file bundling**: 将相关文件分组为单个审查单元，支持并发
3. **Fine-grained rule matching**: 基于模板引擎的规则匹配，比纯语言驱动更稳定
4. **External positioning & reflection**: 独立的定位和反思模块提高准确性

### Agent（动态决策）— 灵活性

Agent 的优势集中在**动态决策**和**动态上下文检索**：

1. **Scenario-tuned prompts**: 深度优化的代码审查提示模板
2. **Scenario-tuned toolset**: 从生产数据分析中提炼的专用工具集

---

## 📊 性能对比

| 指标 | Open Code Review | 通用 Agent (Claude Code) | 优势 |
|------|------------------|--------------------------|------|
| **Precision** | 显著更高 | 较低 | ✅ 更少误报 |
| **F1** | 显著更高 | 较低 | ✅ 整体质量更好 |
| **Recall** | 较低 | 较高 | ⚠️ 有意权衡 |
| **Avg Token** | ~1/9 | 基准 | ✅ 成本更低 |
| **Avg Time** | 更快 | 较慢 | ✅ 效率更高 |

> 数据来源：AACR-Bench（50 个仓库、200 个 PR、10 种语言、1,505 个标注问题）

---

## 🛠️ 核心使用方法

### CLI 命令

```bash
# 工作区模式 — 审查所有 staged/unstaged/untracked 变更
ocr review

# 分支范围 — 审查 feature-branch 相对于 main 的变更
ocr review --from main --to feature-branch

# 单 commit 审查
ocr review --commit abc123

# 全文件扫描（无需 git 历史）
ocr scan
ocr scan --path internal/agent

# 委托模式（让编码 Agent 自行审查）
ocr delegate rule src/main.go
```

### 配置 LLM

```bash
ocr config provider    # 选择 provider
ocr config model       # 选择模型
```

---

## 🧠 可迁移的思维模型

### 1. Hard Constraints > Soft Prompts
对于不能出错的步骤，用**工程逻辑**建立硬约束，而不是依赖语言模型的软提示。

**应用场景**: 文件选择、规则匹配、位置定位

### 2. Divide-and-Conquer for Large Changesets
通过**智能文件捆绑**将大型变更集分解为独立的审查单元，实现分治和并发。

**应用场景**: 大 PR 审查、多文件重构

### 3. Template Engine > Language-Driven Rules
基于**模板引擎**的规则匹配比纯语言驱动更稳定、更可预测。

**应用场景**: 代码规范检查、安全规则匹配

### 4. Specialized Toolset > Generic Toolkit
从**生产数据**分析中提炼的专用工具集，比通用工具集更稳定可靠。

**应用场景**: 代码审查场景、静态分析场景

---

## ⚠️ 边界意识

### ✅ 适用场景
- CI/CD 流水线集成
- 大型代码库审查
- 多语言项目
- 不熟悉代码库的审计
- 团队协作标准化

### ❌ 不适用场景
- 纯艺术性代码
- 一次性脚本
- 非代码文件审查

---

## 📚 延伸阅读

- [官方文档](https://open-codereview.ai/docs)
- [AACR-Bench 数据集](https://huggingface.co/datasets/Alibaba-Aone/aacr-bench)
- [GitHub 仓库](https://github.com/alibaba/open-code-review)

---

*最后更新: 2026-08-24*
