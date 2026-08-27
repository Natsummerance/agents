# test-results — chart-taboo-principles

| id | type | 判定 | 说明 |
|---|---|---|---|
| tc-01 | should_trigger | PASS | 直接询问禁忌清单，命中核心触发 |
| tc-02 | should_trigger | PASS | 设计评审请求，对应逐项检查场景 |
| tc-03 | should_not_trigger | PASS | 图表选型，应转交 chart-type-selection-framework |
| tc-04 | should_not_trigger | PASS | 动画配置，非禁忌清单范围 |
| tc-05 | should_not_trigger | PASS | 扇区合并策略，应转交 chart-type-selection-framework |
| tc-06 | edge_case | PASS | 3D+渐变违规检测，联动 3d-pie-chart-trap |
| tc-07 | edge_case | PASS | 艺术性可视化例外，应走 B 段例外分支 |

通过率 7/7 (100%)

回炉记录：格式升级：旧格式工件补齐为 darwin 三件套