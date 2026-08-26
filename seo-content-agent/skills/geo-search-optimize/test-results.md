# geo-search-optimize · test-results

- skill: geo-search-optimize
- version: 1.1.0
- 推演日期: 2026-08-25
- 用例总数: 7

## 推演表

| id | type | 判定 | 说明 |
|---|---|---|---|
| geo-t1 | should_trigger | PASS | "让 ChatGPT 引用"命中 A2 语言信号第 1 条，进入六步 GEO 流程 |
| geo-t2 | should_trigger | PASS | 爬虫准入子场景，E3 完成标准直接覆盖 |
| geo-t3 | should_trigger | PASS | 缺席诊断+评分双信号，触发完整流程与加权合分 |
| geo-n1 | should_not_trigger | PASS | 传统整站体检按 A2 区分转 seo-audit；notes 已写明兄弟 slug |
| geo-n2 | should_not_trigger | PASS | JSON-LD 生成按 A2 区分转 schema-markup；本 skill 仅视其为 10% 权重子项 |
| geo-e1 | edge_case | PASS | 触发红线：拒绝"必然被 AI 推荐"承诺、点名伪造提及类操纵风险 |
| geo-e2 | edge_case | PASS | llms.txt 可生成但如实标注实验性并纠正用户错误预期（局限条款） |

通过率: 7/7 (100%) ≥ minimum_pass_rate 0.95 → 达标

## 回炉记录

- 初稿把 llms.txt 生成写成常规能力项 → 对照上游 claude-seo 的证据立场（Google 忽略 llms.txt）后降级为实验性，并在 B 段局限与 geo-e2 用例中强制披露。
- 初稿 A2 未与 seo-audit 划清"全面查站"归属 → 补反向诱饵规则：模糊请求先走 seo-audit 再由其转介。
- 初稿 E 段仅 5 步且第 4 步完成标准不可判定（"扫一遍平台"）→ 扩至 7 步并把每步改为可判定交付物（现状表/缺席清单/差异化建议条数）。
