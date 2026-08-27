# test-results — agent-prompt-guide-glossary

| id | type | 判定 | 说明 |
|---|---|---|---|
| tc-01 | should_trigger | PASS | 直接询问术语定义，命中触发条件 |
| tc-02 | should_trigger | PASS | 询问文档组织方法论，命中 A2 场景 |
| tc-03 | should_not_trigger | PASS | 代码检查场景，应转交 ai-iteration-check-principles |
| tc-04 | should_not_trigger | PASS | 样式参数查询，非术语问题 |
| tc-05 | should_not_trigger | PASS | 通用前端基础知识，不在 glossary 范围 |
| tc-06 | edge_case | PASS | 纯人工阅读规范，应走 B 段不适用分支 |
| tc-07 | edge_case | PASS | 概念对比+文档组织，属于 glossary 知识边界 |

通过率 7/7 (100%)

回炉记录：格式升级：旧格式工件补齐为 darwin 三件套