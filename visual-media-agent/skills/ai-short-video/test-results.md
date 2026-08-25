# test-results — ai-short-video

- 盲测方式: 纸面推演（trace）——对照本 SKILL.md 的 A2 语言信号、I 五段流水线骨架与 B 合规红线逐条判定
- 蒸馏时间: 2026-08-25

| id | type | 判定 | 说明 |
|----|------|------|------|
| should-trigger-01 | should_trigger | PASS | 主题+竖屏+配音字幕命中 A2 场景1；默认免费档组合可直接满足 |
| should-trigger-02 | should_trigger | PASS | 自定义脚本路径为 A1 案例2 的文档化入口，正确跳过脚本环节 |
| should-not-trigger-01 | should_not_trigger | PASS | 只要封面图提示词是 gpt-image-prompting 的 A2 场景，正确让位 |
| should-not-trigger-02 | should_not_trigger | PASS | 实拍剪辑调色属 B 段不适用场景第 2 条 |
| should-not-trigger-03 | should_not_trigger | PASS | 未授权影视解说被 B 段版权核查红线明确禁止，且给出合规替代 |
| edge-01 | edge_case | PASS | 铺量养号触发 B 段平台规则红线；单任务不并发符合上游运行纪律 |
| edge-02 | edge_case | PASS | 凭据受限走替代素材路径 + 一次性索取纪律，与 I 条目4 一致 |

- 通过率: 7/7 (100%)
- 回炉记录: 初版 edge-02 判定写成"直接要 key 后继续"，回炉时对照 I 条目4 补齐"先给替代路径、缺失项合并索取"的完整预期后复测通过；should-not-trigger-01 初版未点名兄弟 slug，已补 gpt-image-prompting 转交依据。
