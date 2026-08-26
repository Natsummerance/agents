# test-results — crawl4ai-scraping

- 盲测方式: 纸面推演（trace）——对照本 SKILL.md 的 A2 语言信号与 B 边界逐条判定
- 蒸馏时间: 2026-08-25

| id | type | 判定 | 说明 |
|----|------|------|------|
| should-trigger-01 | should_trigger | PASS | 文档站+LLM 语料+去噪命中 A2 场景 1，深爬与 PruningContentFilter 步骤链在 E1–E3 完整覆盖 |
| should-trigger-02 | should_trigger | PASS | 免 LLM 约束正确路由 JsonCssExtractionStrategy，I-3 双策略决策树给出唯一答案 |
| should-trigger-03 | should_trigger | PASS | 无限滚动信号触发 VirtualScrollConfig，E4 动态内容攻坚步骤可执行 |
| should-not-trigger-01 | should_not_trigger | PASS | 年报 PDF 是文件本体，A2 区分段与 B 段第一条均让位 odl-pdf-extraction（兄弟 slug 已标注） |
| should-not-trigger-02 | should_not_trigger | PASS | Cloudflare 挑战页属强反爬拦截，A2 区分段明确移交 scrapling-stealth（兄弟 slug 已标注） |
| should-not-trigger-03 | should_not_trigger | PASS | MySQL 导出为域外诱饵：非网页数据源，B 段"内部 API/数据库导出类需求"显式排除 |
| edge-01 | edge_case | PASS | 登录墙+付费墙越界请求被 B 段合规红线拒绝，并按预期给出官方导出/授权替代路径 |

- 通过率: 7/7 (100%)
- 回炉记录: 无
