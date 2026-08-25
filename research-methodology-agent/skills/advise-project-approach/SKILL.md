---
name: advise-project-approach
description: |
  项目技术方案选型建议：在推荐技术栈/架构/供应商/重构或交付计划前，先核查真实约束、可比真实项目、取舍与失败条件、成本与锁定风险，并给出"推荐何时变错"。触发场景：构建前的 build plan 与选型（"该用 Postgres 还是 SQLite"、"有没有类似开源项目可参考"）、中途纠偏（"repo 越写越乱方向对吗"）、上线前审查、供应商 free tier/运营成本决策。不适用于：实现单个具体算法前查学术先行文献（走 arxiv-first-coding）、学术论文文本润色（走 academic-humanizer）、孤立的单 bug 修复或用户已锁定方向的窄问题（走窄路线简答）。
source_project: AaravKashyap12/advise-project-approach
tags: [project-planning, tech-stack, architecture-review, vendor-cost, course-correction]
---

# advise-project-approach（项目技术方案选型顾问）

## R (Reading) — 源项目核心设计

> "AI agents should not give project advice from vibes."
> "Every 'active' or 'maintained' claim needs an exact date or adoption signal... The recommendation includes what you gain, what you give up, what becomes harder later, and when it becomes wrong."
> "Do not outsource judgment to popularity. Never select or copy a stack because a repository has the most stars."

（来源：`README.md`、`skills/advise-project-approach/SKILL.md`）

## I (Interpretation) — 方法论骨架

核心洞察：好的项目建议是**可问责的答案**而非流畅的直觉。它把优秀工程师手工会做的研究循环自动化：理解目标→检查证据→研究可信可比项→评估取舍→推荐最高杠杆路径。

1. **九条不可协商协议**: 模糊 intake 即停（一次批量提问≤7 条）、仓库审查只读、不以流行度代替判断、先有收据再推荐、每个决定必须完整（约束契合+备选+取舍+何时变错+下一步）、证据足够即停、建议必须可证伪。
2. **三模式判定**: pre-build 策略 / mid-build 纠偏 / post-build 审查；只有口头描述时降级为"advisory from description"，绝不假装读过文件。
3. **窄路线优先**: 用户已固定方向只要 N 步/两选项对比时，保持请求的形状与数量作答，不浏览、不产出全报告骨架。
4. **证据纪律**: evidence ledger 五元组（claim/source/observed/support/limit）；时效信号必须带观测日期；价格区分"免费开始"与"便宜运营"。
5. **可比偏置控制**: 可比是证据不是投票；每个可比写明"什么可迁移/什么不可照抄"；星标多不等于适合你。
6. **能力先于抽象**: greenfield 计划第一步必须是端到端垂直切片（可观察的产品行为），服务层/目录结构抽取不得作为编号步骤。

## A1 (Past Application) — 源项目的典型应用

### 案例: 自托管书签管理器 pre-build 选型
- **输入**: "自托管书签管理器，solo dev，Python 背景，要标签和全文搜索"（上游 README demo 原题）。
- **做法**: 判定 pre-build 模式→研究 linkding/Linkwarden/LinkAce 三个可比+官方文档→按约束提取准则（技能匹配/部署简单性）→对比 Django+SQLite FTS5 vs Postgres FTS vs Node 栈→推荐 Django + FTS5/Postgres 全文检索 + 服务端渲染 HTMX/Turbo。
- **结果**: TL;DR 直达结论且贴合"Python 背景+自托管+单人"约束；每个可比标注维护信号与"什么不可照抄"；演示刻意不硬编码 star 数与"最新"日期——时效值要求 review 时现场核实。

## A2 (Future Trigger) ★ 触发场景

### 用户会在什么情境下需要
1. 构建前选型："我想做个 X 该怎么起步？用什么栈？有没有类似项目参考？"——需要约束分析+可比证据+build plan，避免第三个月才后悔的决定。
2. 中途纠偏："我的 Express API 写了一半越来越乱/这个 repo 方向对吗？"——需要检查现有证据、区分真问题和时髦修改、给按影响力排序的清单。
3. 成本与上线决策："Supabase 还是 Firebase？free tier 以后会不会坑我？""review 我这个即将上线的项目"——需要价格配额核查与成熟度差距分析。

### 语言信号
- "该用什么框架/数据库/技术栈，Postgres 还是 SQLite"
- "有没有类似的开源项目可以参考 / 先调研一下同类项目"
- "帮我看看这个项目方向对不对 / review 我的 repo / 上线前把把关"
- "free tier 够不够 / 会不会被 lock-in / 运营成本多少"
- "给我一个 build plan / 前几步该怎么走"

### 与兄弟 skill 的区分
- vs `arxiv-first-coding`: 实现某个**具体算法/机制前查学术先行工作**归 arxiv-first-coding——那是单机制文献决策；本 skill 是**项目级工程判断**——约束、可比、栈、供应商、成本、规划。用户问"这个算法有没有论文"去那边，问"我该项目怎么做"来这里。
- vs `academic-humanizer`: 论文/提案文本的表达润色完全出界，归 academic-humanizer；本 skill 只判断"做什么怎么做"，不动学术写作。

## E (Execution) — 可执行步骤

1. **模式判定与 intake 拦截** — 判定 pre/mid/post-build；两个以上决策关键事实缺失时发出一次批量提问（≤7 条）即结束本轮。完成标准: 模式有依据；要么约束齐备要么已提问且零臆造（不虚构目标用户/成功指标），用户说跳过则改为列可见假设。
2. **证据盘点** — 有 repo 则先 map 后按相关性采样（大仓库不盲读、不逐文件总结），无 repo 则以描述为准并列假设；只读边界：不装依赖、不跑测试/build、不碰 .env 类密钥文件。完成标准: 注明 inspected/sampled/skipped 范围；纯描述输入标注 "advisory from description"。
3. **可比研究建账** — 取 2~3 个直接/相邻可比+官方模板+价格页（社区源需用户 opt-in），逐条记 evidence ledger；时效数据带观测日期，拿不到就标 unverified。完成标准: 每个可比写明相关性与"什么可迁移/什么不可照抄"，无编造 star 数/日期/价格/采用声明。
4. **取舍比较** — 2~4 个方案对照决策准则（构建速度/维护/部署/成本/迁移风险），主推方案给出 gain/give up/harder later/when wrong 四件套，至少一个可信备选。完成标准: 推荐绑定本项目真实约束而非流行度；每个方案都有"何时变错"。
5. **推荐与实现证明** — 第一步必须是端到端垂直切片（含验收行为+最窄验证检查），升级信号写成可测阈值而非"复杂了再说"。完成标准: 步骤一交付可观察产品行为；escalation 是 workload 阈值/失败不变量类可判定条件。
6. **自查收尾** — 对照清单核验：基于真实约束？成本核实过？"active/maintained"带日期？没假装读过没读的文件？包含何时变错？完成标准: 自查逐项通过，无法满足处明确标 provisional。

## B (Boundary) — 不适用场景与局限

### 不适用场景（≥2条）
- 实现某个具体算法/机制前的学术先行文献检索 → 走 `arxiv-first-coding`（单机制文献决策 vs 本 skill 的项目级判断）。
- 学术论文/基金申请书的表达润色 → 走 `academic-humanizer`。
- 单个 bug 调试、孤立文件编辑、以及用户已锁定方向的有界窄问题（"给我前 3 步"/"这两个里选哪个"）→ 直接窄路线简答，不触发全流程报告。

### 已知局限 / 失败模式（≥1条真实的）
- **描述性输入天花板**: 只有口头描述时只能给 advisory 结论，文件级发现必须拿到 repo/code 后才有，越界假装审过即失败模式。
- 价格与维护信号随时间漂移：所有"active/免费/便宜"断言依赖观测日快照，页面不可得时只能列成本类别让用户自查。
- 社区信源（X/Reddit/YouTube）默认不用，未经 opt-in 会漏掉最新舆情但换来更低的噪音与更短的周期。
- 只读姿态意味着不验证"代码真的能跑"：运行类结论只能来自静态阅读+用户自己执行的验证计划。

## 相关 skills
- contrasts-with: arxiv-first-coding（项目级选型规划 vs 单算法先行文献检索；互设诱饵）
- contrasts-with: academic-humanizer（工程决策 vs 学术文本润色）

---

## 审计信息
- **验证**: V1 ✓ / V2 ✓ / V3 ✓
- **蒸馏时间**: 2026-08-25；**来源**: local `upstream/AaravKashyap12__advise-project-approach/` 下 `README.md`、`AGENTS.md`、`skills/advise-project-approach/SKILL.md`
