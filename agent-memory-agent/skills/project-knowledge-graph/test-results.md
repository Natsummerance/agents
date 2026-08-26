# test-results — project-knowledge-graph

- 运行方式：本地推演（无执行环境，按 expected_behavior 逐条人工推演判定）
- 审计日期：2026-08-25
- 用例数：7（trigger 3 / bait 3 / edge 1）
- 通过率：**100%（7/7 ≥ minimum_pass_rate 0.95）**

## 推演表

| id | type | prompt 摘要 | 判定 | 关键依据 |
|---|---|---|---|---|
| pkg-trig-01 | trigger | 大仓库 onboarding 摸底 | PASS | god nodes 报告解读流程完整命中 |
| pkg-trig-02 | trigger | 代码+论文+照片异构建图 | PASS | 多模态矩阵与 deep 模式建议准确 |
| pkg-trig-03 | trigger | agent 可爬的持久 wiki | PASS | --wiki + --watch 增量方案命中 |
| pkg-bait-01 | bait | 用户偏好记忆 | PASS | 转 mem0-memory-layer |
| pkg-bait-02 | bait | 对话事实召回 | PASS | 转 hindsight-retrieval |
| pkg-bait-03 | bait | 经验 SOP 沉淀（点名兄弟 slug） | PASS | 转 agent-experience-persistence |
| pkg-edge-01 | edge | 4 文件也要建图省 token | PASS | 如实引用 ≈1x 实测数据，不夸大 |

## 回炉记录

1. **R1（定位回炉）**：初版 description 沿用空壳旧文案「tree-sitter AST 解析」，漏掉多模态（PDF/图片/vision）这一独占卖点；扩写后补入三条边界，重推 V2 通过。
2. **R2（诱饵回炉）**：初版三个诱饵均未点名兄弟 slug 且语义离本 skill 太远（如「帮我做 PPT」），区分度不足；按规范重写为三个兄弟场景各设一饵，pkg-bait-03 显式包含 `agent-experience-persistence` 字样，复测边界声明稳定。
3. **R3（edge 回炉）**：初版 pkg-edge-01 expected_behavior 为「照常建图」，核对 README worked/httpx 案例（≈1x）后判为误导，改写为如实劝告+条件性执行，重推 PASS。
4. **R4（事实校准）**：安装命令勘正为 `pip install graphifyy`（PyPI 暂名），并在局限中补充上游活跃仓库为 safishamsi/graphify 的镜像同步提示。

## 结论

7/7 PASS，通过率 100%，达到 darwin 门限 0.95，skill 可发布。
