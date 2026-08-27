# test-results — chart-type-selection-framework

| id | type | 判定 | 说明 |
|---|---|---|---|
| tc-01 | should_trigger | PASS | 离散类别对比，推荐柱状图并给参数 |
| tc-02 | should_trigger | PASS | 时间序列趋势，推荐折线图/面积图并给参数 |
| tc-03 | should_not_trigger | PASS | 颜色调整，应转交配色相关 skill |
| tc-04 | should_not_trigger | PASS | 基础概念查询，非选型决策范围 |
| tc-05 | should_not_trigger | PASS | Y轴起点问题，应转交 y-axis-non-zero-trap |
| tc-06 | edge_case | PASS | 10类别饼图，触发扇区>6约束推荐改柱状图 |
| tc-07 | edge_case | PASS | 组合图表，应走 B 段不适用分支 |

通过率 7/7 (100%)

回炉记录：格式升级：旧格式工件补齐为 darwin 三件套