---
name: scientific-figures
description: |
  学术论文出版级 matplotlib 插图引擎：以 figures4papers house style 生成柱状对比、构成分解、趋势线、
  热力图、雷达图与多面板布局，统一 rcParams 风格层、语义化调色板与 PDF/SVG/高 DPI 矢量导出规范。
  当用户要做「论文 figure」「投稿用的出版质量图」「分组柱状图/训练曲线/heatmap」「和某篇 paper 的图同款风格」，
  且目标是印刷或期刊排版而非网页交互时使用。
  不适用于：网页扁平风商业 HTML 图表（改用 lieflat-charts）。
source_project: ChenLiu-1996/figures4papers
tags: [scientific-figures, matplotlib, publication, 学术图表, 蒸馏技能]
---

# Scientific Figures · 论文出版级插图引擎

## R (Reading) — 上游原文

> "The dominant house style is minimalist, high-contrast, and publication-oriented: `font.family = 'helvetica'`; `axes.spines.right/top = False`; DPI defaults `dpi=300` (dominant), `dpi=600` for very dense bar panels; `fig.tight_layout(pad=2)` is the default finishing pass. Use blue for 'proposed' or key method, green shades for related positives/improvements, pink/red shades for alternatives or contrasts, neutrals for baselines."
>
> — 上游 scientific-figure-making/references/design-theory.md（ChenLiu-1996/figures4papers）

上游 SKILL.md 划定边界："Covers publication-ready matplotlib figures for academic papers… Use when the user is finalizing or creating such figures in matplotlib. Do not use for interactive dashboards or web viz."

## I (Interpretation) — 方法论骨架

1. **风格是一层统一的 rcParams，不是每张图各调各的**：`apply_publication_style()` 一次性设定去顶/右脊、无框图例、字体回退栈 [Arial, Helvetica, DejaVu Sans]、字号层级（大面板对比柱 24pt + 轴线 3；紧凑子图 15–16pt + 轴线 2）——先立骨架再画内容。
2. **颜色承担语义角色而不是装饰**：蓝 #0F4D92/#3775BA 给主推方法，绿色阶 #DDF3DE→#8BCF8B 给渐进改进，红粉色阶 #F6CFCB→#B64342 给对照/基线，中性灰留给背景类目；消融实验用同一主色的 alpha 0.2–1.0 表达「完整度」，hatch 纹理保证灰度打印仍可分辨。
3. **布局服务于从左到右的阅读叙事**：多指标对比用超宽画布（如 45×12 或 28×6）防止纵向挤压；复杂多轴图单独开一块关轴面板只放图例，避免图例压住数据区；类目柱隐藏 x-tick 交给图例；y 轴手动收紧到相关区间突出差异。
4. **柱上直接标注精确值**：`annotate_bars()` 以大号字把科学计数值印在柱顶，让图脱离网格也能被精读——审稿人不用放大镜找数字。
5. **导出纪律是发表底线**：`finalize_figure(fig, path, formats=['png','pdf'], dpi=300, pad=...)` 统一收口，密集柱面升到 600；`svg.fonttype='none'` 保留可编辑矢量文字；批量/headless 场景先切 Agg 后端。
6. **helper 族保证一致性**：make_grouped_bar / annotate_bars / make_trend（含 fill_between 不确定带）/ make_heatmap / make_scatter 复用同一签名约定，长度校验不过直接报错，杜绝手写循环造成的风格漂移。
7. **欠规格先问再画**：比较对象、面板数量、颜色角色、分辨率或数据布局存在会影响成图的歧义时，先向用户确认再 finalize——出版图返工成本高于普通插图。

## A1 (Past Application) — 源项目典型应用

### 案例: ImmunoStruct 多指标方法对比（Nature Machine Intelligence 2026）
- **输入**: 多方法 × 3–4 项指标的量化得分表
- **做法**: 超宽 figsize 画 grouped bars，黑边 linewidth 加粗锐利分隔，柱顶 36pt 直接标注数值，dpi=600 应对高密度面板
- **结果**: 一眼读出各指标最优方法的发表级横幅对比图，随论文刊出于 Nature Machine Intelligence

### 案例: LM-Dispersion 训练动态趋势（ICML 2026）
- **输入**: 若干小模型的逐 epoch 性能序列
- **做法**: make_trend 限定 2–4 条主线、线宽 2–3 受控 alpha，fill_between 画不确定带，蓝=提出方法、红=基线
- **结果**: 干净可读的训练曲线主图，符合 ICML 正文排版尺寸

### 案例: VIGIL 多能力雷达对比（ECCV 2026）
- **输入**: 若干模型在多维度评测上的分数向量
- **做法**: 极坐标雷达图沿用与笛卡尔趋势图相同的线宽与标签纪律，控制系列数保证出版尺寸下可读
- **结果**: 一张能并排比较多模型能力的雷达对比图，进入 ECCV 论文正文

## A2 (Future Trigger) ★ 触发场景

### 用户会在什么情境下需要
1. 论文定稿阶段要把实验结果画成投稿质量的 figure（主图/消融图/附录图）
2. 要求「和 figures4papers 某 figure_* 项目同款风格」或复现某篇已发表论文的图面观感
3. 需要 PDF/SVG 矢量导出、300+ DPI、LaTeX 数学标签、多面板组合等印刷级规格

### 语言信号
- "帮我画一个论文用的分组柱状图/训练曲线/热力图，要 publication-quality"
- "投 ICML/NeurIPS/Nature 子刊，figure 得是矢量的"
- "用 matplotlib，风格和我之前那张 comparison 图保持一致"
- "画个雷达图对比这几个模型 / 多面板 subplot 组合图"

### 与同 agent 兄弟 skill 的区分
- 与 `lieflat-charts` 的区别：本 skill 产出 **matplotlib 静态学术插图**（印刷/期刊排版、矢量导出、语义配色服务论证），lieflat-charts 产出**浏览器阅读的扁平化商业 HTML 图表**（编辑设计感、动效与交互）。用户语境是公众号/周报/汇报 → 转 lieflat-charts。

## E (Execution) — 可执行步骤

1. **确认出版上下文** — 完成标准: 明确目标期刊/会议、单栏还是双栏宽度、必需输出格式（pdf/png/svg）与分辨率要求
2. **应用风格层** — 完成标准: apply_publication_style 已调用，spines/legend/font 设置与 house style 一致且全脚本只此一处配置
3. **分配语义配色** — 完成标准: 每条系列的色值都能说出角色（主方法蓝/改进绿/对照红/中性灰），灰度打印下类别仍可分辨（必要时加 hatch）
4. **编写绘图脚本** — 完成标准: 使用 make_* helper 组织图形，数据长度校验通过，脚本在 headless Agg 后端可完整跑通
5. **finalize 导出** — 完成标准: tight_layout(pad=2) 收口后按 formats 参数落盘 pdf+png，dpi 达标（密集柱 600），父目录自动创建
6. **目检复核** — 完成标准: 无标签重叠、图例不遮挡数据、多面板字号线宽一致、数学标签渲染正确，与既有 figure 放在一起风格无违和

## B (Boundary) — 边界

### 不适用场景
- Plotly/Altair/Bokeh 等 Web 交互可视化、探索性 EDA 草图（seaborn/pandas 够用即可）→ 网页交付改用 `lieflat-charts`
- 以 Illustrator/Figma 为主的信息图/示意图工作流，以及 3D 建模、GIS 地理制图主导的需求
- 非 matplotlib 工具链（如 R/ggplot2、MATLAB）的原生图表
- 需要动效/交互/hover 的演示场合——印刷媒介假设与本 skill 的全部导出规范绑死

### 已知局限 / 失败模式
- `use_tex=True` 依赖本机安装 LaTeX 环境，缺失时应退回 mathtext 而非报错中断
- 该 house style 是特定作者的美学锚点，未必匹配所有期刊模板（如双栏小图的字号需下调），套用前核对投稿指南
- 部分 schematic/teaser 类图并非端到端 Python 制作，只能作参考不能完全脚本复现
- 超宽画布（45×12 等）是为横幅对比设计，直接塞进单栏排版会失真，需按版面重设 figsize

## 相关 skills

- contrasts-with: lieflat-charts（学术出版 matplotlib 插图 vs 扁平商业 HTML 图表）
- composes-with: lieflat-charts（同一成果「论文插图 + 传播图表」双轨产出时互补使用）

---

## 审计信息

- **验证**: V1 ✓（SKILL.md/design-theory.md/api.md/demos.md 相互印证风格常量与函数契约）/ V2 ✓（可回答「新数据该用哪个 helper、什么 dpi 导出」等问题）/ V3 ✓（rcParams 风格层 + 语义调色板 + 导出收口的完整管线是非常识性工作流）
- **蒸馏时间**: 2026-08-25
- **来源文件清单**: upstream/ChenLiu-1996__figures4papers/{README.md, scientific-figure-making/SKILL.md, scientific-figure-making/references/design-theory.md, scientific-figure-making/references/api.md}
