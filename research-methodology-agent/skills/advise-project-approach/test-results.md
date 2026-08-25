# test-results — advise-project-approach

- 盲测方式: 纸面推演（trace）——对照本 SKILL.md 的 A2 语言信号、三模式判定、窄路线与 B 边界逐条判定
- 蒸馏时间: 2026-08-25

| id | type | 判定 | 说明 |
|----|------|------|------|
| should-trigger-01 | should_trigger | PASS | 上游 demo 原题，约束四要素齐全免 intake，直接进 pre-build 全契约输出（可比/栈/成本/Build Plan/Validation Plan） |
| should-trigger-02 | should_trigger | PASS | "写到一半+方向对吗"命中 mid-build 语言信号；只读检查+High/Medium/Low 排序纠偏与 High≤5 条上限一致 |
| should-not-trigger-01 | should_not_trigger | PASS | 显式点名 arxiv-first-coding 的单算法文献检索场景，本 skill 正确让位（兄弟诱饵生效） |
| should-not-trigger-02 | should_not_trigger | PASS | 论文文本润色归 academic-humanizer；expected_behavior 同步传递了伪装投稿的披露义务红线 |
| should-not-trigger-03 | should_not_trigger | PASS | 单点 CSS bug 无项目级决策诉求，符合上游 narrow single-bug 排除条款 |
| edge-01 | edge_case | PASS | "三句话以内"的有界提问走 v0.7.1 窄路线：保持形状数量、嵌入验收行为、不产全报告，判定正确 |
| edge-02 | edge_case | PASS | 仅口头描述时降级 advisory review from description 并声明未读文件，evidence status 如实标注 |

- 通过率: 7/7 (100%)
- 回炉记录: 初稿把 edge-01（Postgres vs SQLite 三句话）设为 should_trigger 走完整 pre-build 契约；复核 SKILL.md 窄路线条款后确认"方向已固定的有界提问必须保持请求的形状与数量、不浏览不产报告"，改判 edge_case。另初稿 should-not-trigger-03 用例为"这个函数怎么写"，覆盖面过窄，替换为更贴近真实误触发的 CSS 单点修复并补上游排除条款依据，其余用例一次通过。
