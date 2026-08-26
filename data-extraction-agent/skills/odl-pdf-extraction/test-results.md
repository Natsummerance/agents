# test-results — odl-pdf-extraction

- 盲测方式: 纸面推演（trace）——对照本 SKILL.md 的 A2 语言信号与 B 边界逐条判定
- 蒸馏时间: 2026-08-25

| id | type | 判定 | 说明 |
|----|------|------|------|
| should-trigger-01 | should_trigger | PASS | 批量 PDF→markdown 命中 A2 场景 1；双栏顺序诉求由 XY-Cut++ 与 E2 抽查标准覆盖，且提醒一次批量调用规避 JVM spawn 开销 |
| should-trigger-02 | should_trigger | PASS | 页码/坐标溯源命中 JSON 输出的 bounding box + page number 字段链路，click-to-source 在 I-7/E6 有落点 |
| should-trigger-03 | should_trigger | PASS | 扫描件+无边框表正确升级 hybrid 模式（docling-fast），模式路由判定对应 E3 完成标准 |
| should-not-trigger-01 | should_not_trigger | PASS | 在线教程网站是活网页，A2 区分段让位 crawl4ai-scraping（兄弟 slug 已标注） |
| should-not-trigger-02 | should_not_trigger | PASS | 反爬站点上的下载动作归 scrapling-stealth，composes-with 关系描述了"到手后回流本 skill"的正确接力 |
| should-not-trigger-03 | should_not_trigger | PASS | Excel 透视汇总为域外诱饵，B 段"非 PDF 格式"排除项覆盖 |
| edge-01 | edge_case | PASS | 加密破解+付费墙双重越界被 B 段合规红线拒绝，并建议正规渠道获取授权副本 |

- 通过率: 7/7 (100%)
- 回炉记录: 无内容回炉。构造期取证记录: 上游 raw README 的 HEAD/main fetch 均失败（transport error / decode error），改经 GitHub README、PyPI 项目页、opendataloader.org quick-start-python 三源交叉核验后成稿——属取证路径变更而非内容返工，已登记于 SKILL.md 审计信息来源清单。复核期修正（2026-08-26）: description 与 I-4 原将 hancom-ai 并列为现役 hybrid 后端，经重抓上游 README 核实其仍为 "Coming Soon" 路线图项，已改写为「现役后端 docling-fast；Hancom 集成为规划中」，测试用例不涉及该表述故通过率不受影响。
