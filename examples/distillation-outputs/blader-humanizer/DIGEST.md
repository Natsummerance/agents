# DIGEST.md - blader/humanizer 精华长文

> 基于 RIA-TV++ 流水线蒸馏的 11 个原子化 skills，满足"不读全书、只看精华"的需求

## 📚 项目概览

**Humanizer** 是一个拥有 37,435+ stars 的 Agent skill，用于移除文本中的 AI 生成痕迹。它基于 Wikipedia 的"Signs of AI writing"模式列表（由 WikiProject AI Cleanup 维护），使用 35 个模式来系统化识别和移除 AI 写作特征。

**核心价值**：让 AI 生成的文本读起来像人写的，同时保持事实准确性和作者风格。

---

## 🎯 核心方法论

### 1. 基于模式的 AI 痕迹检测（Pattern-Based Detection）

Humanizer 使用 35 个来自 Wikipedia 的模式来识别 AI 痕迹，这些模式分为 6 个类别：
- **夸大重要性和遗产**（Patterns 1-6）：如"Inflated importance and legacy"
- **过度使用的 AI 词汇**（Patterns 7-13）：如"Overused AI words"
- **格式和排版问题**（Patterns 14-19）：如"Em/en dashes"
- **结构和逻辑问题**（Patterns 26-35）：如"Forced groups of three"
- **Chatbot 特征**（Patterns 20-22）：如"Chatbot text left in the answer"
- **填充词和限定词**（Patterns 23-25）：如"Filler phrases"

这种基于模式的检测方法确保了系统化和标准化的 AI 痕迹识别。

### 2. 两遍重写流程（Two-Pass Rewriting）

Humanizer 的工作流程是：
1. **First Pass**: 第一次重写，不将原始结构视为固定
2. **Check Against Patterns**: 对照 35 个模式和原始声明检查草稿
3. **Critique**: 对仍听起来人工的内容进行简短批评
4. **Final Rewrite**: 重写仍需改进的部分

这种"先重写再批评"的流程确保最终输出质量，同时让用户看到工作过程。

### 3. 声音匹配（Voice Matching）

如果提供写作样本，Humanizer 遵循该样本的节奏、用词、标点和刻意怪癖，而不是其默认样式规则。这种"声音匹配"功能让去痕后的文本更贴近作者的真实风格。

---

## ⚠️ 四大反模式警示

### 1. 缺乏系统性方法论（No Systematic Methodology）

Humanizer 只提供了 35 个模式列表，但没有提供系统性的学习方法论。用户可能安装了技能，但仍然不知道如何系统地提升识别 AI 痕迹的能力或选择下一个要学习的模式。

**解决方案**：建立基于 6 个模式类别的学习路径，为每个类别设定明确的学习目标，建立模式之间的依赖关系。

### 2. 缺少进度追踪（No Progress Tracking）

Humanizer 没有提供任何机制来追踪用户的进度或验证去痕后的文本是否真的更像人写的。用户可能完成了多次去痕，但不知道自己是否真的进步了。

**解决方案**：为每个模式设定明确的学习目标，记录已完成的模式练习，定期回顾并评估是否真正掌握了该类别的模式。

### 3. "像人写的"的主观性（Subjective "Human-Sounding"）

Humanizer 假设"像人写的"有一个统一标准，但实际上不同读者对什么样的文本像人写的可能有不同看法。这种主观性可能导致去痕效果不符合某些用户的期望。

**解决方案**：明确目标读者，寻求多方反馈，建立客观评估指标（如句子长度变化、词汇多样性等）。

### 4. 以英文为中心的模式列表（English-Centric Patterns）

Humanizer 的 35 个模式主要来自 Wikipedia 的英文"Signs of AI writing"页面，可能不适用于其他语言的 AI 写作特征。这种"以英文为中心"的设计限制了其在多语言环境中的适用性。

**解决方案**：识别文本的语言类型，评估当前模式列表是否适用于该语言，寻找针对该语言的特定 AI 写作特征研究。

---

## 🔧 四大核心原则

### 1. 不编造事实（No Fabrication）

Humanizer 不编造事实，所有名称、数字、日期、引用、引文或其他事实细节必须来自源或作者。如果缺失，应该询问而不是编造。

### 2. 显示工作过程（Show Your Work）

Humanizer 在给出最终版本之前显示其工作过程，让用户看到第一次重写和对仍听起来人工的内容的简短批评。这种"透明化"流程让用户理解去痕的逻辑。

### 3. 保持作者风格（Preserve Style）

对于个人写作，Humanizer 保持作者的风格；技术参考文本保持中立和平淡。如果提供写作样本，遵循该样本而不是默认样式规则。

### 4. 只修改散文（Prose-Only Changes）

指向文件时，Humanizer 只更改散文，保留代码、数据、frontmatter 和链接目标。这种"精准修改"原则确保不会意外破坏文件的结构或功能。

---

## 🎓 完整去痕工作流程

```
DETECT (pattern-based-detection) → 
REWRITE (two-pass-rewriting) → 
MATCH STYLE (voice-matching / preserve-style) → 
VERIFY (no-fabrication + show-your-work) → 
SAFE OUTPUT (prose-only-changes)
```

1. **检测阶段**：使用 35 个模式识别 AI 痕迹
2. **重写阶段**：两遍重写流程确保质量
3. **风格匹配**：根据文本类型或个人样本调整风格
4. **验证阶段**：确保事实准确性和透明化
5. **安全输出**：只修改散文，保留其他内容

---

## 📖 使用建议

### 新手入门
1. 从 `pattern-based-detection` 开始，学习如何识别 AI 痕迹
2. 进入 `two-pass-rewriting`，学习去痕的完整流程
3. 掌握 `voice-matching`，学习如何匹配作者风格
4. 了解 `no-fabrication` 和 `show-your-work`，确保事实准确性和透明化
5. 阅读反模式警示，识别 humanizer 的盲点

### 进阶提升
1. 建立系统性的学习路径，避免随机应用模式
2. 记录学习进度，量化自己的识别能力提升
3. 明确目标读者，处理"像人写的"的主观性问题
4. 考虑多语言需求，评估模式列表的适用性

---

*最后更新: 2026-08-24*
*来源: https://github.com/blader/humanizer*
