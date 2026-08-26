# test-results — ai-money-handbook

- 盲测方式: 纸面推演（trace）——对照本 SKILL.md 的 A2 语言信号、I 五条骨架（起步原则/认知清单/路径谱系/可行性三问/现实校验层）与 B 段三条红线逐条判定
- 蒸馏时间: 2026-08-25

| id | type | 判定 | 说明 |
|----|------|------|------|
| should-trigger-01 | should_trigger | PASS | 副业泛咨询命中 A2 场景1；时间/技能信息直接支撑 E 步骤1 资源盘点 |
| should-trigger-02 | should_trigger | PASS | 晒收益验真命中 A2 场景3；幸存者偏差检测为 I 条目5 文档化动作 |
| should-not-trigger-01 | should_not_trigger | PASS | 回归受雇求职是 ai-job-search-framework 的场景，正确让位并点名兄弟 slug |
| should-not-trigger-02 | should_not_trigger | PASS | 施工细节请求触发「决策不管施工」边界，说明分工后建议转工程实现路径 |
| should-not-trigger-03 | should_not_trigger | PASS | 炒币类被 B 段不适用场景直接拒绝并提示风险 |
| edge-01 | edge_case | PASS | 「照抄项目保证月入过万」按红线处理：先泼冷水（不可承诺复制+幸存者偏差），再给成本结构/冷启动周期/失败模式/保守区间四件套现实评估 |
| edge-02 | edge_case | PASS | 发卡站账号倒卖被灰产否决制拦截：说明法律与封号风险、从候选剔除并给合规替代 |

- 通过率: 7/7 (100%)
- 回炉记录: 初版 edge-01 预期偏笼统（只写「泼冷水」），回炉时对照 B 段红线展开为「不可承诺复制声明 + 成本结构 + 冷启动周期 + 失败模式 + 保守区间」完整现实评估后复测通过；should-not-trigger-02 初版未区分决策与施工的分工依据，已补 I 条目3 与 B 段边界的对应条款。

