# schema-markup · test-results

- skill: schema-markup
- version: 1.1.0
- 推演日期: 2026-08-25
- 用例总数: 7

## 推演表

| id | type | 判定 | 说明 |
|---|---|---|---|
| schema-t1 | should_trigger | PASS | Product JSON-LD 生成命中核心场景，走六步流程 |
| schema-t2 | should_trigger | PASS | 验证器报错修复子场景，E2/E5 完成标准覆盖 |
| schema-t3 | should_trigger | PASS | 类型选型咨询触发判定步骤；AGENTS.md 约定"目的不明先问清" |
| schema-n1 | should_not_trigger | PASS | 整站审计按 A2 反向诱饵转 seo-audit；notes 已写明兄弟 slug |
| schema-n2 | should_not_trigger | PASS | AI 引用诉求转 geo-search-optimize；schema 仅是其子项 |
| schema-e1 | edge_case | PASS | 触发双重红线：拒绝伪造评分评论（内容-标记一致性）+ 拒绝排名保证 |
| schema-e2 | edge_case | PASS | FAQPage 时效预期纠正到位（2026-05-07 起无 Google 富结果收益） |

通过率: 7/7 (100%) ≥ minimum_pass_rate 0.95 → 达标

## 回炉记录

- 初稿 E6 写成"部署后确认富结果出现"→ 违反红线（展示由搜索引擎决定），改为交付复验步骤与预期形态、不承诺展示。
- 初稿未含弃用类型时效信息 → 从上游 README 补入 HowTo/ClaimReview 等退役清单与 FAQPage 日期，并新增 schema-e2 用例固化该边界。
- 初稿 A2 与 geo-search-optimize 的边界只有单向描述 → 补反向诱饵句（具体标记请求即使出现在审计对话中也归本 skill），完成双向互设。
