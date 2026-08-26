# test-results — minimal-zine-poster

- 盲测方式: 纸面推演（trace）——对照本 SKILL.md 的 A2 语言信号与 B 边界逐条判定
- 蒸馏时间: 2026-08-25

| id | type | 判定 | 说明 |
|----|------|------|------|
| should-trigger-01 | should_trigger | PASS | "主题+Zine 海报"命中 A2 场景1 与语言信号"做一张海报"，走 Generate Mode E1→E6 |
| should-trigger-02 | should_trigger | PASS | "分析参考图提炼规则+先不生成"精确命中 Reference Analysis Mode 的输出契约与 Prompt-only 边界 |
| should-not-trigger-01 | should_not_trigger | PASS | 点名 photo-relic-editorial 且描述其签名双段构图，A2 区分段判给兄弟 skill |
| should-not-trigger-02 | should_not_trigger | PASS | 数据图表属 B 段明确排除项，无视觉隐喻语义 |
| should-not-trigger-03 | should_not_trigger | PASS | 手撕纸拼贴是 gathered-scenes-zine 的签名特征，判给对应 skill |
| edge-01 | edge_case | PASS | "照抄文字 logo 构图"触发内容边界：拒绝复制源品牌与构图，只学语法并换新主体 |
| edge-02 | edge_case | PASS | 60 字长文案触发已知局限：如实告知模型长文本失真，给缩句/后期叠加替代 |

- 通过率: 7/7 (100%) ≥ minimum_pass_rate 0.95
- 回炉记录: 初版 test-prompts.json 为 5 条旧 category 格式、缺 minimum_pass_rate/source_project/expected_behavior 字段且仅 1 条跨技能诱饵；已重写为 7 条 darwin 格式（trigger×2 + bait×3 含两个兄弟 slug 诱饵 + edge×2 版权与能力边界），SKILL.md 由 43 行半成品扩写至约百行：补 prompt 编译字段序、四段式形状、变化配方七轴、E 段逐步完成标准与 A2 四角区分互设诱饵。
