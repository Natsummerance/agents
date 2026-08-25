# test-results — gpt-image-prompting

- 盲测方式: 纸面推演（trace）——对照本 SKILL.md 的 A2 语言信号、I 四条骨架（类别锁定/双格式/五大约束锁/两级检索）与 B 边界红线逐条判定
- 蒸馏时间: 2026-08-25

| id | type | 判定 | 说明 |
|----|------|------|------|
| should-trigger-01 | should_trigger | PASS | UI 类别 + 文字可读诉求命中 A2 场景1；平台/比例/文字锁三约束按 E 步骤3-4 写入 |
| should-trigger-02 | should_trigger | PASS | 乱码+排版翻车精确命中 A2 场景2；修复路径遵循"收紧约束不换模型"纪律 |
| should-not-trigger-01 | should_not_trigger | PASS | 成片视频需求是 ai-short-video 的 A2 场景，正确让位并点名兄弟 slug |
| should-not-trigger-02 | should_not_trigger | PASS | 去水印/超分属 B 段不适用场景第 2 条 |
| should-not-trigger-03 | should_not_trigger | PASS | Figma 组件实现属下游设计工作流，本 skill 止步 prompt |
| edge-01 | edge_case | PASS | 跨模型迁移局限在 B 段已知局限第 1 条文档化，如实降级而非硬撑通用性 |
| edge-02 | edge_case | PASS | 名人肖像商用触发 B 段合规红线，先权利确认再执行 |

- 通过率: 7/7 (100%)
- 回炉记录: 初版 edge-02 只判"继续生成"，回炉时对照 B 段肖像权红线改为"先确认授权基础"，复测通过；should-not-trigger-01 初版预期未写明转交对象，已补 ai-short-video slug。
