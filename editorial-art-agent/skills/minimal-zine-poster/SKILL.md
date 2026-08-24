---
name: minimal-zine-poster
description: |
  将主题、短文、文章想法、物品、氛围、照片或参考图片转化为纸质质感的极简 Zine 海报。大面积负空间 + 小型编辑拼贴/焦点元素 + 实验性排版 + 一个明确的色彩强调。支持生成模式、参考分析模式和仅 prompt 模式。
source_project: LiamGvchi/gc-minimal-zine-poster
tags: [zine, poster, minimal, paper-texture, editorial]
related_skills: ["photo-relic-editorial", "gathered-scenes-zine"]
---

# Minimal Zine Poster — 极简 Zine 海报

## R (Reading) — 核心方法

将内容或视觉参考转化为连贯的纸质海报系统。核心视觉语言：大负空间、小焦点元素、实验排版、单一色彩强调。

## I (Interpretation) — 方法论骨架

**五种路由模式**：
1. **Generate Mode**（默认）：主题/文字 → 视觉隐喻 → prompt → 生成图像
2. **Photo Input Mode**：用户照片影响输出 → 分类角色 → 传入生成 → 质检
3. **Reference Analysis Mode**：分析参考图风格 → 提取可复用样式规则
4. **Prompt-only Mode**：用户明确只要 prompt 不要图像
5. **Analyze + Generate**：先分析参考，再用提取的系统生成新海报

**照片角色分类**：
| 角色 | 判断依据 |
|------|----------|
| 编辑目标 | "把这张照片做成海报"/"基于这张图改" |
| 参考图 | "参考这张图的风格" |
| 辅助插入 | "把照片里的这个人放进去" |

## A (Application) — 照片保留级别

| 级别 | 含义 |
|------|------|
| High | 保留身份/面部结构/身体比例/姿态/产品几何/轮廓/可辨识色彩 |
| Medium | 保留主体和定义特征，允许裁切/缩放/调色变化 |
| Low | 仅参考视觉语法或氛围，不保留源主体 |

## B (Boundary) — 边界

- ✅ 做：主题/照片 → Zine 海报 / 风格分析
- ❌ 不做：数据可视化 / UI 设计 / 无源凭空创作摄影