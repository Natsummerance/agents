# test-results — scientific-figures

- 盲测方式: 纸面推演（trace）——对照本 SKILL.md 的 A2 语言信号与 B 边界逐条判定
- 蒸馏时间: 2026-08-25

| id | type | 判定 | 说明 |
|----|------|------|------|
| should-trigger-01 | should_trigger | PASS | 论文投稿+出版质量+png/pdf 双格式命中 A2 场景 1，走大面板档 rcParams 与 E-6 导出政策 |
| should-trigger-02 | should_trigger | PASS | 点名 figure_VIGIL 风格复用是上游 SKILL.md 明示触发条件；make_trend 纪律（2–4 线、fill_between）适用 |
| should-not-trigger-01 | should_not_trigger | PASS | 公众号扁平 HTML 图表场景正确让位给 lieflat-charts（兄弟 slug 已在 notes 标注） |
| should-not-trigger-02 | should_not_trigger | PASS | 无发表目标的 EDA 属上游明确排除项，不背上出版规范 |
| should-not-trigger-03 | should_not_trigger | PASS | Plotly 交互式 dashboard 双重越界（工具链+场景），B 段边界覆盖并可指路兄弟 skill |
| edge-01 | edge_case | PASS | TeX 缺失时回退 mathtext 并告知差异，符合 B 段已知局限的诚实降级要求 |
| edge-02 | edge_case | PASS | 密集柱面 dpi=600 + 黑描边/alpha/hatch 打印安全编码组合成立，有 ImmunoStruct 先例支撑 |

- 通过率: 7/7 (100%)
- 回炉记录: 无
