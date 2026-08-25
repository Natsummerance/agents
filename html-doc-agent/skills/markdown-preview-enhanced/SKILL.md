---
name: markdown-preview-enhanced
description: |
  VS Code 内 Markdown 增强预览方法论：双栏实时预览与自动滚动同步，KaTeX/MathJax 数学公式、Mermaid/
  PlantUML/流程图时序图、可执行 code chunk（含 LaTeX/TikZ）、外部文件导入、TOC 目录、front-matter，
  并经 Puppeteer/pandoc 导出 PDF/PNG/JPEG/HTML/ePub。当用户说「Markdown 预览不出公式」「mermaid 图
  渲染失败」「md 里嵌代码块运行」「把笔记导出 PDF」，且工作对象是既有 Markdown 文件的书写与导出时使用。
  不适用于：让 AI 把内容重构成设计化 HTML 发布页（改用 agentic-html-editor）。
source_project: shd101wyy/markdown-preview-enhanced
tags: [markdown-preview-enhanced, markdown, vscode, 预览渲染, 蒸馏技能]
---

# Markdown Preview Enhanced · Markdown 渲染预览增强

## R (Reading) — 上游原文

> "**Markdown Preview Enhanced** is an extension that provides you with many useful functionalities such as automatic scroll sync, math typesetting, mermaid, PlantUML, pandoc, PDF export, code chunk, presentation writer, etc."
>
> — 上游 README.md（shd101wyy/markdown-preview-enhanced）

上游 docs/README.md 补全能力面："Import external files… Export PDF, PNG, and JPEG by Puppeteer; Export beautiful HTML (mobile device supported); Compile to GitHub Flavored Markdown; Customize Preview CSS; TOC generation; Flowchart / Sequence diagram and many other kinds of graphs; Embed LaTeX, render TikZ, Chemfig etc."

## I (Interpretation) — 方法论骨架

1. **定位是书写伴侣而非出版引擎**：左源码右预览的双栏结构，核心价值是「所见即所得地确认我的 md 写对了没有」——渲染忠实于内容本身，不重设计版面。
2. **滚动同步是一切的前提**：ctrl+shift+m 开预览后源码与预览双向自动定位，长文档里公式/图表错误能秒级回溯到对应行；ctrl+shift+s 手动强制同步兜底。
3. **三层增强栈各司其职**：①数学层 KaTeX/MathJax 渲染 $...$/$$...$$；②图表层 mermaid/plantuml/flowchart/sequence 用代码块声明图型；③执行层 code chunk 让 python/bash 等代码块真的跑起来并把输出/图表嵌进预览（shift+enter 运行当前块、ctrl+shift+enter 跑全部），另支持 LaTeX/TikZ/Chemfig 内嵌编译。
4. **文档可以组装**：@import 语法导入外部 md/csv/图片文件拆分管理长文；front-matter 声明元信息；footnote/task list/GFM 兼容保证跨平台粘贴不碎。
5. **导出走两条管线**：轻量导出经 Puppeteer 出 PDF/PNG/JPEG 与移动端友好的 HTML；重量转换交给外部 pandoc/prince/eBook 工具链出 LaTeX/ePub——先想清楚读者拿什么介质，再选管线。
6. **可定制是逃生舱**：自定义预览 CSS（style.less）调整观感，parser 可扩展新语法；默认样式不够用时先定制再换工具。

## A1 (Past Application) — 源项目典型应用

### 案例: 算法笔记的数学公式渲染
- **输入**: 含大量 $O(n\log n)$ 行内公式与推导块的学习笔记
- **做法**: ctrl+shift+m 打开预览启用 math typesetting，滚动同步逐段核对公式语法
- **结果**: 公式实时正确渲染，笔误的 LaTeX 语法在预览中立刻暴露并修正

### 案例: 架构文档图文混排并导出分享
- **输入**: 一份含系统架构说明的 Markdown 文档，需要嵌入流程图和一段数据统计脚本
- **做法**: mermaid 代码块画架构图，python code chunk 计算统计量输出表格（shift+enter 执行），最后 Puppeteer 导出 PDF
- **结果**: 单份 PDF 内图文数齐全，直接发团队评审，无需截图拼贴

### 案例: 长篇教程的组装与放映
- **输入**: 分散在多个文件里的课程章节 md
- **做法**: @import 组装外部文件 + front-matter 声明元信息 → presentation writer 转成可放映页面，esc 呼出侧栏 TOC 导航
- **结果**: 一份既能在编辑器里维护、又能直接放映分享的课程材料

## A2 (Future Trigger) ★ 触发场景

### 用户会在什么情境下需要
1. 在 VS Code 写 Markdown 时数学公式、mermaid 图、脚注等元素渲染不出来或显示错乱
2. 想在笔记里嵌入可执行代码块跑出结果，或把大文档拆成多个外部文件组装
3. 要把手头 md 笔记导出成 PDF/图片/HTML/ePub 分发给不用编辑器的人

### 语言信号
- "我的 Markdown 预览不支持数学公式怎么办"
- "VS Code 里怎么让 mermaid 图渲染出来"
- "把这份 md 笔记导出成 PDF / 带 scroll sync 的实时预览"
- "笔记里的代码块想直接运行看到结果 / 长文档怎么拆文件组装"

### 与同 agent 兄弟 skill 的区分
- 与 `agentic-html-editor` 的区别：本 skill **忠实渲染既有 Markdown 内容**（写作时的预览校对与格式保真导出）；agentic-html-editor 让 AI 把输入**重构为设计化成品 HTML 页面**用于发布。用户要的是「读得舒服」→ 本 skill；要的是「看起来像设计师做的」→ 转 agentic-html-editor。

## E (Execution) — 可执行步骤

1. **环境就绪** — 完成标准: VS Code 已安装 MPE 扩展，打开 .md 文件按 ctrl+shift+m 右侧出现预览窗格
2. **增强语法落笔** — 完成标准: 数学公式用 $...$/$$...$$、图表用 mermaid/plantuml 围栏块、可执行块用 code chunk 语法，各自在预览中正确渲染
3. **滚动同步校验** — 完成标准: 在长文档两端各跳转一次，源码与预览定位保持一致（必要时 ctrl+shift+s 强制同步）
4. **外部资源接入** — 完成标准: @import 引用的子文档/CSV/图片路径全部解析成功并在预览可见，无破图
5. **导出执行** — 完成标准: 经 Puppeteer/pandoc 按目标格式（PDF/HTML/PNG/ePub）落盘，打开抽查排版与公式无损
6. **样式定制（可选）** — 完成标准: style.less 修改生效且不破坏默认元素的渲染语义

## B (Boundary) — 边界

### 不适用场景
- 要生成全新设计的 HTML 页面/公众号排版/落地页原型 → `agentic-html-editor`
- 非 VS Code 环境（Atom 版已停止维护）；纯浏览器端的协作式 md 编辑不在本项目范围
- 需要 PowerPoint/PPTX 演示文件的正式交付（presentation writer 输出的是 HTML 放映件）
- 团队协作文档平台（Notion/语雀等）内的渲染定制——本项目作用于本地编辑器中的 md 文件

### 已知局限 / 失败模式
- 主仓库只承载文档，扩展本体在 shd101wyy/vscode-markdown-preview-enhanced，报 issue 需去那边
- pandoc/prince/eBook 导出依赖对应外部程序已安装，缺失时该管线静默不可用
- code chunk 执行依赖本机相应语言运行时与网络（如需拉包），沙箱隔离有限，勿跑不受信代码
- mermaid/plantuml 等图表渲染随扩展内置版本更新，个别新语法可能滞后于官方上游

## 相关 skills

- contrasts-with: agentic-html-editor（忠实渲染预览 vs AI 重构生成成品页）
- composes-with: agentic-html-editor（MPE 校对内容正确性 → html-anything 包装发布外观的两段式管线）

---

## 审计信息

- **验证**: V1 ✓（README.md 与 docs/README.md 的功能清单相互印证）/ V2 ✓（可回答「公式/图表/导出分别走哪层能力」的问题）/ V3 ✓（三层增强栈+双导出管线的分工是非常识性结构）
- **蒸馏时间**: 2026-08-25
- **来源文件清单**: upstream/shd101wyy__markdown-preview-enhanced/{README.md, docs/README.md}；操作快捷键与工作流细节基于仓库描述蒸馏（docs 子页未逐一展开）
