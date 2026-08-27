# test-results — design-token-architecture

| id | type | 判定 | 说明 |
|---|---|---|---|
| tc-01 | should_trigger | PASS | 直接询问 Token 架构组织，命中核心触发 |
| tc-02 | should_trigger | PASS | 三层架构关系查询，命中关键知识点 |
| tc-03 | should_not_trigger | PASS | 单按钮调色，非架构咨询范围 |
| tc-04 | should_not_trigger | PASS | CSS 变量基础概念，不在范围内 |
| tc-05 | should_not_trigger | PASS | 品牌色具体值，应转交 seed-token-glossary |
| tc-06 | edge_case | PASS | 3+主题，应走 B 段不适用分支建议专用工具 |
| tc-07 | edge_case | PASS | 团队同步机制，对应 B 段盲点给出建议方案 |

通过率 7/7 (100%)

回炉记录：格式升级：旧格式工件补齐为 darwin 三件套