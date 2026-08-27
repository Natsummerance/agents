# test-results — ai-friendly-spec-framework

| id | type | 判定 | 说明 |
|---|---|---|---|
| tc-01 | should_trigger | PASS | 直接询问 AI 友好规范编写，命中核心触发 |
| tc-02 | should_trigger | PASS | 询问 AI 生成代码质量保障，命中 A2 场景 |
| tc-03 | should_not_trigger | PASS | CSS bug 修复，与规范编写无关 |
| tc-04 | should_not_trigger | PASS | 基础概念查询，不在范围内 |
| tc-05 | should_not_trigger | PASS | 代码合规检查，应转交 ai-iteration-check-principles |
| tc-06 | edge_case | PASS | 纯人工规范场景，应走 B 段不适用分支 |
| tc-07 | edge_case | PASS | 压缩风险咨询，属于 B 段失败模式讨论 |

通过率 7/7 (100%)

回炉记录：格式升级：旧格式工件补齐为 darwin 三件套