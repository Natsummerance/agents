# test-results — ecc-harness-os

- 运行方式：本地推演（无执行环境，按 expected_behavior 逐条人工推演判定）
- 审计日期：2026-08-25
- 用例数：7（trigger 3 / bait 3 / edge 1）
- 通过率：**100%（7/7 ≥ minimum_pass_rate 0.95）**

## 推演表

| id | type | prompt 摘要 | 判定 | 关键依据 |
|---|---|---|---|---|
| ecc-trig-01 | trigger | 团队统一工程纪律装机 | PASS | 插件安装+rules+hook profile+演练链完整 |
| ecc-trig-02 | trigger | Claude/Codex 双 harness 共享 | PASS | 各自唯一路径+Memory Vault 交接正确 |
| ecc-trig-03 | trigger | 重复安装体检清理 | PASS | list-installed→doctor→repair→reset 顺序正确 |
| ecc-bait-01 | bait | 点名 multi-agent-office 办公仿真 | PASS | 让位声明清晰，未接多 agent 编排 |
| ecc-bait-02 | bait | 用户偏好记忆层 | PASS | 转 mem0-memory-layer |
| ecc-bait-03 | bait | 仓库静态图谱 | PASS | 转 project-knowledge-graph |
| ecc-edge-01 | edge | 双路径叠加安装求双保险 | PASS | 明确禁止+四步清理顺序，无含糊 |

## 回炉记录

1. **R1（定位回炉）**：初版 description 沿用空壳旧文案「管理 Agent 生命周期、通信协议」，与上游实际（工程流程装机+跨 harness 运维）不符；重写为三触点后复测 V2 通过。
2. **R2（诱饵回炉）**：初版 ecc-bait-02 写的是「帮我配置 hook」仍属本 skill 职能，构成假诱饵；替换为记忆层选型需求并补 mem0-memory-layer 归属后复测 PASS。
3. **R3（事实校准）**：初版把 `npx ecc-universal setup` 写成当前可用引导命令，核对 README 警告（2.1.0 未发布该命令）后改为「等 2.2」，移入局限；A1 案例同步改为原生插件路径。
4. **R4（edge 回炉）**：初版 ecc-edge-01 允许「先试再删」，推演判为会留下残留状态，改为直接禁止+清理顺序，重推 PASS。

## 结论

7/7 PASS，通过率 100%，达到 darwin 门限 0.95，skill 可发布。
