---
name: academic-humanizer
description: |
  学术文本表达人味化润色：清理作者本人 AI 辅助起草的论文/学位论文/审稿回复/基金申请书（NSF Project Summary、NIH Specific Aims）中的机器痕迹（"In recent years..."开头、delve/paves the way、空洞强化词、超长从句、破折号），对齐主张与证据强度，匹配作者个人声音与目标 venue 语域；绝不改动任何数字、结果、公式或引用。触发场景："这段太像 AI 写的帮我改改"、"润色 abstract/introduction/rebuttal"、"改 specific aims 页"、"照我以前论文的风格调"。不适用于：查文献找先行研究（走 arxiv-first-coding）、项目技术方案选型（走 advise-project-approach）、博客营销文案去痕，以及任何代写、伪装投稿、规避 AI 披露的请求——一律拒绝。
source_project: AIScientists-Dev/academic-humanizer
tags: [academic-writing, ai-tells, claim-evidence, grant-proposal, voice-matching]
---

# academic-humanizer（学术文本去 AI 痕迹润色）

## R (Reading) — 源项目核心设计

> "This is an editing aid for clarity and voice... It does not generate findings, invent data, or change citations, and it is not designed to evade AI-use detection. Using it does not remove your obligation to disclose AI assistance."
> "Every claim earns its number, figure, or citation, and no verb is stronger than its evidence."

（来源：`README.md` "Ethics and disclosure"、`SKILL.md` Core principle）

## I (Interpretation) — 方法论骨架

核心洞察：学术写作本就有正确的人味——中立、精确、"we"自称、每个主张挂住证据。任务是 (1) 剥掉 AI 痕迹而不口语化，(2) 补上通用 humanizer 缺失的纪律。六层结构：

1. **Layer 1 通用 AI 痕迹目录**: 夸大意义、"-ing"假深度尾巴、宣传性词汇、delve/underscore/tapestry 类词表、系动词回避、三连排比填充、超长堆叠句拆分、em-dash 全部清除改写。
2. **Layer 2 学术专属痕迹**: 过度主张动词（prove→show empirically）、意义炒作语（paves the way/sheds light on）、空泛实验描述（extensive experiments→三个数据集点名）、novelty 填充、模板化开头、连接词连开、贡献清单套话、引用倾倒（[3,7,9,12]→点名最相关的一两篇并说为什么）、以模糊代替 hedging。
3. **Layer 3 必须保留**: 有证据支撑的 hedging（suggests/is consistent with）、合理被动语态、"we"自称、定义/符号/方法名原样——绝不发明、删除或改动任何数字、公式、引用。
4. **Layer 4 主张↔证据纪律**: 无证据指针的主张补指针或软化；动词强于证据则降级；模糊量级改为带归属的范围值（"2–6%"）。
5. **Layer 5 声音与 venue 匹配**: 读作者以往论文提取节奏/hedge 习惯后对齐；ICLR/NeurIPS 简练直接 vs Nature/PNAS 多铺垫。
6. **Layer 6 基金申请书模式**: NSF/NIH 靠愿景+可行性得分，不削平愿景，改查"claim↔feasibility"；首页五要素（hook/gap/central idea/aims/payoff）优先打磨；aim 平行独立非多米诺。

## A1 (Past Application) — 源项目的典型应用

### 案例: AI 起草的 proposal 开头段清理
- **输入**: *"In recent years, continual learning has attracted increasing attention... we propose a novel framework that leverages cutting-edge techniques to delve into these intricate problems, paving the way for a transformative paradigm that will revolutionize the field."*（上游 README Before 原文）
- **做法**: audit 先行列出全部痕迹（模板化开头/novelty 填充/delve/paves the way/空泛主张）→ 重写时剥痕迹并把空泛承诺替换为具体三线方案与验证领域 → 输出 change log 并确认数字引用未动。
- **结果**: *"Continual learning matters, but today's methods stay empirical and their principles are unclear. This proposal builds a principled framework on three fronts: adaptation, soft supervision, and cross-domain knowledge."* ——清晰、有主张-证据绑定、无一处事实变动。

## A2 (Future Trigger) ★ 触发场景

### 用户会在什么情境下需要
1. 投稿前清理自己 AI 辅助起草的论文段落："abstract/introduction 一股 ChatGPT 味，In recent years 开头、满篇 extensive experiments"——需要痕迹剥离+主张降级到证据水平。
2. 基金申请书打磨："帮我改 NIH specific aims 页/NSF summary，愿景留住但别虚"——激活 Layer 6：首页五要素、aim 可行性挂钩。
3. 声音匹配润色："这是我以前发的两篇 paper，照我的腔调把这份 rebuttal 改顺"——提供写作样本后的 Layer 5 对齐。

### 语言信号
- "太像 AI 写的了 / 去 AI 味 / ChatGPT 腔"
- "帮我润色 abstract / introduction / related work / rebuttal"
- "specific aims 页 / NSF summary / 基金申请书帮我改"
- "match my voice / 照着我以前的论文风格改"
- "paves the way / delve / extensive experiments 这些是不是该删"

### 与兄弟 skill 的区分
- vs `arxiv-first-coding`: 查文献、找先行研究、核实引用归属归它——本 skill 不检索、不加新内容、不产生新事实，只动作者已有稿子的**表达**。
- vs `advise-project-approach`: 项目该怎么做、选什么栈归它——本 skill 不谈工程决策，只管文本怎么写。
- vs 通用博客 humanizer: 学术语域里中立精确就是人味；不 casualize、不注入幽默个性、不追求"骗过检测器"，那是红线不是功能。

## E (Execution) — 可执行步骤

1. **定类与取证** — 判文档类型（paper/proposal/rebuttal）与目标 venue；读作者样本记录句法节奏、hedge 位置与习惯用语。完成标准: 类型+venue 写明；proposal 自动叠加 Layer 6 且保留应有愿景语言。
2. **先审后改** — 只列 audit 表：每处痕迹的位置+类型+拟改法，每个实证主张的证据状态，不动正文。完成标准: audit 覆盖全文且零编辑发生。
3. **六层重写** — 按 Layer 1/2 清痕迹、Layer 3 保学术惯例、Layer 4 对齐主张与证据、Layer 5 对齐声音；结构与段落对应关系不变（原文五段改后仍五段）。完成标准: 每个数字/公式/引用原样保留；em-dash 归零、超长句已拆、合法 hedging 未被误升格。
4. **Proposal 分支校验**（仅基金申请）— 核首页五要素齐备、NSF 三头自足/NIH Specific Aims 五段弧完整、aims 平行且有 fallback、每个愿景主张旁有可行性证据（preliminary data/先前发表/经典定理/合作者）。完成标准: 零"method-as-aim"、零多米诺式未兜底依赖、零编造的资助/数据/伙伴。
5. **变更报告** — 输出清理文本 + change log（痕迹类型统计、被软化或补指针的主张清单、声音备注）。完成标准: 含"未改动任何数字、公式或引用"确认句，覆盖面与原文一致无漏段。
6. **披露提醒** — 提醒使用者遵守目标期刊/会议/资助机构的 AI 使用披露政策。完成标准: 回复末尾含披露义务提示，且本次会话无任何规避检测类请求被执行。

## B (Boundary) — 不适用场景与局限

### 特别红线（优先级最高）
- **仅用于改进作者本人论文/提案的表达质量**：输入必须是使用者自己的稿件，禁止替他人代写论文、申请书或审稿意见。
- **必须遵守目标期刊/会议/资助机构的 AI 使用披露政策**：本 skill 不是检测规避工具，不提供"让 AI 文本过检"的服务。
- **禁止学术欺诈**：不得伪造数据、虚构引用、制造虚假新颖性、或将 AI 生成内容伪装成纯人写作品提交。遇到此类请求应拒绝并解释披露义务，而非执行。
- **只动表达不动事实**：数字、结果、公式、引用永不修改；发现主张与正文证据矛盾时标记给作者而非悄悄改数据。

### 不适用场景（≥2条）
- 博客、营销文案、个人随笔的去 AI 味 → 用通用 humanizer；本 skill 的学术规则会把必要的精确性与正式语域一并磨平。
- 查文献/补相关工作/生成新内容或新主张 → 走 arxiv-first-coding 等；本 skill 是编辑环节不是研究或写作环节，不产出任何新事实。
- 项目技术方案建议 → 走 advise-project-approach。

### 已知局限 / 失败模式（≥1条真实的）
- **声音校准依赖样本**: 六层规则源自一个团队的语音校准，他人 fork 后需用自己的既往论文重调，否则只是"通用干净"而非"你的声音"。
- NSF/NIH 结构提炼的是稳定骨架；页限/格式/截止日期等约束性要求必须查官方 PAPPG 与 NIH 指南现行版本，内置结构不构成合规依据。
- 表达层对齐无法验证实验真实性——把 "prove" 降为 "show" 不能替代数据层的诚实核查。

## 相关 skills
- contrasts-with: arxiv-first-coding（文本表达润色 vs 文献检索消化；互设诱饵）
- contrasts-with: advise-project-approach（学术文本编辑 vs 项目工程决策）

---

## 审计信息
- **验证**: V1 ✓ / V2 ✓ / V3 ✓
- **蒸馏时间**: 2026-08-25；**来源**: local `vendor/AIScientists-Dev__academic-humanizer/` 下 `README.md`、`SKILL.md`
