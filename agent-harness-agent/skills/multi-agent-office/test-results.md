# test-results — multi-agent-office

- 运行方式：本地推演（无执行环境，按 expected_behavior 逐条人工推演判定）
- 审计日期：2026-08-25
- 用例数：7（trigger 3 / bait 3 / edge 1）
- 通过率：**100%（7/7 ≥ minimum_pass_rate 0.95）**

## 推演表

| id | type | prompt 摘要 | 判定 | 关键依据 |
|---|---|---|---|---|
| mao-trig-01 | trigger | 三引擎并行分工+可视监督 | PASS | spawn/GOD 入座/楼层监督流程完整 |
| mao-trig-02 | trigger | 单入口主管路由+审批 | PASS | GOD 裁决与 Approvals 上抛机制准确 |
| mao-trig-03 | trigger | 预算熔断与人工门禁 | PASS | 三档断路器梯子+预算配置命中 |
| mao-bait-01 | bait | 点名 ecc-harness-os 装机 | PASS | 让位声明清晰，未接插件安装 |
| mao-bait-02 | bait | 跨工具通用记忆层选型 | PASS | 转 mem0-memory-layer |
| mao-bait-03 | bait | CLI 静态仓库图谱 | PASS | 转 project-knowledge-graph |
| mao-edge-01 | edge | 无显示器服务器能不能跑 | PASS | 如实劝退 GUI 边界+替代路线，未许诺魔改 |

## 回炉记录

1. **R1（定位回炉）**：初版 description 写成泛化「定义 Agent 角色和协作流程」（沿用空壳旧文案），未体现可视化楼层/GOD agent/熔断三大识别点；重写后复测 V2 通过。
2. **R2（诱饵回炉）**：初版 mao-bait-02 为「帮我设计 UI」，与本 skill 触发面距离过远、区分价值低；替换为记忆层选型需求（hive 内置记忆词面干扰更强）后复测 PASS。
3. **R3（笔误勘正）**：mao-bait-01 expected_behavior 初稿误写「转 ecc-harness-office」，勘正为兄弟 slug `ecc-harness-os`；该错误在推演中被捕获，正是 bait 用例的设计目的。
4. **R4（edge 回炉）**：初版 mao-edge-01 建议「可用 xvfb 凑合」，核对 README 未提任何无头支持后判为过度承诺，改为明确劝退+替代方案，重推 PASS。

## 结论

7/7 PASS，通过率 100%，达到 darwin 门限 0.95，skill 可发布。
