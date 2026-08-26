# test-results — photo-abstract-editorial

- 盲测方式: 纸面推演（trace）——对照本 SKILL.md 的 A2 语言信号与 B 边界逐条判定
- 蒸馏时间: 2026-08-25

| id | type | 判定 | 说明 |
|----|------|------|------|
| should-trigger-01 | should_trigger | PASS | "抽象双联画+空间骨架"命中 A2 场景1 与语言信号，七步工作流完整激活 |
| should-trigger-02 | should_trigger | PASS | "极简档案海报+最低限度结构线索"精确命中 A2 场景2 与核心原则的识别线索校准 |
| should-not-trigger-01 | should_not_trigger | PASS | 点名 photo-relic-editorial 且描述情绪温度墨迹，A2 区分段（关系重建 vs 墨迹记忆）判给兄弟 skill |
| should-not-trigger-02 | should_not_trigger | PASS | 撕纸插画场域是 gathered-scenes-zine 签名，本 skill 无插画语法无纹理 |
| should-not-trigger-03 | should_not_trigger | PASS | 无照片纯主题违反照片事实源前提，判给 minimal-zine-poster |
| edge-01 | edge_case | PASS | "重画成插画风+卡通小人"触发风格转移排除项与人物短竖线纪律：硬约束拒绝并解释区别 |
| edge-02 | edge_case | PASS | 装饰图形+渐变触发溯源红线与底板纪律：拒绝无出处元素，执行'宁可空不可编' |

- 通过率: 7/7 (100%) ≥ minimum_pass_rate 0.95
- 回炉记录: 初版 test-prompts.json 为 5 条旧 category 格式、缺 minimum_pass_rate/source_project/expected_behavior 字段且仅 2 条跨技能诱饵；已重写为 7 条 darwin 格式（trigger×2 + bait×3 含三个兄弟 slug 诱饵 + edge×2 风格转移/装饰编造红线），SKILL.md 由 41 行半成品扩写至约百行：补十一维空间事实清单、guardrails 全项、标记族纪律、标题规则与 E 段逐步完成标准。
