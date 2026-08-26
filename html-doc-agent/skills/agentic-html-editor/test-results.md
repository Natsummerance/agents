# test-results — agentic-html-editor

- 盲测方式: 纸面推演（trace）——对照本 SKILL.md 的 A2 语言信号与 B 边界逐条判定
- 蒸馏时间: 2026-08-25

| id | type | 判定 | 说明 |
|----|------|------|------|
| should-trigger-01 | should_trigger | PASS | md→微信成品排版命中 A2 场景 1；doc 模板+juice 内联管线与 cli/README 工作原理互证 |
| should-trigger-02 | should_trigger | PASS | SaaS 落地页原型对应 prototype mode 的 saas-landing，SSE 流式迭代路径成立 |
| should-trigger-03 | should_trigger | PASS | CSV 自动探测+data-report+2× PNG 剪贴板导出与 README 导出表一致 |
| should-not-trigger-01 | should_not_trigger | PASS | VSCode 内 .md 实时预览是 markdown-preview-enhanced 场景，B 段第一条正确让位（兄弟 slug 已标注） |
| should-not-trigger-02 | should_not_trigger | PASS | 逐像素品牌还原超出模板化边界，B 段不适用第 2 条覆盖 |
| edge-01 | edge_case | PASS | 无本地 CLI 无法生成且不得建议公网暴露 /api/*，双重边界均被识别 |
| edge-02 | edge_case | PASS | 匹配偏差走 convert 显式指定或 --show-match-only 核对，三层漏斗纠偏路径完整 |

- 通过率: 7/7 (100%)
- 回炉记录: 无
