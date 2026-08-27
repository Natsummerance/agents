# test-results.md - Pattern-Based Detection

## 推演表

| id | type | 判定 | 说明 |
|----|------|------|------|
| pbd-t1 | should_trigger | PASS | 直接询问如何判断 AI 文本，期望行为介绍 35 模式与 6 大类别系统化检测方法 |
| pbd-t2 | should_trigger | PASS | 直接询问 Wikipedia 模式列表内容，期望行为按类别讲解代表性模式 |
| pbd-nt1 | should_not_trigger | PASS | 检测后怎么重写归 two-pass-rewriting，检测阶段与重写阶段互设诱饵生效 |
| pbd-nt2 | should_not_trigger | PASS | 匹配自己声音归 voice-matching，标准化检测与个性化调整互设诱饵生效 |
| pbd-e1 | edge_case | PASS | 单句文本检测可靠性受限，仍可单模式比对但建议提供完整段落，对应 AGENTS.md 错误处理 |
| pbd-e2 | edge_case | PASS | 代码提交信息属非散文/混合内容，判定 35 模式不适用，说明边界后视情况仅分析自然语言部分 |

## 通过率
6/6 (100%)

## 回炉记录
格式升级：darwin 三件套补齐（frontmatter source_project 已有、E 段完成标准已全、test-prompts.json 已为 darwin 格式含互设诱饵、新建 test-results.md）