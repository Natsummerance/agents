# test-results — gpt-image-prompting

- 盲测方式: 纸面推演（trace）——对照本 SKILL.md 的 A2 语言信号、I 四条骨架（Prompt 即协议/四级匹配序/六段构造块/防坑五锁）与 B 边界红线逐条判定
- 蒸馏时间: 2026-08-25

| id | type | 判定 | 说明 |
|----|------|------|------|
| should-trigger-01 | should_trigger | PASS | UI 类别+文字可读诉求命中 A2 场景1；JSON 进阶格式与三约束写入符合 E 步骤3-4 |
| should-trigger-02 | should_trigger | PASS | 乱码+模块混乱翻车命中 A2 场景2；修复遵循「收紧约束不换模型」纪律（防坑锁③④⑤） |
| should-trigger-03 | should_trigger | PASS | 自动化流水线模板诉求命中 A2 场景3 与 I 条目1 的 JSON 协议格式 |
| should-not-trigger-01 | should_not_trigger | PASS | 成片视频需求是 ai-short-video 的 A2 场景，正确让位并点名兄弟 slug |
| should-not-trigger-02 | should_not_trigger | PASS | 去水印/超分后处理属 B 段不适用场景第 2 条 |
| edge-01 | edge_case | PASS | 跨模型迁移局限在 B 段已知局限第 1 条文档化，如实降级而非宣称通用 |
| edge-02 | edge_case | PASS | 伪造他人账号发言的截图请求触发伪造滥用防线红线，明确拒绝并说明正当用途边界 |

- 通过率: 7/7 (100%)
- 回炉记录: 初版 should-trigger-01 只判「套 UI 模板」，回炉时对照 E 步骤3 补齐「JSON 进阶版本供程序调用」预期；edge-02 初版预期写成「提示风险后继续」，回炉时对照 B 段红线改为「直接拒绝虚假传播用途」，复测通过。

