---
name: banner-design
description: |
  为社交媒体、广告位、Web Hero 与印刷品设计单张 banner/封面图/hero 图，一次产出多个艺术方向方案并按平台精确尺寸导出。触发场景：用户要"做一张 XX 平台的 banner/封面图/hero 图"、社媒头图/频道封面、广告投放素材、官网 hero 主视觉。不适用于：成套设计系统、design token 体系、整站页面样式架构（走 design-system-generator），也不做视频剪辑与动效视频。
source_project: nextlevelbuilder/ui-ux-pro-max-skill
tags: [banner, social-media, hero-image, art-direction, creative-assets]
---

# Banner Design（单张素材多艺术方向设计器）

## R (Reading) — 源项目核心设计

> "Design banners across social, ads, web, and print formats. Generates multiple art direction options per request with AI-powered visual elements."
> "Safe zones: critical content in central 70-80% of canvas"; "CTA: one per banner, bottom-right, min 44px height, action verb"; "Typography: max 2 fonts, min 16px body, ≥32px headline"; "Text ratio: under 20% for ads (Meta penalizes heavy text)".

（来源：`cli/assets/skills/banner-design/SKILL.md` 与 `cli/assets/skills/banner-design/references/banner-sizes-and-styles.md`）

## I (Interpretation) — 方法论骨架

这是一个**单张素材流水线**方法，核心洞察是：banner 设计不是"凭感觉画一张"，而是"锁画布→选方向→搭骨架→分离图文→机械校验→按规格导出"，且默认并行产出多个艺术方向供比稿，而非押注单一方案。

1. **平台约束先行**：尺寸/比例/安全区由平台硬性决定（如 Twitter/X 头图 1500×500、YouTube 频道图 2560×1440 内含 1546×423 安全区、Instagram Story 1080×1920），先锁定画布再谈创意。
2. **多艺术方向并行**：从 22 种风格库（Minimalist/Bold Typography/Gradient/Photo-Based/Glassmorphism/Neon/Editorial 等）中选 2~3 种互补方向各出一稿，降低单点审美风险。
3. **三区视觉层级**：顶部放 logo 或主价值主张，中部是支撑信息+主视觉，底部收 CTA——阅读动线自上而下一次讲清"是什么/为什么/下一步"。
4. **文字与图像分离**：AI 只生成无字底图（prompt 明确写 no text），标题/副文/CTA/logo 一律以 HTML/CSS 叠加层实现，保证文案可改、可迭代、可本地化。
5. **可判定校验清单**：广告文字占比 <20%、单一 CTA 右下且 ≥44px、对比度 ≥4.5:1、正文字号下限——每条都能机械验证而非主观评审。
6. **导出即规格**：文件名编码风格+尺寸（`{style}-{width}x{height}.png`），超 5MB 自动压缩，交付物直接可用。

## A1 (Past Application) — 源项目的典型应用

### 案例: SaaS 官网 hero 主视觉全链路产出
- **输入**: "Website hero, minimalist style, 1920×600"，未指定方案数量（走默认 3 个）。
- **做法**: 锁定 1920×600~1080 hero 画布 → 从风格库选 Minimalist / Gradient / Geometric 三个互补方向 → HTML/CSS 搭三区骨架并把关键内容压进中央 80% 安全区 → AI 以 `--aspect-ratio 3:2 --size 4K` + prompt "minimalist flat design, no text" 生成无字底图 → 叠加标题/副文/CTA → 截图导出 PNG 并排呈现。
- **结果**: 三张可直接上线的 hero PNG（`{style}-1920x600.png` 命名），用户基于并排预览选定一个方向进入迭代；全程文字层保持可编辑，换 slogan 无需重新生成图像。

## A2 (Future Trigger) ★ 触发场景

### 用户会在什么情境下需要
1. 社媒运营换装："公众号/Twitter/LinkedIn 的头图该换新了，给我出几个风格方案挑挑"——需要多方向比稿而非单稿定生死。
2. 广告投放备料：Google Display（300×250 / 728×90 / 970×250 等规格）缺一套能过审的素材，必须满足文字占比与点击目标规则。
3. 官网上线/改版：hero 区只有灰底占位图，需要一张与产品调性匹配的主视觉，且上线后大概率还要换文案迭代。

### 语言信号
- "做一张 XX 平台的 banner/封面图/hero 图"
- "头图 / 封面 / 开屏 / 横幅 / 易拉宝 帮我设计一下"
- "给我出几版 / 几个风格对比一下"
- "1500×500 / 1080×1080 / 9:16 这个尺寸怎么排"
- "配图 + 标语 + 按钮要出现在图里"

### 与 design-system-generator 的区分
- 本 skill 解决**一次性、特定尺寸的单张素材**：输入是平台+内容+风格偏好，输出是成品图片；design-system-generator 解决**跨页面长期复用的三层 token 架构**：输出是 CSS 变量/DTCG JSON。用户说"做一张图"来这里，说"建一套体系/规范/token"去那里。
- 二者可组合：项目已有 token 体系时，先读 design token 再注入品牌变量画 banner，保证素材与产品视觉一致；但注入动作属于本 skill，token 的生成与治理永远归 design-system-generator。

## E (Execution) — 可执行步骤

1. **需求收集与画布锁定** — 问清用途（社媒封面/广告/hero/印刷）、平台、内容要素（标语/副文/CTA/logo 位）、品牌约束与方案数量（默认 3）。完成标准: 一句话能写出"为 X 平台 Y×Z 尺寸的 W 用途 banner 出 N 个方案"，且尺寸数值有平台出处。
2. **艺术方向研究** — 从 22 种风格库中选 2~3 种互补方向，辅以参考检索（"[purpose] banner design [style]" 类查询）。完成标准: 每个方向有一句话选型理由并对应到行业/调性，无重复近似方向。
3. **版式骨架搭建** — 按 3-zone 规则布局（顶部价值主张、中部支撑信息+主视觉、底部 CTA），关键内容全部落在中央 70-80% 安全区，避开边缘 50-100px。完成标准: 线框中标出三区与安全区边界，无任何关键元素越界。
4. **视觉生成与文字排版** — AI 生成无字底图（prompt 含风格/光影/构图/色板 + "no text, no letters"），HTML/CSS 层排版文字：≤2 字体、正文 ≥16px、标题 ≥32px、对比度 ≥4.5:1。完成标准: 底图无内嵌文字，每个方案为独立可打开文件，文字层可编辑。
5. **平台规则校验** — 逐项核查：广告文字占比 <20%、单一 CTA 位于底部终端区且 ≥44px 高、动作动词开头、移动端点击区可达。完成标准: 校验清单逐项打勾，违规项为零或附书面豁免理由。
6. **多尺寸导出** — 按平台精确像素导出 PNG，命名 `{style}-{width}x{height}.png`（时效性活动加日期前缀），>5MB 自动压缩。完成标准: 文件名符合约定、实际像素与目标平台完全一致、体积达标。
7. **并排呈现与迭代** — 并排展示所有方案的风格名、预览图、设计依据与文件路径，按反馈定点修改直至定稿。完成标准: 用户对某一方案给出明确采纳或具体修改指令，无悬空方案。

## B (Boundary) — 边界

### 不适用场景（≥2条）
- 成套设计系统、design token 三层架构、暗色主题体系、跨页面样式规范 → 走 design-system-generator（体系化 token vs 本 skill 的单张素材）。
- 视频剪辑、动态 banner/动效视频制作 → 上游明示不处理，属视频类工作流。
- 整站页面布局、组件实现与交互逻辑编码 → 本 skill 止步于单张视觉成品，不做页面级 UI 工程。

### 已知局限 / 失败模式（≥1条真实的）
- **版权与素材授权核查**：AI 生成底图的商用授权取决于所用的生成服务条款，第三方参考素材必须确认许可状态（CC0/已购授权/自有素材）后方可商用，不得默认"网上的图随便用"；含人物肖像、商标元素的素材需额外排查。
- 平台规则随政策漂移：Meta 对重文字广告的惩罚口径、各平台安全区数值会调整，发布前应以平台最新文档复核，本 skill 内置数值仅为基线。
- 参考灵感检索依赖浏览器环境；无浏览器时退化为纯风格库选型，方向的"新颖度"下降但仍可交付。
- 极端比例（如 LinkedIn 公司页 ~6:1 超长横幅）下三区规则会被压缩成两区甚至单行，需人工降级处理而非套模板。

## 相关 skills
- composes-with: design-system-generator（已有 token 体系时注入品牌变量，保证 banner 与产品视觉一致）
- contrasts-with: design-system-generator（单张创意素材成品图 vs 体系化三层 token 架构）

---

## 审计信息
- **验证**: V1 ✓ / V2 ✓ / V3 ✓
- **蒸馏时间**: 2026-08-25；**来源**: local `upstream/nextlevelbuilder__ui-ux-pro-max-skill/` 下 `cli/assets/skills/banner-design/SKILL.md`、`cli/assets/skills/banner-design/references/banner-sizes-and-styles.md`、根 `README.md`
