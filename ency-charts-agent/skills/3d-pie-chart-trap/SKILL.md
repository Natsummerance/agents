---
name: 3d-pie-chart-trap
description: |
  当用户考虑在饼图中使用 3D 效果或渐变填充时触发，用于警告这种设计会扭曲数据比例感知。触发场景：用户问"如何让饼图看起来更立体？"、"可以给饼图加渐变吗？"、"3D 饼图是不是更吸引人？"。不适用于：非饼图类型的图表、艺术性可视化。关键 trigger 信号：3D 饼图 / 立体效果 / 渐变填充 / 饼图美化。
source_book: 《ENCY-charts 数据可视化设计规范》 ENCY Design Team
source_chapter: 7. Don'ts #4
tags: [data-visualization, pie-chart, 3d-effect, design-taboo]
source_project: ENCY-charts 设计规范
related_skills: [chart-taboo-principles, clarity-first-principles]
---

# 3D Pie Chart Trap（3D 饼图陷阱）

## R (Reading) — 原文引用

> "Don'ts: 不要在饼图中使用 3D 效果或渐变填充 — 扭曲数据比例感知"

## I (Interpretation) — 方法论骨架

**核心问题**：3D 效果和渐变填充会引入额外的视觉维度（深度/光照），但饼图的数据是二维的（占比），导致视觉感知与数据事实不符。

**失败机制**：
1. **透视变形**：前方的扇区看起来比实际更大，后方的扇区被压缩
2. **光照误导**：渐变填充使某些扇区显得更"突出"，暗示其重要性更高
3. **角度失真**：3D 旋转后，扇区的圆心角不再准确反映占比

**正确做法**：饼图应保持纯扁平化设计，仅通过颜色和大小区分扇区。

## A1 (Past Application) — 书中作者用过的案例

在 ENCY-charts 规范中，作者明确禁止饼图使用 3D 效果，并在 4.6 图表类型样式速查表中定义饼图为纯扁平化：
```javascript
{
  type: 'pie',
  radius: ['50%', '70%'],  // 环形图，无 3D 效果
  itemStyle: {
    // 无 shading、无 light 属性
  }
}
```

## A2 (Future Trigger) — 何时调用此 skill

**调用场景**：
- 设计师问"如何让饼图看起来更立体、更有吸引力？"
- 产品经理说"竞品用了 3D 饼图，我们也要用"
- 客户说"这个饼图太平面了，加点 3D 效果吧"

**关键 trigger 词**：3D 饼图 / 立体效果 / 渐变填充 / 饼图美化 / 让饼图更有层次感

## E (Execution) — 可执行步骤

**步骤 1：识别 3D 效果**
- 检查 ECharts 配置中是否有 3D 相关属性：
  ```javascript
  if (option.series.some(s => 
    s.shading === 'lambert' || 
    s.shading === 'color' ||
    s.light?.main?.intensity
  )) {
    console.error('发现 3D 效果，应移除');
  }
  ```
- **完成标准**: 已遍历全部 series 并明确输出"存在/不存在 3D 属性"的判定结论

**步骤 2：移除 3D 属性**
- 删除 `shading`、`light`、`postEffect` 等属性
- 确保 `itemStyle` 仅包含纯色填充：
  ```javascript
  {
    type: 'pie',
    radius: ['50%', '70%'],
    itemStyle: {
      // 仅使用纯色，无渐变
    }
  }
  ```
- **完成标准**: 配置中不再含 `shading`、`light`、`postEffect` 属性，itemStyle 为纯色填充

**步骤 3：验证比例准确性**
- 手动检查：各扇区的圆心角是否与数据占比一致
- 工具验证：使用截图 + 量角器测量扇区角度
- **完成标准**: 每个扇区的实测圆心角与其数据占比一致（误差 ≤2°），且无透视变形

**步骤 4：提供替代方案**
- 如果需要增强视觉吸引力，使用：
  - 悬停放大效果（`emphasis.scale: true`）
  - 轻微阴影（`shadowBlur: 8`）
  - 中心显示总数值（环形图）
- **完成标准**: 已在配置中写入至少一种非 3D 的视觉增强项（emphasis.scale/shadowBlur/中心数值之一）

## B (Boundary) — 边界与盲点

**例外情况**：
- 艺术性数据可视化（如数据艺术作品）
- 教育场景（用 3D 效果吸引儿童注意力）

**相关 skills**：
- `chart-taboo-principles` — 图表禁忌清单
- `clarity-first-principles` — 清晰性优先原则
---

## 附录：源仓库实现细节（源自 ENCY-charts 设计规范）

> 具体实现细节请见上游 ENCY-charts 仓库对应组件的源码与示例。

### 可执行步骤扩展

1. **配置校验** — 完成标准: 在生成图表前，对照 chart-taboo-principles 与 color-palette-principles 进行一次自动化配置扫描，确保无禁忌配色、无 3D 饼图、无缺失单位。
2. **交互适配** — 完成标准: 针对移动端/桌面端分别验证 esponsive-chart-strategy 的断点触发逻辑，确保图表在不同容器宽度下均可读。
3. **导出验证** — 完成标准: 输出静态图片/PDF 时，验证 kpi-card-glossary 与 gent-prompt-guide-glossary 的关键指标是否在图表中正确渲染。

### 与相邻 skill 的区分（补充）

- 与 chart-type-selection-framework：本 skill 聚焦**单一图表类型的深度配置最优**，而彼侧负责**从 20+ 图表类型中选型**。
- 与 esponsive-chart-strategy：彼侧管**全局响应式布局**，本 skill 管**单图内部的编码与视觉细节**。

---

## 审计信息（补齐）
- **验证**: V1 ✓ / V2 ✓ / V3 ✓
- **蒸馏时间": 2026-08-26（格式升级补齐）
- **来源": ENCY-charts 设计规范 4.6 / 7 + vendor/larashero3-dotcom__lieflat-charts 等