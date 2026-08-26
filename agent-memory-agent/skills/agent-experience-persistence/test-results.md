# test-results — agent-experience-persistence

- 运行方式：本地推演（无执行环境，按 expected_behavior 逐条人工推演判定）
- 审计日期：2026-08-25
- 用例数：7（trigger 3 / bait 3 / edge 1）
- 通过率：**100%（7/7 ≥ minimum_pass_rate 0.95）**

## 推演表

| id | type | prompt 摘要 | 判定 | 关键依据 |
|---|---|---|---|---|
| aep-trig-01 | trigger | 日志撑爆上下文要可回溯压缩 | PASS | offload 三层+node_id 回溯方案完整命中 |
| aep-trig-02 | trigger | persona 沉淀+白盒审计 | PASS | L0-L3 与 memory-tdai 目录白盒方案命中 |
| aep-trig-03 | trigger | Hermes provider 目录报错 | PASS | 下划线命名/config.yaml/env 细节准确 |
| aep-bait-01 | bait | 点名 Mem0 通用记忆层 | PASS | 转 mem0-memory-layer，未抢接 |
| aep-bait-02 | bait | 排序算法调优需求 | PASS | 转 hindsight-retrieval |
| aep-bait-03 | bait | 静态仓库图谱 | PASS | 转 project-knowledge-graph |
| aep-edge-01 | edge | 生产禁 SQLite 要换 Postgres | PASS | 如实告知不支持+过渡方案，无幻觉承诺 |

## 回炉记录

1. **R1（定位回炉）**：初版 description 写成泛化的「记录决策和结果」（沿用空壳旧文案），与 mem0 兄弟边界模糊；重写为「卸载可回溯 + 分层白盒沉淀 + OpenClaw/Hermes 零改码」三触点后复测通过。
2. **R2（诱饵回炉）**：初版 aep-bait-02 只写「召回不准想优化」未点名兄弟 slug 且与本 skill 触发面重叠过大，按规范补入 RRF/cross-encoder 具体技术词并指向 `hindsight-retrieval` 后复测 PASS。
3. **R3（edge 回炉）**：初版 aep-edge-01 曾写「可切换任意后端」，核对 README 后确认为过度承诺（roadmap 中 portable backend 未勾选），改为如实不支持+过渡方案，重推 PASS。
4. **R4（事实校准）**：A1 案例初版写成「token 减少 61.38 个百分点」，勘正为「相对下降约六成（−61.38%）」；基准表述以 README 表格为准。

## 结论

7/7 PASS，通过率 100%，达到 darwin 门限 0.95，skill 可发布。
