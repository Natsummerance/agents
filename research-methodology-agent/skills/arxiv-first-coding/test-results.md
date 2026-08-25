# test-results — arxiv-first-coding

- 盲测方式: 纸面推演（trace）——对照本 SKILL.md 的 A2 语言信号、预检三问与 B 边界逐条判定
- 蒸馏时间: 2026-08-25

| id | type | 判定 | 说明 |
|----|------|------|------|
| should-trigger-01 | should_trigger | PASS | "实现之前查查有没有人做过"命中 A2 情境 1 与语言信号，三问全过，进入分类→抓取→隔离读→收敛全流程 |
| should-trigger-02 | should_trigger | PASS | "缓存失效+怕踩已知的坑"为机制级问题且架构级返工代价满足投入判据，触发 avoid 清单产出路径 |
| should-not-trigger-01 | should_not_trigger | PASS | SaaS 技术栈/供应商/预算是项目级选型，正确让位 advise-project-approach（兄弟诱饵生效） |
| should-not-trigger-02 | should_not_trigger | PASS | 审稿回复信去 AI 味属表达润色，转交 academic-humanizer（兄弟诱饵生效） |
| should-not-trigger-03 | should_not_trigger | PASS | "就照官方文档加表单/quick fix"命中预检第 3 问 closed phrasing，ABORT 直接实现，避免无谓成本 |
| edge-01 | edge_case | PASS | 显式调用按 Step 1 豁免预检；零命中时走反模式条款如实报告薄结果集而非凑数，两条边界均正确执行 |
| edge-02 | edge_case | PASS | 用户已点名具体论文=方法收敛，不重开全流程；但反幻觉纪律仍约束"确认靠不靠谱"类追问，不虚构未抓取内容 |

- 通过率: 7/7 (100%)
- 回炉记录: 初稿把"用户点名某篇论文照着实现"设为 should_trigger（以为查文献总有益）；复核预检三问后确认方法已收敛时应 ABORT，改判 edge_case 并补"半收敛状态下反幻觉纪律仍生效"的说明。另初稿 edge-01 仅测显式调用，复核后合并薄结果集分支以覆盖上游反模式条款，其余用例一次通过。
