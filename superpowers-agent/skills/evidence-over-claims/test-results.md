# Test Results - evidence-over-claims

## 推演结果表

| Test Case ID | Type | Expected Behavior | Result |
|--------------|------|-------------------|--------|
| evidence-over-claims-t1 | should_trigger | 启动验证流程：明确验证目标→设计验证手段→实际运行收集证据→展示可复核的结论 | PASS |
| evidence-over-claims-t2 | should_trigger | 运行测试套件并展示原始输出作为证据，未获证据前不宣布完成 | PASS |
| evidence-over-claims-t3 | should_trigger | 补跑基准测试给出前后对照数据及测量条件，无数据则撤回'快了一倍'的声明 | PASS |
| evidence-over-claims-n1 | should_not_trigger | 实现前的测试先行方法转交 test-first-philosophy；本 skill 只做完成后的结果验证 | PASS |
| evidence-over-claims-n2 | should_not_trigger | 根因追踪过程转交 ad-hoc-debugging-anti-pattern；追到根因后的修复验证才回到本 skill | PASS |
| evidence-over-claims-e1 | edge_case | 命中 B 段边界：无法量化的主观审美判断不启动验证流程，说明可量化的替代指标（圈复杂度、重复率）供用户选择 | PASS |
| evidence-over-claims-e2 | edge_case | 拒绝零证据声明成功：提供缩小验证范围的替代方案（只跑受影响模块的测试子集），并记录欠下的验证债 | PASS |

## 通过率

**7/7 (100%)**

## 回炉记录

- 格式升级：darwin 三件套补齐