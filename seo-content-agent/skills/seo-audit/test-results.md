# seo-audit · test-results

- skill: seo-audit
- version: 1.1.0
- 推演日期: 2026-08-25
- 用例总数: 7

## 推演表

| id | type | 判定 | 说明 |
|---|---|---|---|
| seo-audit-t1 | should_trigger | PASS | 显式"审计 SEO"请求命中核心场景，进入体检+一页报告流程 |
| seo-audit-t2 | should_trigger | PASS | "搜不到/帮我诊断"为困惑型信号，A2 语言信号第 3 条覆盖 |
| seo-audit-t3 | should_trigger | PASS | 报告交付场景触发，且检验外行可读约束（E6 完成标准） |
| seo-audit-n1 | should_not_trigger | PASS | 单项 JSON-LD 需求按 A2 区分规则转 schema-markup，本 skill 不启动 |
| seo-audit-n2 | should_not_trigger | PASS | AI 引用诉求转 geo-search-optimize；notes 已写明兄弟 slug |
| seo-audit-e1 | edge_case | PASS | 触发红线：拒绝保证排名承诺、点名黑帽手法风险、拉回可验证改进 |
| seo-audit-e2 | edge_case | PASS | 登录墙 URL 报告原因不编造，符合 AGENTS.md 错误处理约定 |

通过率: 7/7 (100%) ≥ minimum_pass_rate 0.95 → 达标

## 回炉记录

- 初稿 description 仅 34 字且未写不适用场景 → 补足触发场景（审计/体检/诊断）与三个转介出口，扩至 100+ 字。
- 初稿 E 段第 4 步"排查假死站点"完成标准含糊（"仔细检查"）→ 改为可判定二选一结论（自查证书/重定向变体 + 搜索活站，结论记录在案）。
- 初稿 test-prompts 仅 2 条且缺 edge_case 与兄弟 slug 诱饵 → 重构为 3+2+2 七条结构，n1/n2 notes 写明 schema-markup / geo-search-optimize。
