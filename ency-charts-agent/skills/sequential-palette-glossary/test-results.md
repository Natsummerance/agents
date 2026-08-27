# test-results — sequential-palette-glossary

| id | type | 判定 | 说明 |
|---|---|---|---|
| tc-01 | should_trigger | PASS | 直接询问渐变色板选择，命中核心触发 |
| tc-02 | should_trigger | PASS | 热力图梯度规范，对应 E 段三步执行 |
| tc-03 | should_not_trigger | PASS | 类别区分，应转交 categorical-palette-glossary |
| tc-04 | should_not_trigger | PASS | 语义状态色，应转交 semantic-colors-glossary |
| tc-05 | should_trigger | PASS | 人口密度连续数据，推荐顺序色板 |
| tc-06 | edge_case | PASS | 7级不够用，走步骤 1 插值扩展并验证 |
| tc-07 | edge_case | PASS | 离散类别误用，应走 B 段不适用分支 |

通过率 7/7 (100%)

回炉记录：格式升级：旧格式工件补齐为 darwin 三件套