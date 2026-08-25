# test-results — banner-design

- 盲测方式: 纸面推演（trace）——对照本 SKILL.md 的 A2 语言信号与 B 边界逐条判定
- 蒸馏时间: 2026-08-25

| id | type | 判定 | 说明 |
|----|------|------|------|
| should-trigger-01 | should_trigger | PASS | "Twitter 封面 + 1500×500 + 极简"命中 A2 语言信号，进入锁画布→多稿→导出流水线 |
| should-trigger-02 | should_trigger | PASS | "3 个艺术方向对比"直击多方向比稿核心能力（A1 案例 hero 全链路同型） |
| should-trigger-03 | should_trigger | PASS | 投放备料命中 E5 平台规则校验（文字占比 <20%、CTA 规则）与多规格导出能力 |
| should-not-trigger-01 | should_not_trigger | PASS | 配色/字体/间距成套规范+暗色换肤是 design-system-generator 的 A2 场景，本 skill 正确让位 |
| should-not-trigger-02 | should_not_trigger | PASS | 硬编码抽 token 属体系工程，B 段边界明确"只消费 token 不生产 token"，避免过度触发 |
| edge-01 | edge_case | PASS | 版权授权核查按 B 段局限处理：先验许可与商用条款再进流程，不默认可用 |
| edge-02 | edge_case | PASS | 易拉宝在范围内但切换印刷分支（300 DPI/CMYK/出血/远观字号），未错套数字端规则 |

- 通过率: 7/7 (100%)
- 回炉记录: 初稿将"印刷易拉宝"设为 should_not_trigger；复核 B 段时确认上游本就覆盖 print 规格（300 DPI、CMYK、出血），改判为 edge_case 并补印刷规格分支说明，其余用例一次通过
