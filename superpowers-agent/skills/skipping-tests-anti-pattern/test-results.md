# Test Results - skipping-tests-anti-pattern

## 推演结果表

| Test Case ID | Type | Expected Behavior | Result |
|--------------|------|-------------------|--------|
| skipping-tests-anti-pattern-t1 | should_trigger | 确认跳过测试反模式成立，评估影响（覆盖率/回归数据），并制定补救与预防门禁方案 | PASS |
| skipping-tests-anti-pattern-t2 | should_trigger | 判定 code before tests 反模式，说明事后补测为何失效，按 RED-GREEN-REFACTOR 重走受影响部分 | PASS |
| skipping-tests-anti-pattern-t3 | should_trigger | 用覆盖率与线上 bug 数据佐证反模式后果，建立自动化检查机制阻止继续恶化 | PASS |
| skipping-tests-anti-pattern-n1 | should_not_trigger | TDD 正面操作指导转交 test-first-philosophy；本 skill 是反面警示与纠偏，不承担方法教学 | PASS |
| skipping-tests-anti-pattern-n2 | should_not_trigger | 修复成功的验证与举证转交 evidence-over-claims；本 skill 止于测试恢复绿色 | PASS |
| skipping-tests-anti-pattern-e1 | edge_case | 命中 B 段边界：探索性编程豁免 TDD 强制，说明定型后需补测试的时点 | PASS |
| skipping-tests-anti-pattern-e2 | edge_case | 不做一刀切删除：给出分层策略（新变更严格 TDD、存量代码随触碰渐进补测），并说明与原教旨做法的差异 | PASS |

## 通过率

**7/7 (100%)**

## 回炉记录

- 格式升级：darwin 三件套补齐