# test-results — gathered-scenes-zine

- 盲测方式: 纸面推演（trace）——对照本 SKILL.md 的 A2 语言信号与 B 边界逐条判定
- 蒸馏时间: 2026-08-25

| id | type | 判定 | 说明 |
|----|------|------|------|
| should-trigger-01 | should_trigger | PASS | "拾景拼贴+插画延展"命中 A2 场景1/3，E1→E6 全链路激活且布局选型落在 expansive field 区间 |
| should-trigger-02 | should_trigger | PASS | "手撕纸 zine 质感"命中签名特征，撕边参数（1-4% 纤维带/35-70% 周长）按 I 段规范执行 |
| should-not-trigger-01 | should_not_trigger | PASS | 点名 photo-relic-editorial 且描述其留白遗存签名，A2 区分段判给兄弟 skill |
| should-not-trigger-02 | should_not_trigger | PASS | 无照片主题海报违反实景锚定前提，判给 minimal-zine-poster |
| should-not-trigger-03 | should_not_trigger | PASS | 均匀底板关系抽象无插画语法无撕纸，属 photo-abstract-editorial 路线 |
| edge-01 | edge_case | PASS | "每片叶子都要画清楚"触发压缩铁律：拒绝逐叶渲染，执行 85-95% 省略与块面合并 |
| edge-02 | edge_case | PASS | 换人群换天触发摄影锚区保真优先级：硬约束拒绝并给出插画区演绎替代 |

- 通过率: 7/7 (100%) ≥ minimum_pass_rate 0.95
- 回炉记录: 初版 test-prompts.json 为 5 条旧 category 格式、缺 minimum_pass_rate/source_project/expected_behavior 字段且仅 2 条跨技能诱饵；已重写为 7 条 darwin 格式（trigger×2 + bait×3 含三个兄弟 slug 诱饵 + edge×1 压缩铁律反向施压 + edge×1 篡改红线），SKILL.md 由 39 行半成品扩写至约百行：补抽象引擎五判、插画语法五型、密度标尺、移除测试、撕纸边参数、微文本系统与 E 段逐步完成标准。
