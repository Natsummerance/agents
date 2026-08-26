# test-results — lieflat-charts

- 盲测方式: 纸面推演（trace）——对照本 SKILL.md 的 A2 语言信号与 B 边界逐条判定
- 蒸馏时间: 2026-08-25

| id | type | 判定 | 说明 |
|----|------|------|------|
| should-trigger-01 | should_trigger | PASS | 「数据+公众号+编辑质感」命中 A2 场景与语言信号，走 Lupi 主力选型链并要求 ≥3 候选审计 |
| should-trigger-02 | should_trigger | PASS | 周报/dashboard/10 秒快读为 Glance 显式触发词，按 I-2 例外直接进 Glance 池，合规 |
| should-trigger-03 | should_trigger | PASS | 年报/白皮书/一页纸命中报告模式关键词；porcelain 匹配有序单序列，整页单一色系锁定成立 |
| should-not-trigger-01 | should_not_trigger | PASS | NeurIPS 投稿+PDF/SVG 导出是 scientific-figures 场景，B 段第一条正确让位（兄弟 slug 已标注） |
| should-not-trigger-02 | should_not_trigger | PASS | 地区字段不自动触发地图且用户已撤回地图诉求，Maps 显式触发规则覆盖 |
| edge-01 | edge_case | PASS | 「分析一下」无交付形式关键词，默认图表模式并提示可切换，符合 I-8 输出模式判定 |
| edge-02 | edge_case | PASS | OHLC 直取 F17 后备例外成立；断轴请求被诚实编码红线拒绝并给出三替代方案 |

- 通过率: 7/7 (100%)
- 回炉记录: 无
