# test-results — semantic-colors-glossary

| id | type | 判定 | 说明 |
|---|---|---|---|
| tc-01 | should_trigger | PASS | 直接询问四态语义色，命中核心触发 |
| tc-02 | should_trigger | PASS | 信息色具体值查询，给出定义与场景 |
| tc-03 | should_not_trigger | PASS | 品牌色查询，应转交 seed-token-glossary |
| tc-04 | should_not_trigger | PASS | 分类色查询，应转交 categorical-palette-glossary |
| tc-05 | should_not_trigger | PASS | 增长/下降原则，应转交 semantic-coloring-principles |
| tc-06 | edge_case | PASS | 暗色模式对比度验证，走步骤 3 校验 |
| tc-07 | edge_case | PASS | 医疗行业专用标准，应走 B 段不适用分支 |

通过率 7/7 (100%)

回炉记录：格式升级：旧格式工件补齐为 darwin 三件套