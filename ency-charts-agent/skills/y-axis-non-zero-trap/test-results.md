# test-results — y-axis-non-zero-trap

| id | type | 判定 | 说明 |
|---|---|---|---|
| tc-01 | should_trigger | PASS | 直接询问 Y 轴零点，命中核心触发 |
| tc-02 | should_trigger | PASS | 柱状图非零起点误导，对应 E 段四步执行 |
| tc-03 | should_not_trigger | PASS | X轴刻度设置，非 Y 轴陷阱范围 |
| tc-04 | should_not_trigger | PASS | 隐藏 Y 轴，非陷阱范围 |
| tc-05 | should_trigger | PASS | 折线图非零起点例外，走 B 段例外分支 |
| tc-06 | edge_case | PASS | 对数坐标轴例外，走 B 段例外分支 |
| tc-07 | edge_case | PASS | 面积图参照折线图，给出谨慎建议 |

通过率 7/7 (100%)

回炉记录：格式升级：旧格式工件补齐为 darwin 三件套