# test-results.md - Prose-Only Changes

## 推演表

| id | type | 判定 | 说明 |
|----|------|------|------|
| poc-t1 | should_trigger | PASS | Markdown 混合内容担忧结构安全，期望行为覆盖只改散文+四类保留+四步骤执行验证 |
| poc-t2 | should_trigger | PASS | 代码注释边界模糊，期望行为指出作者盲点并给出显式登记+默认保留的可执行建议 |
| poc-t3 | should_trigger | PASS | Jupyter Notebook 具体化场景，期望行为区分 markdown/code 单元格并逐类验证零变更 |
| poc-nt1 | should_not_trigger | PASS | 引用日期保护归 no-fabrication，结构安全 vs 内容真实分工清晰 |
| poc-nt2 | should_not_trigger | PASS | 技术文档中立策略归 preserve-style，范围限制 vs 风格调整分工清晰 |
| poc-nt3 | should_not_trigger | PASS | 模式检测归 pattern-based-detection，安全约束 vs 检测执行分工清晰 |
| poc-e1 | edge_case | PASS | HTML 内嵌 script 标签判定为嵌入式代码整块保留，例外单独处理并记录，对应作者盲点 |
| poc-e2 | edge_case | PASS | 主动要求改代码注释属 B 段排除，告知边界后提供拎出注释单独处理的折中方案 |

## 通过率
8/8 (100%)

## 回炉记录
格式升级：darwin 三件套补齐（frontmatter source_project 已有、E 段完成标准已全、test-prompts.json 重写为 darwin 格式含互设诱饵、新建 test-results.md）