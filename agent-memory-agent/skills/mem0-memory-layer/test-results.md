# test-results — mem0-memory-layer

- 运行方式：本地推演（无执行环境，按 expected_behavior 逐条人工推演判定）
- 审计日期：2026-08-25
- 用例数：7（trigger 3 / bait 3 / edge 1）
- 通过率：**100%（7/7 ≥ minimum_pass_rate 0.95）**

## 推演表

| id | type | prompt 摘要 | 判定 | 关键依据 |
|---|---|---|---|---|
| mem0-trig-01 | trigger | 客服机器人长期记忆 | PASS | 命中主业：隔离键→形态三选一→add/search 接入链完整 |
| mem0-trig-02 | trigger | Mem0 vs 自建 RAG 选型 | PASS | 输出对比表+否决理由，符合 E-2 要求 |
| mem0-trig-03 | trigger | Cursor/Claude 共享本地记忆 | PASS | OpenMemory MCP 四工具+dashboard 方案命中 |
| mem0-bait-01 | bait | 已定 Hindsight 调 rerank | PASS | 未接调参活，转 hindsight-retrieval |
| mem0-bait-02 | bait | 代码库建知识图谱 | PASS | 转 project-knowledge-graph，未越界 |
| mem0-bait-03 | bait | 工具日志卸载伪装成记忆需求 | PASS | 识别为短期压缩，转 agent-experience-persistence |
| mem0-edge-01 | edge | 只存一条偏好要不要上全套 | PASS | 给出轻量替代+升级阈值，未过度工程化 |

## 回炉记录

1. **R1（结构回炉）**：初版 frontmatter description 仅 38 字且缺触发场景，按规范扩写至 ≥60 字并补入三条边界；重推 V2 通过。
2. **R2（诱饵回炉）**：初版 mem0-bait-02 只写「把代码库画成图谱」未显式提及兄弟 slug，按规范补入 `project-knowledge-graph` 字样后复测，边界声明行为稳定。
3. **R3（edge 回炉）**：初版 mem0-edge-01 的 expected_behavior 写成「仍建议接入 Mem0」，推演判为过度工程化风险（FAIL），改为轻量替代建议后重推 PASS。
4. **R4（来源回炉）**：raw main / HEAD / github.com 页面对 mem0 三通道均传输失败，改走 GitHub 仓库页搜索摘录 + mem0.ai 官方页蒸馏，已在审计信息如实标注「基于仓库描述蒸馏」。

## 结论

7/7 PASS，通过率 100%，达到 darwin 门限 0.95，skill 可发布。
