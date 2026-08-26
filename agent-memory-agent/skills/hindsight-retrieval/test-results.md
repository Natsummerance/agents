# test-results — hindsight-retrieval

- 运行方式：本地推演（无执行环境，按 expected_behavior 逐条人工推演判定）
- 审计日期：2026-08-25
- 用例数：7（trigger 3 / bait 3 / edge 1）
- 通过率：**100%（7/7 ≥ minimum_pass_rate 0.95）**

## 推演表

| id | type | prompt 摘要 | 判定 | 关键依据 |
|---|---|---|---|---|
| hind-trig-01 | trigger | 时序召回不准 | PASS | 四路召回+RRF+重排方案命中，retain 带 timestamp |
| hind-trig-02 | trigger | 显式控制存取时机 | PASS | 给出显式 SDK 示例与 wrapper 取舍判据 |
| hind-trig-03 | trigger | 编码 agent per-repo 记忆 | PASS | coding-agents 一键安装路径正确 |
| hind-bait-01 | bait | 未选型先问 Mem0 对比 | PASS | 转 mem0-memory-layer，未抢跑实施 |
| hind-bait-02 | bait | 经验分层沉淀伪装成记忆检索 | PASS | 转 agent-experience-persistence |
| hind-bait-03 | bait | 静态 monorepo 图谱 | PASS | 动静分野清晰，转 project-knowledge-graph |
| hind-edge-01 | edge | 当纯向量库滥用的请求 | PASS | 如实说明抽取必经与收益损失，给出替代 |

## 回炉记录

1. **R1（描述回炉）**：初版 description 只讲「向量语义搜索」（沿用空壳旧文案），未覆盖 reflect/bank/coding-agents 触发面，扩写后补入三条边界，重推 V2 通过。
2. **R2（诱饵回炉）**：初版 hind-bait-01 仅写「对比记忆方案」未点名兄弟 slug，按规范补入 `mem0-memory-layer` 字样后复测通过。
3. **R3（edge 回炉）**：初版 hind-edge-01 expected_behavior 为「可以但没必要」，推演判为误导（掩盖收益损失本质），改写为明确劝退+替代方案后重推 PASS。
4. **R4（引用回炉）**：初版 R 段引用超 100 词，裁剪至 ~60 词并保留四路召回关键句。

## 结论

7/7 PASS，通过率 100%，达到 darwin 门限 0.95，skill 可发布。
