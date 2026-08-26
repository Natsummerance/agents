# test-results — scrapling-stealth

- 盲测方式: 纸面推演（trace）——对照本 SKILL.md 的 A2 语言信号与 B 边界逐条判定
- 蒸馏时间: 2026-08-25

| id | type | 判定 | 说明 |
|----|------|------|------|
| should-trigger-01 | should_trigger | PASS | Cloudflare Turnstile 挑战页命中 A2 场景 1，StealthySession solve_cloudflare=True 为 I-1 第三级 fetcher 的标准处置 |
| should-trigger-02 | should_trigger | PASS | 改版疲劳诉求正中核心差异点 auto_save/adaptive 元素重定位，E4 含改版模拟的完成标准 |
| should-trigger-03 | should_trigger | PASS | 规模化四件套（AutoThrottle/ProxyRotator/crawldir 续爬/robots_txt_obey）在 Spider 骨架与 E5 全部落地 |
| should-not-trigger-01 | should_not_trigger | PASS | 无反爬公开文档站按分工让位 crawl4ai-scraping（兄弟 slug 已标注），符合 B 段"避免过度隐身"原则 |
| should-not-trigger-02 | should_not_trigger | PASS | PDF 本体解析让位 odl-pdf-extraction（兄弟 slug 已标注），本 skill 止步于获取文件 |
| edge-01 | edge_case | PASS | 伪装登录态绕付费专栏被 B 段合规红线拒绝，隐身≠万能钥匙的分界表述与上游 Disclaimer 一致 |
| edge-02 | edge_case | PASS | DataDome 企业级防护如实声明超出内建范围（仅覆盖 Cloudflare Turnstile 类），给出合法替代评估而非承诺绕过 |

- 通过率: 7/7 (100%)
- 回炉记录: 首版 description 沿用 agent 工作流的「绕过 Cloudflare 等防护」措辞，易被读成承诺破解验证码/登录墙；回炉改写为「处理公开页面的 Cloudflare Turnstile/Interstitial 中间盾」，并在 B 段合规红线上收口「不绕过登录墙/付费墙/验证码」+ 补 DataDome 类企业级防护的局限条目（edge-02 即由此新增）。
