# test-results — rrweb-session-recording

- 盲测方式: 纸面推演（trace）——对照本 SKILL.md 的 A2 语言信号与 B 边界逐条判定
- 蒸馏时间: 2026-08-25

| id | type | 判定 | 说明 |
|----|------|------|------|
| should-trigger-01 | should_trigger | PASS | "嵌入应用录制用户操作+报错现场回放"双信号命中 A2 场景1 与 A1 案例，进入 E1→E6 接入流程 |
| should-trigger-02 | should_trigger | PASS | 页面状态存档恢复命中 A2 场景3，正确路由到 rrweb-snapshot 序列化/重建路径 |
| should-not-trigger-01 | should_not_trigger | PASS | 点名 screen-demo-recorder 的宣传视频诉求，A2 区分段判给兄弟 skill，事件流方案不适用 |
| should-not-trigger-02 | should_not_trigger | PASS | UV/转化率属聚合统计，B 段"纯流量统计不适用"边界直接排除 |
| should-not-trigger-03 | should_not_trigger | PASS | Selenium 自动化录像非真人会话，B 段指向 E2E 自带 video/trace |
| edge-01 | edge_case | PASS | "上线即录、不告知不入隐私政策"触发隐私红线：拒绝无同意录制并提供低打扰合规替代 |
| edge-02 | edge_case | PASS | 卡号密码可读属脱敏失效事故，B 段红线给出停通道→掩码→清存量→审计的应急闭环 |

- 通过率: 7/7 (100%) ≥ minimum_pass_rate 0.95
- 回炉记录: 初版空壳 test-prompts.json 仅 2 条用例、缺 minimum_pass_rate/source_project 字段且用 category 命名不符 darwin 规范；已重写为 7 条（trigger×2 + bait×3 含兄弟 slug 诱饵 + edge×2 均涉隐私合规），SKILL.md 由 17 行空壳按 RIA++ 六段扩写并补齐 frontmatter 触发场景与边界描述。
