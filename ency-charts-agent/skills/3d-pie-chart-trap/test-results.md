# test-results — 3d-pie-chart-trap

| id | type | 判定 | 说明 |
|---|---|---|---|
| tc-01 | should_trigger | PASS | 含"3D 效果/好看"关键词，命中触发条件 |
| tc-02 | should_trigger | PASS | 含"渐变填充/高级"关键词，命中触发条件 |
| tc-03 | should_not_trigger | PASS | 综合评审场景，应转交 chart-taboo-principles |
| tc-04 | should_not_trigger | PASS | Y 轴非零起点场景，应转交 y-axis-non-zero-trap |
| tc-05 | should_not_trigger | PASS | 折线图样式场景，非饼图类型不在边界内 |
| tc-06 | edge_case | PASS | 艺术/教育例外场景，应走 B 段例外分支 |
| tc-07 | edge_case | PASS | 合规配置复核场景，应执行 E 段步骤 1 并输出判定结论 |

通过率 7/7 (100%)

回炉记录：格式升级：旧格式工件补齐为 darwin 三件套