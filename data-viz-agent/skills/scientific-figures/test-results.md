# test-results — scientific-figures

- 盲测方式: 纸面推演（trace）——对照本 SKILL.md 的 A2 语言信号与 B 边界逐条判定
- 蒸馏时间: 2026-08-25

| id | type | 判定 | 说明 |
|----|------|------|------|
| should-trigger-01 | should_trigger | PASS | 论文定稿+publication-quality+双格式导出命中 A2 场景1，E 步骤链完整覆盖 |
| should-trigger-02 | should_trigger | PASS | 点名 figures4papers 同款风格命中 A2 场景2，蓝=主方法的语义配色角色正确映射 |
| should-not-trigger-01 | should_not_trigger | PASS | 公众号扁平风图表页是 lieflat-charts 的 A2 场景，B 段第一条正确让位（兄弟 slug 已标注） |
| should-not-trigger-02 | should_not_trigger | PASS | EDA-only 无出版目标在上游 When not to load 清单中显式排除 |
| should-not-trigger-03 | should_not_trigger | PASS | Plotly/交互式 dashboard 属非 matplotlib 工具链域外诱饵，B 段排除项覆盖 |
| edge-01 | edge_case | PASS | 无 LaTeX 环境时 use_tex 降级 mathtext，已知局限第一条的处置路径可执行 |
| edge-02 | edge_case | PASS | 灰度印刷触发 hatch/alpha 编码策略，与 I-2 打印安全设计一致 |

- 通过率: 7/7 (100%)
- 回炉记录: 无
