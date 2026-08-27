# test-results — similar-color-confusion-trap

| id | type | 判定 | 说明 |
|---|---|---|---|
| tc-01 | should_trigger | PASS | 相邻色混淆核心场景，对应 E 段四步执行 |
| tc-02 | should_trigger | PASS | 颜色可区分性检查，走步骤 1/2/4 执行 |
| tc-03 | should_not_trigger | PASS | 色板推荐，应转交 categorical-palette-glossary |
| tc-04 | should_not_trigger | PASS | 深色模式适配，非相似色混淆范畴 |
| tc-05 | should_trigger | PASS | 红绿色盲验证，走步骤 2 Coblis 多模式检查 |
| tc-06 | edge_case | PASS | 单系列图表，应走 B 段例外分支 |
| tc-07 | edge_case | PASS | 语义色固定配色，应走 B 段例外但验证辅助编码 |

通过率 7/7 (100%)

回炉记录：格式升级：旧格式工件补齐为 darwin 三件套