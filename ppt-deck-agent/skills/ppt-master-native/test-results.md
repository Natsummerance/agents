# test-results — ppt-master-native

- 盲测方式: 纸面推演（trace）——对照本 SKILL.md 的 A2 语言信号、I 路由骨架与 B 边界逐条判定
- 蒸馏时间: 2026-08-25

| id | type | 判定 | 说明 |
|----|------|------|------|
| should-trigger-01 | should_trigger | PASS | pptx+后续编辑命中 A2 场景1；答辩=正式→Default 运行时 |
| should-trigger-02 | should_trigger | PASS | 旧模板+新材料精确命中 Template Fill 路由定义 |
| should-not-trigger-01 | should_not_trigger | PASS | 网页放映+动效是 guizang-web-deck 的 A2 场景，正确让位 |
| should-not-trigger-02 | should_not_trigger | PASS | 大纲阶段未到生成，不激活管线 |
| should-not-trigger-03 | should_not_trigger | PASS | 成品直改母版属上游明令禁止操作，B 段失败模式覆盖并给出合规替代 |
| edge-01 | edge_case | PASS | "快速/草稿/十分钟"是 Quick 运行时的文档化触发措辞 |
| edge-02 | edge_case | PASS | Python 脚本链依赖为已知局限，如实降级处理 |

- 通过率: 7/7 (100%)
- 回炉记录: 无
