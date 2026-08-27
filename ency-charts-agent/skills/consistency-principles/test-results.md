# test-results — consistency-principles

| id | type | 判定 | 说明 |
|---|---|---|---|
| tc-01 | should_trigger | PASS | 直接询问多图表风格一致，命中核心触发 |
| tc-02 | should_trigger | PASS | Dashboard 色彩系统统一，对应 E 段执行步骤 |
| tc-03 | should_not_trigger | PASS | 视觉混乱，应转交 clarity-first-principles |
| tc-04 | should_not_trigger | PASS | 色板推荐，应转交 palette glossary 系列 |
| tc-05 | should_not_trigger | PASS | 简洁易读，应转交 clarity-first-principles |
| tc-06 | edge_case | PASS | 多品牌产品，应走 B 段不适用分支 |
| tc-07 | edge_case | PASS | 历史遗留重构，对应 B 段盲点给出渐进式建议 |

通过率 7/7 (100%)

回炉记录：格式升级：旧格式工件补齐为 darwin 三件套