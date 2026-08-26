# blog-writing-contract · test-results

- skill: blog-writing-contract
- version: 1.1.0
- 推演日期: 2026-08-25
- 用例总数: 7

## 推演表

| id | type | 判定 | 说明 |
|---|---|---|---|
| blog-t1 | should_trigger | PASS | 从零写作请求命中核心场景，进入五门流程 |
| blog-t2 | should_trigger | PASS | "发布前把关"命中 A2 语言信号第 2 条，触发质检闭环 |
| blog-t3 | should_trigger | PASS | 评分请求走五类权重评分表与分数带定位 |
| blog-n1 | should_not_trigger | PASS | 整站审计按 A2 区分转 seo-audit；notes 已写明兄弟 slug |
| blog-n2 | should_not_trigger | PASS | 已发布内容 AI 可见性转 geo-search-optimize；本 skill 仅覆盖写作期 15 分子项 |
| blog-e1 | edge_case | PASS | 双重红线拒绝：抄袭/堆砌/隐藏文字属黑帽 + 拒绝排名保证，并给合规替代 |
| blog-e2 | edge_case | PASS | 虚构数据触发 factcheck 阻断条款，验证"迭代 3 次后上报、不降标放行" |

通过率: 7/7 (100%) ≥ minimum_pass_rate 0.95 → 达标

## 回炉记录

- 初稿五门直接照搬本地 AGENTS.md 口语版（事实核查/SEO合规/可读性/原创性/CTA）→ 与上游 claude-blog 真实五门（能力发现/格式完整性/视觉验证/内容评审/资产链接）冲突，改为上游五门为准 + I5 映射说明。
- 初稿缺"用户编数据要求放行"类 edge_case → 补 blog-e2 固化 factcheck 不可绕过红线，使拒绝用例覆盖黑帽与造假两条线。
- 初稿 A2 未处理"写文章时顺带提 SEO/AI"的模糊归属 → 补反向诱饵：具体文章的写/改/审一律先归本 skill。
