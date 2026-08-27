# test-results — tooltip-missing-unit-trap

| id | type | 判定 | 说明 |
|---|---|---|---|
| tc-01 | should_trigger | PASS | 直接询问 Tooltip 单位，命中核心触发 |
| tc-02 | should_trigger | PASS | 单位缺失导致歧义，对应 E 段执行步骤 |
| tc-03 | should_not_trigger | PASS | 位置调整，非单位缺失范围 |
| tc-04 | should_not_trigger | PASS | 样式定制，非单位缺失范围 |
| tc-05 | should_trigger | PASS | Y轴标签单位，同类单位缺失问题 |
| tc-06 | edge_case | PASS | 纯计数数据例外，走 B 段例外分支建议加单位 |
| tc-07 | edge_case | PASS | 百分比数据例外，走 B 段例外分支验证含% |

通过率 7/7 (100%)

回炉记录：格式升级：旧格式工件补齐为 darwin 三件套