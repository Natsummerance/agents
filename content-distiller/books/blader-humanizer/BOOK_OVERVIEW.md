# BOOK_OVERVIEW.md - blader/humanizer 整书理解

> 基于 Adler 四步阅读法（结构/解释/批判/应用）建立全书骨架

## 📚 基本信息

- **书名**: Humanizer
- **作者**: Blader
- **类型**: Agent skill that removes signs of AI-generated writing from text
- **Stars**: 37,435+
- **核心定位**: 移除文本中的 AI 生成痕迹，让文本读起来像人写的

---

## 🔍 阶段 0: Adler 整书理解

### 1. 结构分析（这本书在谈什么？整体架构是什么？）

Humanizer 是一个**AI 文本去痕技能**，基于 Wikipedia 的"Signs of AI writing"模式列表（由 WikiProject AI Cleanup 维护），使用 35 个模式来识别和移除 AI 生成的文本特征。

#### 核心工作流程
```
Paste Text → First Rewrite → Critique → Final Rewrite
```

1. **First pass**: 不将原始结构视为固定，进行第一次重写
2. **Check against patterns**: 对照 35 个模式和原始声明检查草稿
3. **Rewrite what still needs work**: 重写仍需改进的部分

#### 35 个 AI 写作模式（按类别分组）

**类别 1: 夸大重要性和遗产（Patterns 1-6）**
- Pattern 1: Inflated importance and legacy
- Pattern 2: Name-dropping to prove importance
- Pattern 3: Shallow -ing analysis
- Pattern 4: Sales language
- Pattern 5: Vague sources
- Pattern 6: Formulaic challenges and outlook

**类别 2: 过度使用的 AI 词汇和句式（Patterns 7-13）**
- Pattern 7: Overused AI words
- Pattern 8: Avoiding is and are
- Pattern 9: Not X but Y and clipped endings
- Pattern 10: Forced groups of three
- Pattern 11: Changing names and repeated openings
- Pattern 12: False from X to Y ranges
- Pattern 13: Passive voice and missing subjects

**类别 3: 格式和排版问题（Patterns 14-19）**
- Pattern 14: Em/en dashes
- Pattern 15: Too much bold text
- Pattern 16: Lists with bold mini-headings
- Pattern 17: Title case in headings
- Pattern 18: Emojis
- Pattern 19: Curly quotes

**类别 4: 结构和逻辑问题（Patterns 26-35）**
- Pattern 26: Too many hyphenated word pairs
- Pattern 27: A fake deeper truth
- Pattern 28: Announcing the next point
- Pattern 29: A heading repeated below itself
- Pattern 30: Writing about the old version
- Pattern 31: Forced punchlines and fragments
- Pattern 32: Formulaic sayings
- Pattern 33: Fake-candid openings
- Pattern 34: Answering objections no one raised
- Pattern 35: Rejecting fake alternatives

**类别 5: Chatbot 特征（Patterns 20-22）**
- Pattern 20: Chatbot text left in the answer
- Pattern 21: Knowledge-limit disclaimers and guesses
- Pattern 22: Overly agreeable tone

**类别 6: 填充词和限定词（Patterns 23-25）**
- Pattern 23: Filler phrases
- Pattern 24: Too many qualifiers
- Pattern 25: Generic positive endings

#### 关键特性
1. **不编造事实**: 名称、数字、日期、引用、引文或其他事实细节必须来自源或作者
2. **保持作者风格**: 对于个人写作，Humanizer 保持作者的风格；技术参考文本保持中立和平淡
3. **显示工作过程**: 粘贴文本时，Humanizer 在给出最终版本之前显示其工作过程
4. **只修改散文**: 指向文件时，它只更改散文，保留代码、数据、frontmatter 和链接目标
5. **声音匹配**: 如果提供写作样本，Humanizer 遵循该样本而不是其默认样式规则

#### 使用方式
- `/humanizer` + 粘贴文本
- "Please humanize this text: [your text]"
- "Humanize the prose in docs/launch-post.md"
- 提供写作样本进行声音匹配

### 2. 解释（关键术语和论点是什么？）

#### 关键术语
- **Humanizer**: 移除 AI 生成痕迹的工具
- **35 Patterns**: 来自 Wikipedia 的"Signs of AI writing"模式列表
- **WikiProject AI Cleanup**: 维护模式列表的维基百科项目
- **Voice Matching**: 根据提供的写作样本匹配作者风格
- **First Rewrite + Critique**: 先重写再批评的流程

#### 核心论点
1. **LLMs use statistical algorithms**: LLMs 使用统计算法猜测接下来应该出现什么，结果倾向于最统计上可能的结果
2. **It does not make things up**: Humanizer 不编造事实，所有细节必须来自源或作者
3. **Shows its work**: Humanizer 在给出最终版本之前显示其工作过程
4. **Keeps writer's style**: 对于个人写作，保持作者的风格

### 3. 批判（作者的盲点、时代局限、逻辑漏洞是什么？）

#### 潜在盲点
1. **假设用户有明确的写作样本** - 但实际上用户可能没有现成的写作样本
2. **缺少系统性学习方法论** - 只是模式列表，没有提供如何系统学习识别 AI 痕迹的方法论
3. **缺少进度追踪机制** - 用户如何知道自己是否真正提升了识别能力？
4. **缺少反馈循环** - 如何验证去痕后的文本是否真的更像人写的？

#### 时代局限
1. **主要针对英文文本** - 虽然理论上适用于其他语言，但模式列表主要基于英文 AI 写作特征
2. **依赖 Wikipedia 的模式列表** - 模式列表可能过时或不全面

#### 逻辑漏洞
1. **"Human-sounding" 的主观性** - 对不同读者来说，什么样的文本像人写的可能不同
2. **缺少个性化适配** - 假设所有用户都希望同样的去痕效果
3. **可能过度简化** - 35 个模式可能无法覆盖所有 AI 写作特征

### 4. 应用（这本书的方法论可以应用到哪些场景？）

#### 适用场景
1. **AI 生成文本的后处理** - 移除 AI 痕迹，让文本更自然
2. **个人写作风格保护** - 保持作者的个人风格
3. **技术文档优化** - 让技术文档更中性和平淡
4. **内容创作辅助** - 帮助创作者避免 AI 写作特征

#### 不适用场景
1. **纯创意写作** - 可能需要保留某些 AI 特征
2. **学术写作** - 可能有特定的格式要求
3. **快速原型验证** - 可能不需要完整的去痕流程

---

## 🎯 候选方法论单元池（初步提取）

基于上述分析，初步提取以下候选单元：

### Frameworks（框架）
- **F1: Pattern-Based Detection**: 基于模式的 AI 痕迹检测（35 个模式）
- **F2: Two-Pass Rewriting**: 两遍重写流程（First Rewrite + Critique + Final Rewrite）
- **F3: Voice Matching**: 声音匹配（根据写作样本调整风格）

### Principles（原则）
- **P1: No Fabrication**: 不编造事实（所有细节必须来自源或作者）
- **P2: Show Your Work**: 显示工作过程（先展示再给最终版本）
- **P3: Preserve Style**: 保持作者风格（个人写作保持风格，技术文本保持中立）
- **P4: Prose-Only Changes**: 只修改散文（保留代码、数据、frontmatter 和链接目标）

### Anti-Patterns（反模式）
- **A1: No Systematic Methodology**: 缺乏系统性方法论，只是模式列表
- **A2: No Progress Tracking**: 缺少进度追踪机制
- **A3: Subjective "Human-Sounding"**: "像人写的"的主观性
- **A4: English-Centric Patterns**: 以英文为中心的模式列表

### Glossary（术语）
- **G1: Humanizer**
- **G2: 35 Patterns**
- **G3: Voice Matching**
- **G4: First Rewrite + Critique**
- **G5: WikiProject AI Cleanup**

---

*最后更新: 2026-08-24*
