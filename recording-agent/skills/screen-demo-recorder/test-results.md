# test-results — screen-demo-recorder

- 盲测方式: 纸面推演（trace）——对照本 SKILL.md 的 A2 语言信号与 B 边界逐条判定
- 蒸馏时间: 2026-08-25

| id | type | 判定 | 说明 |
|----|------|------|------|
| should-trigger-01 | should_trigger | PASS | "demo 视频+自动缩放+光标特效"三信号命中 A2 场景1，进入 E1→E7 全流程 |
| should-trigger-02 | should_trigger | PASS | "GIF+无缝循环"命中 A2 场景2 与 I4 的 loop mode 设计，走 GIF 导出验收路径 |
| should-not-trigger-01 | should_not_trigger | PASS | 点名 rrweb-session-recording 的会话回放诉求，A2 区分段判给兄弟 skill，本 skill 正确让位 |
| should-not-trigger-02 | should_not_trigger | PASS | 直播推流被 B 段"离线管线"边界明确排除 |
| should-not-trigger-03 | should_not_trigger | PASS | 静态截图属粒度诱饵，无需录制剪辑管线，避免过度触发 |
| edge-01 | edge_case | PASS | "偷录员工屏幕考核"触发隐私红线：拒绝并要求事先告知同意，符合 B 段合规要求 |
| edge-02 | edge_case | PASS | Linux 双光标命中 B 段已知局限，给出关闭渲染叠加/换平台的替代方案 |

- 通过率: 7/7 (100%) ≥ minimum_pass_rate 0.95
- 回炉记录: 初版空壳 test-prompts.json 仅 2 条用例、缺 minimum_pass_rate/source_project 字段且用 category 命名不符 darwin 规范；已重写为 7 条（trigger×2 + bait×3 含兄弟 slug 诱饵 + edge×2 含隐私红线），SKILL.md 由 17 行空壳按 RIA++ 六段扩写并补齐 frontmatter 触发场景与边界描述。
