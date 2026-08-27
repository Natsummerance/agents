# test-results — clarity-first-principles

| id | type | 判定 | 说明 |
|---|---|---|---|
| tc-01 | should_trigger | PASS | 直接询问清晰易读方法，命中核心触发 |
| tc-02 | should_trigger | PASS | 信息简化请求，对应 E 段执行步骤 |
| tc-03 | should_not_trigger | PASS | 字体统一，应转交 consistency-principles |
| tc-04 | should_not_trigger | PASS | Tooltip 配置，非核心范围 |
| tc-05 | should_not_trigger | PASS | 跨图表风格一致，应转交 consistency-principles |
| tc-06 | edge_case | PASS | 暗色模式对比度，走步骤 1 检查并调整 |
| tc-07 | edge_case | PASS | 艺术性可视化，应走 B 段不适用分支 |

通过率 7/7 (100%)

回炉记录：格式升级：旧格式工件补齐为 darwin 三件套