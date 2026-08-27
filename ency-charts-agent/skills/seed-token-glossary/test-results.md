# test-results — seed-token-glossary

| id | type | 判定 | 说明 |
|---|---|---|---|
| tc-01 | should_trigger | PASS | 直接询问 Seed Token 定义，命中核心触发 |
| tc-02 | should_trigger | PASS | 基础色值定义，对应 E 段三步执行 |
| tc-03 | should_not_trigger | PASS | 组件圆角设置，应转交 design-token-architecture |
| tc-04 | should_not_trigger | PASS | 错误状态色，应转交 semantic-colors-glossary |
| tc-05 | should_not_trigger | PASS | 三层架构设计，应转交 design-token-architecture |
| tc-06 | edge_case | PASS | 原子值遗漏补全，走 E 段步骤补全并提示同步 |
| tc-07 | edge_case | PASS | 快速原型开发，应走 B 段不适用分支 |

通过率 7/7 (100%)

回炉记录：格式升级：旧格式工件补齐为 darwin 三件套