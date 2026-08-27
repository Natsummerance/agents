# test-results.md - Two-Pass Rewriting

## 推演表

| id | type | 判定 | 说明 |
|----|------|------|------|
| tpr-t1 | should_trigger | PASS | 直接询问流程，期望行为覆盖四阶段并强调核心约束（不拘泥结构、事实核查） |
| tpr-t2 | should_trigger | PASS | 质量+透明双诉求，期望行为说明 Critique 作为质量闸并面向用户展示，符合 R 段原文 |
| tpr-t3 | should_trigger | PASS | 追问执行细节，期望行为给出可落地步骤，区分两遍分工明确 |
| tpr-nt1 | should_not_trigger | PASS | 单模式细节归 pattern-based-detection，互设诱饵生效 |
| tpr-nt2 | should_not_trigger | PASS | 样本匹配归 voice-matching，流程执行与风格定制分工清晰 |
| tpr-nt3 | should_not_trigger | PASS | 文件结构安全归 prose-only-changes，约束层面区分正确 |
| tpr-e1 | edge_case | PASS | 仅要最终版属 B 段排除，给出降级方案（内部自检保底）而非生硬拒绝，体现实用主义 |
| tpr-e2 | edge_case | PASS | 增强 Critique 粒度至模式编号级，转化为最终重写任务单，扩展而非拒绝，对应盲点 |

## 通过率
8/8 (100%)

## 回炉记录
格式升级：darwin 三件套补齐（frontmatter source_project 已有、E 段完成标准已全、test-prompts.json 重写为 darwin 格式含互设诱饵、新建 test-results.md）