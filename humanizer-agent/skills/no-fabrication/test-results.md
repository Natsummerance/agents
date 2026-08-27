# test-results.md - No Fabrication

## 推演表

| id | type | 判定 | 说明 |
|----|------|------|------|
| nof-t1 | should_trigger | PASS | 直接担心日期/数字/引用被改，期望行为声明事实细节只来自源/作者、去痕前后零篡改并逐条核对 |
| nof-t2 | should_trigger | PASS | 原文缺月份问能否补，期望行为拒绝编造改为询问用户，对应 ask instead of making up 原则 |
| nof-nt1 | should_not_trigger | PASS | 风格保持归 preserve-style，真实性保障 vs 个性化保障分工清晰，互设诱饵生效 |
| nof-nt2 | should_not_trigger | PASS | 要看中间稿归 show-your-work，过程透明 vs 内容保障分工清晰，诱饵生效 |
| nof-e1 | edge_case | PASS | "大约三月"去痕想删"大约"，保守处理：模糊限定词属作者事实表述，删改前必询问，对应作者盲点 |
| nof-e2 | edge_case | PASS | 明确要求加酒店名，红线不编造：说明新增细节须用户提供来源否则留白，B 段边界下坚守红线 |

## 通过率
6/6 (100%)

## 回炉记录
格式升级：darwin 三件套补齐（frontmatter source_project 已有、E 段完成标准已全、test-prompts.json 已为 darwin 格式含互设诱饵、新建 test-results.md）