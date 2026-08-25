# test-results — markdown-preview-enhanced

- 盲测方式: 纸面推演（trace）——对照本 SKILL.md 的 A2 语言信号与 B 边界逐条判定
- 蒸馏时间: 2026-08-25

| id | type | 判定 | 说明 |
|----|------|------|------|
| should-trigger-01 | should_trigger | PASS | 预览公式未渲染命中 A2 场景1 与语言信号，math typesetting 层处置路径明确 |
| should-trigger-02 | should_trigger | PASS | mermaid 渲染失败+PDF 导出同属三层增强栈与双导出管线范围 |
| should-not-trigger-01 | should_not_trigger | PASS | 重构设计化发布页是 agentic-html-editor 场景，A2 兄弟区分句正确让位（兄弟 slug 已标注） |
| should-not-trigger-02 | should_not_trigger | PASS | Atom 版已停止维护的平台边界在 B 段显式声明，正确拒答并说明 |
| edge-01 | edge_case | PASS | code chunk 可执行但依赖本机运行时，安全提醒与已知局限第三条一致 |
| edge-02 | edge_case | PASS | pandoc 缺失时 eBook 管线不可用，给出安装重试或改走 Puppeteer 的替代路径 |

- 通过率: 6/6 (100%)
- 回炉记录: 无
