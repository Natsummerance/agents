# GLOSSARY.md - Open Code Review 术语词典

> 基于 alibaba/open-code-review 蒸馏的核心术语定义，按字母顺序排列。

## D

### Deterministic Engineering（确定性工程）
由工程逻辑而非语言模型保证正确性的硬约束机制。适用于文件选择、规则匹配、位置定位等不能出错的步骤。

**相关 Skill**: [deterministic-engineering-hard-constraints](./deterministic-engineering-hard-constraints/SKILL.md)

## A

### Agent Hybrid（Agent 混合架构）
Agent 负责动态决策和动态上下文检索的架构模式。与确定性工程结合，形成 hybrid 架构。

**相关 Skill**: [agent-dynamic-decision-making](./agent-dynamic-decision-making/SKILL.md)

### AACR-Bench
真实代码审查基准数据集。包含 50 个开源仓库、200 个真实 PR、10 种编程语言、1,505 个标注的真实问题，由 80+ 高级工程师交叉验证。

## S

### Smart File Bundling（智能文件捆绑）
将相关文件分组为单个审查单元的策略。例如 message_en.properties 和 message_zh.properties 捆绑在一起，每个捆绑包作为独立子 Agent 运行。

**相关 Skill**: [divide-and-conquer-strategy](./divide-and-conquer-strategy/SKILL.md)

### Scenario-tuned Prompts（场景化提示模板）
深度优化的代码审查提示模板，提高效率并减少 token 消耗。

**相关 Skill**: [agent-dynamic-decision-making](./agent-dynamic-decision-making/SKILL.md)

### Scenario-tuned Toolset（场景化工具集）
从大规模生产数据的工具调用轨迹分析中提炼出的专用工具集，比通用 Agent 工具集更稳定可预测。

**相关 Skill**: [specialized-toolset-over-generic](./specialized-toolset-over-generic/SKILL.md)

## F

### Fine-grained Rule Matching（细粒度规则匹配）
基于模板引擎的文件特征匹配规则，比纯语言驱动更稳定可预测。

**相关 Skill**: [template-engine-over-language-driven](./template-engine-over-language-driven/SKILL.md)

## E

### External Positioning（外部定位）
独立的评论定位模块，基于 AST 解析和行号计算，提高位置准确性。

**相关 Skill**: [position-drift-anti-pattern](./position-drift-anti-pattern/SKILL.md)

## C

### Comment Reflection（评论反思）
独立的评论反思模块，二次验证内容准确性，提高 AI 反馈的质量。

## D

### Delegation Mode（委托模式）
让用户的编码 Agent 使用自己的 LLM 进行审查，无需 OCR API key。OCR 负责文件选择和规则解析。

---

*最后更新: 2026-08-24*
