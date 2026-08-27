# test-results — ai-iteration-check-principles

| id | type | 判定 | 说明 |
|---|---|---|---|
| tc-01 | should_trigger | PASS | 直接询问必检项，命中核心触发 |
| tc-02 | should_trigger | PASS | 代码审查请求，对应迭代检查场景 |
| tc-03 | should_not_trigger | PASS | 从零设计，非迭代检查场景 |
| tc-04 | should_not_trigger | PASS | Token 概念解释，应转交 design-token-architecture |
| tc-05 | should_not_trigger | PASS | 需求表达，应转交 ai-friendly-spec-framework |
| tc-06 | edge_case | PASS | 通过率<100%场景，应走 E 段步骤 7 强制返工 |
| tc-07 | edge_case | PASS | 人工代码审查，应走 B 段不适用分支 |

通过率 7/7 (100%)

回炉记录：格式升级：旧格式工件补齐为 darwin 三件套