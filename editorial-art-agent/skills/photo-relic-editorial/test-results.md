# test-results — photo-relic-editorial

- 盲测方式: 纸面推演（trace）——对照本 SKILL.md 的 A2 语言信号与 B 边界逐条判定
- 蒸馏时间: 2026-08-25

| id | type | 判定 | 说明 |
|----|------|------|------|
| should-trigger-01 | should_trigger | PASS | "记忆版画"命中签名场景与语言信号，E1-E5 流程完整覆盖且建筑特征正确路由到 axis-diptych/horizon-cover 配方 |
| should-trigger-02 | should_trigger | PASS | "画廊系列封面+墨迹感+抖音竖版"命中 A2 场景2/3，Motion Cover Seed 配方被正确叠加 |
| should-not-trigger-01 | should_not_trigger | PASS | 点名 photo-abstract-editorial 的空间关系重建路线，A2 区分段判给兄弟 skill |
| should-not-trigger-02 | should_not_trigger | PASS | 无照片纯主题起稿违反本 skill 前提，判给 minimal-zine-poster |
| should-not-trigger-03 | should_not_trigger | PASS | 手撕纸+满铺插画是 gathered-scenes-zine 签名，与本 skill 遗存留白原则相反 |
| edge-01 | edge_case | PASS | "P 掉老房子换高楼"触发照片不可篡改硬约束：拒绝内容造假并给出实拍替代 |
| edge-02 | edge_case | PASS | 装饰元素+复古滤镜触发质量红线：拒绝破坏来源可追溯性 |

- 通过率: 7/7 (100%) ≥ minimum_pass_rate 0.95
- 回炉记录: 初版 test-prompts.json 为 5 条旧 category 格式、缺 minimum_pass_rate/source_project/expected_behavior 字段且无 edge 用例；已重写为 7 条 darwin 格式（trigger×2 + bait×3 含三个兄弟 slug 诱饵 + edge×2 照片篡改红线），SKILL.md 由 48 行半成品扩写至约百行：补遗存配方五轴、动效种子、prompt 编译契约、十项质量门清单与 E 段逐步完成标准。
