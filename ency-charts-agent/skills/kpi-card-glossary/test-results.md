# test-results — kpi-card-glossary

| id | type | 判定 | 说明 |
|---|---|---|---|
| tc-01 | should_trigger | PASS | 直接询问 KPI 卡片设计，命中核心触发 |
| tc-02 | should_trigger | PASS | 数字指标卡规范，对应 E 段四步执行 |
| tc-03 | should_not_trigger | PASS | 折线图制作，应转交 chart-type-selection-framework |
| tc-04 | should_not_trigger | PASS | 表格设计，非 KPI 卡片范围 |
| tc-05 | should_not_trigger | PASS | 趋势线配色，应转交 semantic-coloring-principles |
| tc-06 | edge_case | PASS | Micro Chart 可选性，走 E 段步骤 4 判断 |
| tc-07 | edge_case | PASS | 非关键指标，应走 B 段不适用分支 |

通过率 7/7 (100%)

回炉记录：格式升级：旧格式工件补齐为 darwin 三件套