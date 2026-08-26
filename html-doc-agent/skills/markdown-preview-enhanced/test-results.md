# test-results — markdown-preview-enhanced

- 盲测方式: 纸面推演（trace）——对照本 SKILL.md 的 A2 语言信号与 B 边界逐条判定
- 蒸馏时间: 2026-08-25

| id | type | 判定 | 说明 |
|----|------|------|------|
| should-trigger-01 | should_trigger | PASS | VSCode+公式实时预览命中 A2 场景 1；KaTeX/MathJax 取舍与定界符说明与 docs/math.md 一致 |
| should-trigger-02 | should_trigger | PASS | code chunk 执行场景命中 I-4，且按上游警告先行声明 enableScriptExecution 默认关闭 |
| should-not-trigger-01 | should_not_trigger | PASS | 设计感成品 HTML 落地页是 agentic-html-editor 场景，B 段第一条正确让位（兄弟 slug 已标注） |
| should-not-trigger-02 | should_not_trigger | PASS | Hugo 静态站构建属另一工具链，B 段生态边界覆盖 |
| edge-01 | edge_case | PASS | Puppeteer PDF 管线推荐成立；mermaid/code chunk 在 ebook 与 pandoc 导出的已知限制被提前披露 |
| edge-02 | edge_case | PASS | 默认安全姿态正确：脚本不执行，且拒绝建议对陌生文件开启执行选项并说明风险 |

- 通过率: 6/6 (100%)
- 回炉记录: 无
