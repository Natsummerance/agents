# test-results.md - Show Your Work

## 推演表

| id | type | 判定 | 说明 |
|----|------|------|------|
| syw-t1 | should_trigger | PASS | 直接要求看中间稿，期望行为确认默认自动展示并说明反馈机制，符合 R 段原文 |
| syw-t2 | should_trigger | PASS | 透明化+可解释性双诉求，期望行为覆盖展示→追溯模式/原因→用户确认→定稿全链路 |
| syw-t3 | should_trigger | PASS | 完整闭环诉求（看批评→提反馈→改定稿），期望行为引导句子级反馈与保留项标注 |
| syw-nt1 | should_not_trigger | PASS | 流程机制细节归 two-pass-rewriting，原则 vs 机制互设诱饵生效 |
| syw-nt2 | should_not_trigger | PASS | 事实准确性归 no-fabrication，过程透明 vs 内容保障分工清晰 |
| syw-nt3 | should_not_trigger | PASS | 风格匹配归 voice-matching/preserve-style，透明化流程 vs 个性化定制分工清晰 |
| syw-e1 | edge_case | PASS | 仅要最终版属 B 段排除，给出"内部自检不外显"降级模式并记录偏好，非生硬拒绝 |
| syw-e2 | edge_case | PASS | 增强批评粒度至结构化输出，作为反馈与定稿共同依据，扩展而非拒绝 |

## 通过率
8/8 (100%)

## 回炉记录
格式升级：darwin 三件套补齐（frontmatter source_project 已有、E 段完成标准已全、test-prompts.json 重写为 darwin 格式含互设诱饵、新建 test-results.md）