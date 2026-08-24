# DISTILLATION_PROTOCOL.md - 内容蒸馏严格协议

> **本文件定义了内容蒸馏的严格流程和不可妥协的质量红线。任何蒸馏任务必须严格遵守本协议，不得偷工减料。**

---

## 🎯 核心目标

将高价值内容（书籍、长视频、播客、课程）通过 RIA-TV++ 六阶段流水线，蒸馏成一组**原子化、可被 agent 在真实场景下调用的 skills**，并最终组装成**完整的 OpenClaw Agent**。

**成功标准**：
- 每个 skill 通过三重验证（V1 跨域/V2 预测力/V3 独特性）
- 每个 skill 有完整的 R/I/A1/A2/E/B 六段式结构
- 每个 skill 有 test-prompts.json（包含诱饵测试和跨 skill 混淆测试）
- 所有 skills 通过压力测试（通过率 5%-80%）
- Agent 名称为中文，与其他 agent 一致
- Agent 可以成功调用并返回正确的身份信息

---

## ⚠️ 不可妥协的质量红线（违反则立即停止）

### 红线 1：必须有源文本
- **规则**：没有源文本就不能开始蒸馏
- **执行**：如果用户没有提供 PDF/EPUB/TXT/转写稿路径，停下来问用户要
- **禁止**：凭记忆或网络搜索来蒸馏

### 红线 2：必须按阶段执行，不能跳过
- **规则**：必须严格按顺序执行阶段 0 → 1 → 1.5 → 2 → 3 → 4 → 5 → 6
- **执行**：每个阶段完成后更新 PIPELINE_STATE.md，记录当前进度
- **禁止**：跳过任何阶段或加快进度

### 红线 3：阶段 0 后必须用户确认
- **规则**：阶段 0（Adler 整书理解）完成后，必须问用户："骨架我理解对了吗？有没有你希望重点突出的方向？"
- **执行**：得到用户确认后再进入阶段 1
- **禁止**：跳过用户确认直接进入下一阶段

### 红线 4：阶段 1.5 后必须用户轻确认
- **规则**：阶段 1.5（三重验证筛选）完成后，必须展示入选名单和淘汰列表，问用户："这 N 个会做成 skill，有想捞回或砍掉的吗？"
- **执行**：得到用户确认后再进入阶段 2
- **禁止**：跳过用户轻确认直接进入下一阶段

### 红线 5：三重验证不能降低标准
- **规则**：每个候选单元必须通过全部三项验证
  - **V1 跨域**：书中至少 2 个独立段落有佐证（不同章节 + 不同对象 + 不同结论）
  - **V2 预测力**：能回答一个书里没明说的新问题
  - **V3 独特性**：不是任何聪明人都会说的常识（看内容本身是否反直觉，而不是措辞）
- **执行**：未通过的写入 rejected/ 并附原因
- **禁止**：V1 把同一例子换个说法算两处；V2 用书里讨论过的问题冒充"新问题"；V3 只要"说得比较文雅"就认为不是常识

### 红线 6：每个 skill 必须有完整的六段式结构
- **规则**：R/I/A1/A2/E/B 六段缺一不可
  - **R (Reading)**：原文引用 ≤150 字/段（英文 ≤100 词/段）
  - **I (Interpretation)**：用自己的话重写方法论骨架
  - **A1 (Past Application)**：书中作者用过的案例
  - **A2 (Future Trigger)**：用户在什么情境下会需要这个（含与相邻 skill 的区分初稿）
  - **E (Execution)**：1-2-3 可执行步骤（有完成标准和判停条件）
  - **B (Boundary)**：什么时候不适用 / 作者的盲点
- **执行**：缺少任何一段则回炉重做阶段 2
- **禁止**：表面修补，必须完整重写

### 红线 7：description 字段必须明确 trigger 条件
- **规则**：description 必须说明"何时调用 + 何时不调用 + 关键 trigger 信号"
- **执行**：好例："用户在纠结一个决策、列举正面理由却理不出头绪时；或在问'怎么做 X 才能成功'时。不适用于：纯信息查询、日常琐碎选择。"
- **禁止**：只是"一个关于 X 的 skill"

### 红线 8：每个 skill 必须有 test-prompts.json
- **规则**：包含 5-10 条测试 prompt，分为三类：
  - **应调用**：3-5 条，用户确实需要这个 skill 的场景
  - **不应调用（诱饵）**：2-3 条，用户不需要这个 skill 的场景（至少 1 条是同书兄弟 skill 的场景）
  - **边界模糊**：1-2 条，难以判断的场景
- **执行**：遵循 darwin-skill 兼容格式
- **禁止**：只设计"应调用"的测试，没有诱饵测试或跨 skill 混淆测试

### 红线 9：压力测试未过必须回炉重做
- **规则**：测试通过率 <5% 或 >80% 都要警惕并调整策略
- **执行**：未过的回炉重做阶段 2，不做"表面修补"
- **禁止**：修改测试用例来迎合失败的 skill

### 红线 10：Agent 组装必须完全符合规范
- **规则**：
  - Agent 名称必须为中文（与其他 agent 一致）
  - 必须同时修改 openclaw.json 中的 `name` 和 `identity.name`
  - 必须同时修改 AGENT.md 和 IDENTITY.md 中的 Name 字段
  - 必须添加到 main 和 content-distiller 的 subagents.allowAgents
  - 必须创建完整的运行时目录结构（agent/models.json + plugins/{nvidia,openai}/catalog.json + sessions/）
  - 必须重启 Gateway 并验证配置已加载
  - 必须测试子 agent 可以成功调用
- **执行**：逐项检查清单
- **禁止**：缺少任何一项就声称完成

### 红线 11：必须保留审计轨迹
- **规则**：candidates/ 和 rejected/ 都要保留，允许事后捞回
- **执行**：rejected/ 中的每个文件必须写明不通过的是哪一项、原因是什么
- **禁止**：删除 candidates/ 或 rejected/ 目录

### 红线 12：必须断点续跑
- **规则**：开始前先检查 books/<slug>/PIPELINE_STATE.md 是否存在
- **执行**：存在则读取并从记录的阶段续跑，不要从头重来
- **禁止**：中断后从头重来，浪费时间和 token

### 红线 13：阶段 5 必须安装 skills
- **规则**：询问用户安装位置（用户级 ~/.openclaw/skills/ 或项目级），把通过测试的 skill 复制或 symlink 过去
- **执行**：没有这一步，产出的 skill 无法被真正调用
- **禁止**：完成了所有阶段但没有安装 skills

### 红线 14：阶段 6 触发条件
- **规则**：用户明确要求"把这 N 个 skills 变成一个 agent"或类似表述时才进入阶段 6
- **执行**：否则只完成阶段 5 交付
- **禁止**：未经用户明确要求就自动进入阶段 6

---

## 📋 RIA-TV++ 六阶段流水线详解

### 阶段 0：Adler 整书理解
**输入**：源文本（PDF/EPUB/TXT/转写稿）  
**输出**：BOOK_OVERVIEW.md  
**模板**：skills/content-distillation/templates/BOOK_OVERVIEW.md.template  
**方法论**：skills/content-distillation/methodology/01-stage0-adler.md  

**执行步骤**：
1. 读取用户提供的书本文本（大文件分块阅读）
2. 执行 Adler 四步：
   - **结构分析**：这本书在谈什么？整体架构是什么？
   - **解释**：关键术语和论点是什么？
   - **批判**：作者的盲点、时代局限、逻辑漏洞是什么？
   - **应用**：这本书的方法论可以应用到哪些场景？
3. 按模板填充 BOOK_OVERVIEW.md
4. **用户确认**："骨架我理解对了吗？有没有你希望重点突出的方向？"

**检查清单**：
- [ ] 结构分析：全书骨架是否清晰？
- [ ] 解释：关键术语是否定义？
- [ ] 批判：作者盲点是否识别？
- [ ] 应用：方法论适用场景是否明确？
- [ ] 用户确认：是否得到用户对骨架的确认？

---

### 阶段 1：并行提取
**输入**：BOOK_OVERVIEW.md  
**输出**：candidates/<type>.md（4 个文件）  
**Extractor 位置**：skills/content-distillation/extractors/  

| Extractor | 文件 | 职责 |
|-----------|------|------|
| 框架提取器 | frameworks.md | 决策框架 / 思维模型 |
| 原则提取器 | principles.md | 原则 / 清单 / 规则 |
| 反例提取器 | counter-examples.md | 书中警告的失败模式 |
| 术语提取器 | glossary.md | 关键概念词典 |

**执行步骤**：
1. 并行 spawn 4 个 sub-agents（使用 sessions_spawn 工具）
2. 每个 sub-agent 独立读书、独立提取、独立输出到 candidates/<type>.md
3. 长文本按 methodology/02-stage1-parallel-extract.md 的分块策略处理
4. 降级方案：串行执行，产出格式不变

**检查清单**：
- [ ] 4 个 extractor 全部完成
- [ ] 每个候选单元有原文引用（≤150 字）
- [ ] 每个候选单元有 source_chapter 标注
- [ ] 边界模糊时宁可多提取，交给阶段 1.5 去重

**数量预期**：
- 方法论密集的书（如《穷查理宝典》）通过率约 30–50%
- 散文类书可能只有 5–10%
- 通过率过低 (<5%) 或过高 (>80%) 都要警惕

---

### 阶段 1.5：三重验证筛选
**输入**：candidates/<type>.md  
**输出**：verified.md + rejected/  
**方法论**：skills/content-distillation/methodology/03-stage1.5-triple-verify.md  

**验证标准**：
- **V1 跨域**：书中至少 2 个独立段落有佐证（不同章节 + 不同对象 + 不同结论）
- **V2 预测力**：能回答一个书里没明说的新问题
- **V3 独特性**：不是任何聪明人都会说的常识（看内容本身是否反直觉，而不是措辞）

**执行步骤**：
1. 对每个候选单元执行 V1/V2/V3 验证
2. 通过的写入 verified.md，附带判定理由
3. 未通过的写入 rejected/，附带不通过的原因
4. **用户轻确认**：展示入选名单和淘汰列表，问用户："这 N 个会做成 skill，有想捞回或砍掉的吗？"

**检查清单**：
- [ ] 每个候选单元都跑了 V1/V2/V3
- [ ] 通过的写入 verified.md，附带判定理由
- [ ] 未通过的写入 rejected/，附带不通过的原因
- [ ] 用户轻确认：是否得到用户确认？

---

### 阶段 2：RIA++ 构造 skill
**输入**：verified.md  
**输出**：每个 skill 的 SKILL.md  
**模板**：skills/content-distillation/templates/SKILL.md.template  
**方法论**：skills/content-distillation/methodology/04-stage2-ria-plus.md  

**六段式结构**：
- **R (Reading)**：原文引用 ≤150 字/段（英文 ≤100 词/段）
- **I (Interpretation)**：用自己的话重写方法论骨架
- **A1 (Past Application)**：书中作者用过的案例
- **A2 (Future Trigger)** ★：用户在什么情境下会需要这个（含与相邻 skill 的区分初稿）
- **E (Execution)**：1-2-3 可执行步骤（有完成标准和判停条件）
- **B (Boundary)**：什么时候不适用 / 作者的盲点

**YAML Frontmatter**：
```yaml
---
name: {{skill-slug}}
description: |
  {{何时调用 + 何时不调用 + 关键 trigger 信号, ≤300 字}}
source_book: 《{{BOOK_TITLE}}》 {{AUTHOR}}
source_chapter: {{章节}}
tags: [{{tag1}}, {{tag2}}]
related_skills: []    # 阶段 3 填充
---
```

**执行步骤**：
1. 为每个通过的单元创建 skill 目录
2. 按模板填充 SKILL.md
3. A2 中"与相邻 skill 的区分"此时只写初稿，阶段 3 回填定稿

**检查清单**：
- [ ] 每个 skill 有完整的 R/I/A1/A2/E/B 六段
- [ ] description 字段明确 trigger 条件（≤300 字）
- [ ] A2 中"与相邻 skill 的区分"写初稿
- [ ] 原文引用不超过限制

---

### 阶段 3：Zettelkasten 链接
**输入**：所有 SKILL.md  
**输出**：INDEX.md + GLOSSARY.md + 回填 related_skills  
**方法论**：skills/content-distillation/methodology/05-stage3-zettelkasten.md  
**模板**：skills/content-distillation/templates/INDEX.md.template  

**链接类型**：
- `depends-on`: A 依赖 B（必须先理解 B 才能用 A）
- `contrasts-with`: A 对比 B（两者解决类似问题但方法不同）
- `composes-with`: A 组合 B（两者可以一起使用）

**执行步骤**：
1. 找出 skill 之间的引用关系
2. 在每个 SKILL.md 末尾补"相关 skills"段，并回填 A2 的"与相邻 skill 的区分"为定稿
3. 生成 INDEX.md（含 mermaid 引用图）
4. 整理 GLOSSARY.md（所有 skill 的共享词典）

**检查清单**：
- [ ] 找出所有 skill 之间的引用关系
- [ ] 在每个 SKILL.md 末尾补"相关 skills"段
- [ ] 回填 A2 的"与相邻 skill 的区分"为定稿
- [ ] 生成 INDEX.md（含 mermaid 引用图）
- [ ] 整理 GLOSSARY.md

---

### 阶段 4：压力测试
**输入**：所有 SKILL.md  
**输出**：test-prompts.json + test-results.md  
**方法论**：skills/content-distillation/methodology/06-stage4-pressure-test.md  
**模板**：skills/content-distillation/templates/test-prompts.json.template  

**测试用例设计**：
- **应调用**：3-5 条，用户确实需要这个 skill 的场景
- **不应调用（诱饵）**：2-3 条，用户不需要这个 skill 的场景
  - 至少 1 条必须是"应触发同书另一个 skill"的场景（跨 skill 混淆测试）
- **边界模糊**：1-2 条，难以判断的场景

**执行步骤**：
1. 为每个 skill 设计 5-10 条测试 prompt
2. 优先用独立 sub-agent 盲测每条 prompt
3. 由主流程对照预期统计结果
4. 未过的回炉重做阶段 2（不做"表面修补"）
5. 每个 skill 的测试结果写入 <skill-dir>/test-results.md

**检查清单**：
- [ ] 每个 skill 有 5-10 条测试 prompt
- [ ] 包含诱饵测试（不应调用的场景）
- [ ] 至少 1 条是同书兄弟 skill 的场景
- [ ] 遵循 darwin-skill 兼容格式
- [ ] 未过的回炉重做阶段 2

---

### 阶段 5：交付
**输入**：所有通过测试的 skills  
**输出**：DIGEST.md + 安装到 skills 目录  
**方法论**：skills/content-distillation/methodology/07-stage5-deliver.md  
**模板**：skills/content-distillation/templates/DIGEST.md.template  

**执行步骤**：
1. 生成 DIGEST.md（面向读者的精华长文）
2. 询问用户安装位置（用户级 ~/.openclaw/skills/ 或项目级）
3. 把通过测试的 skill 复制或 symlink 过去
4. **可选**：询问用户是否需要将 skills 组装成完整 Agent（进入阶段 6）

**检查清单**：
- [ ] 生成 DIGEST.md（面向读者的精华长文）
- [ ] 询问用户安装位置
- [ ] 把通过测试的 skill 复制或 symlink 过去
- [ ] 可选：询问用户是否需要进入阶段 6

---

### 阶段 6：Agent 组装 ★
**触发条件**：用户明确要求"把这 N 个 skills 变成一个 agent"或类似表述

**输入**：BOOK_OVERVIEW.md + verified.md + 所有 skills  
**输出**：完整 OpenClaw Agent（AGENT.md + IDENTITY.md + SOUL.md + USER.md + TOOLS.md + README.md + 注册）  
**方法论**：skills/content-distillation/methodology/08-stage6-agent-assembly.md  
**模板**：skills/content-distillation/templates/AGENT_ASSEMBLY.md.template  

**执行步骤**：

#### 步骤 1：生成 Agent 元信息
从 BOOK_OVERVIEW.md 和 verified.md 提取：
- AGENT_NAME（中文名称，如"数据可视化设计助手"）
- AGENT_ID（kebab-case，如"ency-charts-agent"）
- DOMAIN、ROLE_DESCRIPTION、EXPERTISE_LIST、EMOJI

#### 步骤 2：生成核心文件
按模板填充以下文件：
- `AGENT.md` — Agent 核心配置
- `IDENTITY.md` — 身份定义
- `SOUL.md` — 行为准则
- `USER.md` — 用户画像
- `TOOLS.md` — 技术参考
- `README.md` — 快速启动指南

#### 步骤 3：复制 skills 和文档
```bash
cp -r books/<slug>/<skill-*> workspace/agents/<agent-slug>/skills/
cp books/<slug>/{INDEX.md,GLOSSARY.md,DIGEST.md} workspace/agents/<agent-slug>/docs/
```

#### 步骤 4：创建运行时目录
```bash
mkdir -p /root/.openclaw/agents/<agent-slug>/{agent/plugins/{nvidia,openai},sessions}
cp /root/.openclaw/agents/content-distiller/agent/models.json /root/.openclaw/agents/<agent-slug>/agent/
cp /root/.openclaw/agents/content-distiller/agent/plugins/nvidia/catalog.json /root/.openclaw/agents/<agent-slug>/agent/plugins/nvidia/
cp /root/.openclaw/agents/content-distiller/agent/plugins/openai/catalog.json /root/.openclaw/agents/<agent-slug>/agent/plugins/openai/
```

#### 步骤 5：注册到 openclaw.json
- 添加新 agent 配置（id/name/workspace/agentDir/model/identity）
- 添加到 main 和 content-distiller 的 subagents.allowAgents

#### 步骤 6：重启 Gateway 并验证
```bash
gateway action=restart note="注册新 agent: <AGENT_NAME>"
sleep 2
# 验证配置已加载
agents_list
```

#### 步骤 7：测试调用
```python
sessions_spawn(agentId="<AGENT_ID>", task="请自我介绍")
```

**质量检查清单**：
- [ ] 所有核心文件生成（AGENT.md/IDENTITY.md/SOUL.md/USER.md/TOOLS.md/README.md）
- [ ] 所有 skills 全部复制到 workspace
- [ ] 运行时目录结构正确（agent/ + sessions/）
- [ ] openclaw.json 中已注册
- [ ] 已添加到 main 和 content-distiller 的 allowAgents
- [ ] Gateway 已重启
- [ ] 子 agent 可以成功调用
- [ ] Agent 名称为中文（与其他 agent 一致）

**输出结构**：
```
/root/.openclaw/workspace/agents/<agent-slug>/
├── AGENT.md, IDENTITY.md, SOUL.md, USER.md, TOOLS.md, README.md
├── skills/ (N 个原子化 skills)
└── docs/ (INDEX.md, GLOSSARY.md, DIGEST.md)

/root/.openclaw/agents/<agent-slug>/
├── agent/models.json + plugins/{nvidia,openai}/catalog.json
└── sessions/
```

---

## 🔧 常见错误模式和解决方案

### 错误模式 1：没有源文本就开始
**问题**: 用户说"帮我拆《XXX》"，但没有提供文本  
**解决方案**: 停下来问用户提供文本文件路径（PDF / EPUB / TXT / 转写稿）

### 错误模式 2：跳过用户确认节点
**问题**: 阶段 0 或阶段 1.5 之后没有让用户确认，直接进入下一阶段  
**解决方案**: 
- 阶段 0 之后必须问："骨架我理解对了吗？有没有你希望重点突出的方向？"
- 阶段 1.5 之后必须问："这 N 个会做成 skill，有想捞回或砍掉的吗？"

### 错误模式 3：三重验证作弊
**问题**: V1 把同一例子换个说法算两处；V2 用书里讨论过的问题冒充"新问题"；V3 只要"说得比较文雅"就认为不是常识  
**解决方案**:
- V1：必须是不同章节 + 不同对象 + 不同结论
- V2：新问题应该让人第一眼不知道书里怎么说
- V3：看**内容**本身是否反直觉，而不是措辞

### 错误模式 4：description 字段不清晰
**问题**: description 只是"一个关于 X 的 skill"，没有明确 trigger 条件  
**解决方案**: 必须说明"何时调用 + 何时不调用 + 关键 trigger 信号"

### 错误模式 5：压力测试不充分
**问题**: 只设计了"应调用"的测试，没有诱饵测试或跨 skill 混淆测试  
**解决方案**: 至少包括 3 类：应调用 / 不应调用（诱饵）/ 边界模糊；诱饵中至少 1 条是跨 skill 混淆测试

### 错误模式 6：忽视审计轨迹
**问题**: 删除了 candidates/ 或 rejected/ 目录，无法追溯决策过程  
**解决方案**: candidates/ 和 rejected/ 都要保留；rejected/ 中的每个文件必须写明不通过的是哪一项、原因是什么

### 错误模式 7：没有安装到 skills 目录
**问题**: 完成了所有阶段，但没有把 skill 安装到 ~/.openclaw/skills/  
**解决方案**: 阶段 5 必须询问用户安装位置并实际安装

### 错误模式 8：忽视断点续跑
**问题**: 中断后从头重来，浪费时间和 token  
**解决方案**: 开始前先检查 books/<slug>/PIPELINE_STATE.md 是否存在；存在则读取并从记录的阶段续跑

### 错误模式 9：Agent 名称不是中文
**问题**: Agent 名称是英文，与其他 agent 不一致  
**解决方案**: Agent 名称必须为中文；必须同时修改 openclaw.json 中的 name 和 identity.name；必须同时修改 AGENT.md 和 IDENTITY.md 中的 Name 字段

### 错误模式 10：缺少运行时目录
**问题**: 没有创建 agent/models.json + plugins/ 目录  
**解决方案**: 必须创建完整的运行时目录结构；必须复制 models.json 和 plugins catalog

---

## 📝 附录：推荐起步内容

- **《影响力》** - 原则密集，适合初学者
- **《穷查理宝典》** - 框架丰富，经典案例
- **《认知红利》** - 现代思维模型，实用性强

**避免一开始选择**：
- 小说类（方法论较少）
- 纯理论著作（缺乏可执行步骤）
- 过时的内容（时代局限性大）

---

*最后更新: 2026-08-24*  
*基于 alibaba/open-code-review 蒸馏实践总结*
