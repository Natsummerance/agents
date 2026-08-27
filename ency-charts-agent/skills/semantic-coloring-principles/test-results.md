# test-results — semantic-coloring-principles

| id | type | 判定 | 说明 |
|---|---|---|---|
| tc-01 | should_trigger | PASS | 直接询问语义化配色处理，命中核心触发 |
| tc-02 | should_trigger | PASS | 增长/下降语义映射，对应步骤 1/3/4 执行 |
| tc-03 | should_not_trigger | PASS | 分类色板推荐，应转交 categorical-palette-glossary |
| tc-04 | should_not_trigger | PASS | 背景色设置，非语义色范围 |
| tc-05 | should_not_trigger | PASS | 具体色值查询，应转交 semantic-colors-glossary |
| tc-06 | edge_case | PASS | 多地区文化冲突，走文化适配分支+盲点建议 |
| tc-07 | edge_case | PASS | 暗色模式适配，对应 B 段盲点给出建议 |

通过率 7/7 (100%)

回炉记录：格式升级：旧格式工件补齐为 darwin 三件套