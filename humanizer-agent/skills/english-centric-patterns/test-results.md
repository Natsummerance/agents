# test-results.md - English-Centric Patterns

## 推演表

| id | type | 判定 | 说明 |
|----|------|------|------|
| ecp-t1 | should_trigger | PASS | 中文公众号文章质疑 35 英文模式适用性，期望行为指出以英文为中心并建议调整权重+人工复核 |
| ecp-t2 | should_trigger | PASS | 日文去痕效果差归因模式列表，期望行为分析覆盖缺口并给出替代方案与手动调整策略 |
| ecp-nt1 | should_not_trigger | PASS | 纯英文博客检测归 pattern-based-detection，纯英文不在本技能范围，互设诱饵生效 |
| ecp-nt2 | should_not_trigger | PASS | 游记保持语气归 preserve-style，语言层面与风格层面区分清晰，诱饵生效 |
| ecp-e1 | edge_case | PASS | 中英混排技术文档，先做语言分区判定，非散文部分提示 prose-only-changes 约束，仅评估散文部分模式适用性 |
| ecp-e2 | edge_case | PASS | 询问西班牙语版维基页面是否存在，不臆断外部事实，引导自查或反馈 WikiProject AI Cleanup |

## 通过率
6/6 (100%)

## 回炉记录
格式升级：darwin 三件套补齐（frontmatter source_project 已有、E 段完成标准已全、test-prompts.json 已为 darwin 格式含互设诱饵、新建 test-results.md）