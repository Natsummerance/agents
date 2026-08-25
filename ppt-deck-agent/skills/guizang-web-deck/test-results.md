# test-results — guizang-web-deck

- 盲测方式: 纸面推演（trace）——对照本 SKILL.md 的 A2 语言信号与 B 边界逐条判定
- 蒸馏时间: 2026-08-25

| id | type | 判定 | 说明 |
|----|------|------|------|
| should-trigger-01 | should_trigger | PASS | "网页版"+"杂志质感"命中 A2 场景1 与语言信号，激活 A 方案流程 |
| should-trigger-02 | should_trigger | PASS | Swiss Style/Helvetica/横滑命中语言信号，B 方案+时长→页数映射 |
| should-not-trigger-01 | should_not_trigger | PASS | "pptx 文件+公司模板继续改"是 ppt-master-native 的 A2 场景，本 skill 正确让位 |
| should-not-trigger-02 | should_not_trigger | PASS | 静态海报非幻灯片域，B 段不适用场景覆盖 |
| should-not-trigger-03 | should_not_trigger | PASS | 微编辑≠新生成；E 步骤7 的交付说明已覆盖改字路径 |
| edge-01 | edge_case | PASS | 打印刚需触发已知局限说明与替代方案建议 |
| edge-02 | edge_case | PASS | 低端机掉帧降级路径在已知局限中显式声明 |

- 通过率: 7/7 (100%)
- 回炉记录: 无
