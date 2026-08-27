# test-results.md - Subjective Human-Sounding

## 推演表

| id | type | 判定 | 说明 |
|----|------|------|------|
| shs-t1 | should_trigger | PASS | 直接表达"太人工"主观不满，期望行为完整覆盖四步骤（识别不满→定读者→多方反馈→建指标） |
| shs-t2 | should_trigger | PASS | 直指统一标准是否存在，期望行为明确否定并给出替代框架，对应 I 段核心问题 |
| shs-t3 | should_trigger | PASS | 具体目标读者（高校教师），期望行为按步骤 2-4 可操作落地，读者画像与指标对应 |
| shs-nt1 | should_not_trigger | PASS | 个人风格保持归 preserve-style/voice-matching，多读者评估 vs 单作者风格分工清晰 |
| shs-nt2 | should_not_trigger | PASS | 模式检测归 pattern-based-detection，评估主观性 vs 标准化检测分工清晰 |
| shs-nt3 | should_not_trigger | PASS | 事实保护归 no-fabrication，层面区分正确 |
| shs-e1 | edge_case | PASS | 单一读户场景简化流程但保留客观指标自检，避免过度去痕，符合 B 段排除条件 |
| shs-e2 | edge_case | PASS | 大众号宽泛读者给出"最小公约数"可读性指标基线策略，可落地执行 |

## 通过率
8/8 (100%)

## 回炉记录
格式升级：darwin 三件套补齐（frontmatter source_project 已有、E 段完成标准已全、test-prompts.json 重写为 darwin 格式含互设诱饵、新建 test-results.md）