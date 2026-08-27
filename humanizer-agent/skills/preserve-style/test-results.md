# test-results.md - Preserve Style

## 推演表

| id | type | 判定 | 说明 |
|----|------|------|------|
| prs-t1 | should_trigger | PASS | 个人写作担忧丢风格，期望行为说明默认保持作者风格并在验证环节逐项核对用词/句式/标点 |
| prs-t2 | should_trigger | PASS | API 参考文档确认中立策略，期望行为确认 technical prose 走 neutral and plain 不加个人色彩 |
| prs-nt1 | should_not_trigger | PASS | 主动给样本要匹配归 voice-matching，被动保持 vs 主动样本匹配互设诱饵生效 |
| prs-nt2 | should_not_trigger | PASS | 别动发布日期归 no-fabrication，风格层面与事实层面区分清晰，诱饵生效 |
| prs-e1 | edge_case | PASS | 带吐槽的开发者教程属混合类型，主从判定（技术规范为主、吐槽段落按个人处理）分别应用策略，对应作者盲点 |
| prs-e2 | edge_case | PASS | 正式报告要改成吐槽风属完全重写风格（B 段排除），明确告知超出职责范围后再决定是否协助 |

## 通过率
6/6 (100%)

## 回炉记录
格式升级：darwin 三件套补齐（frontmatter source_project 已有、E 段完成标准已全、test-prompts.json 已为 darwin 格式含互设诱饵、新建 test-results.md）