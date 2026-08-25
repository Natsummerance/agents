---
name: agentic-html-editor
description: |
  Agentic HTML 编辑器方法论：把 Markdown/CSV/Excel/JSON/笔记等任意输入，经本地已登录的 coding-agent CLI
  流式生成为「ship-ready」单文件 HTML 成品页——覆盖杂志文章、keynote deck、海报、简历、小红书/推文卡片、
  web 原型、数据报告、Hyperframes 视频帧九种交付面，并一键导出微信公众号/知乎/X 或下载 .html/.png。
  当用户要「把这份内容变成能直接发布的 HTML 页面」「公众号排版」「生成落地页/数据报告页」时使用。
  不适用于：编辑器内 Markdown 书写预览与忠实渲染（改用 markdown-preview-enhanced）。
source_project: nexu-io/html-anything
tags: [agentic-html-editor, html-generation, 内容发布, agent-cli, 蒸馏技能]
---

# Agentic HTML Editor · AI 生成可发布 HTML 页面

## R (Reading) — 上游原文

> "Markdown is the draft. HTML is what humans read. Your local agent writes it. … Local-first, zero API key, reuses the CLI session you already have logged in — 9 coding-agent CLIs auto-detected on your PATH (Claude Code · Cursor Agent · Codex · Gemini CLI · …), driven by 75 composable skill templates across 9 deliverable surfaces. One-click export to WeChat / X / Zhihu, or download `.html` / `.png`."
>
> — 上游 README.md（nexu-io/html-anything）

README 同段给出判断依据："HTML is the final form for humans. Markdown is just an intermediate state during writing." 以及质量红线："when generation finishes, the artifact is what your audience actually sees. No 'I'll touch it up later' pass."

## I (Interpretation) — 方法论骨架

1. **交付物哲学**：写作的中间态是 Markdown，读者拿到手的最终形态是设计化 HTML；生成的终点是「能直接发出去的成品」，不存在事后修补环节——这决定了每一步都要以发布标准验收。
2. **不自带 agent，复用本地会话**：启动时扫描 PATH（含 GUI 启动的 Node 通常漏掉的 ~/.local/bin 等目录）自动发现 claude/codex/cursor-agent/gemini 等 CLI，一个特权进程 spawn 子进程，JSON-line 作为线协议，零 API key——已有订阅就是算力。
3. **skill 即文件夹**：每个模板 = SKILL.md（frontmatter 声明 mode·scenario·surface·preview·design_system）+ example.html (+assets/references)，75 个模板 × 9 种 surface 按 mode×scenario 两轴组织进选择器。
4. **硬约束防 AI slop**：每个模板写死五条——CJK 优先字体栈（Noto Sans/Serif SC + Inter）、8px 基线网格、圆角柔影且不用纯黑纯白、对比度 ≥4.5 且交互元素有真实 :focus 态、必须用用户真实数据禁止 lorem ipsum。约束属于 prompt，不靠模型自觉。
5. **流式渲染即反馈回路**：POST /api/convert 走 SSE，agent stdout 的 JSON-line 文本增量实时 append 进沙箱 iframe srcdoc——用户看着页面被「打」出来，不满意随时中断重 prompt，不为整次生成买单。
6. **导出链路消灭二次排版**：juice 内联 CSS → 微信粘贴零修复；modern-screenshot 渲染 iframe 为 2× PNG 进剪贴板直投推文编辑器；知乎用 data-eeimg LaTeX 图片占位绕过 KaTeX 不渲染；另有 .html/.png 自包含下载。

## A1 (Past Application) — 源项目典型应用

### 案例: 公众号长文一键排版
- **输入**: 一篇 Markdown 格式的行业观察草稿
- **做法**: 选 doc-kami-parchment 暖羊皮纸编辑模板 → 本地 CLI 流式生成单文件 HTML → juice 内联 CSS 导出为微信兼容格式
- **结果**: 粘贴进公众号编辑器样式完整保留，无需任何二次排版修正

### 案例: CSV 销售数据变可视化报告页
- **输入**: 一份 Excel 导出的销售明细
- **做法**: 浏览器端 papaparse/xlsx 解析（不上传）→ 选 data-report surface 模板 → 以真实数据渲染图表报告页
- **结果**: 单页 HTML 数据报告，可直接下载 .png 分享到群聊或 .html 存档

### 案例: 发布会 keynote 网页化
- **输入**: 一份产品发布讲稿与品牌截图
- **做法**: 选 deck surface（如 Swiss International / Guizang Editorial 模板）→ 流式生成横滑放映件 → 左右键翻页、演讲备注、PDF 导出自带
- **结果**: 浏览器即放映厅的单文件 HTML deck，观感「像设计师做的」

## A2 (Future Trigger) ★ 触发场景

### 用户会在什么情境下需要
1. 手里有 Markdown 笔记/表格数据/原始想法，要变成「能直接发出去」的设计化网页而不是裸文本
2. 需要向微信公众号、知乎、X/微博/小红书等平台分发内容，且不想手工适配各平台排版规则
3. 已在终端登录过 claude/codex/gemini 等 CLI，想让本地 agent 流式生成页面并实时预览迭代

### 语言信号
- "把这段 markdown 转成漂亮的 HTML 页面，能直接发的"
- "帮我排个微信公众号版式 / 做一张小红书卡片"
- "生成一个 SaaS 落地页原型 / 数据报告页，单文件 HTML"
- "做个网页版 keynote，横滑翻页那种"

### 与同 agent 兄弟 skill 的区分
- 与 `markdown-preview-enhanced` 的区别：本 skill 是「AI 编辑器」——由 agent 把输入**重新生成为设计化成品页面**并可导出发布；markdown-preview-enhanced 是「预览增强」——在编辑器内**忠实渲染既有 Markdown**（数学/Mermaid/TOC），不做版面再创作。用户诉求是「看着舒服地读我写的 md」→ 转 markdown-preview-enhanced。

## E (Execution) — 可执行步骤

1. **判定交付面 surface** — 完成标准: 从九种 surface（文章/deck/简历/海报/社媒卡片/web 原型/数据报告/视频帧）中确定一种并向用户复述确认
2. **选择模板 skill** — 完成标准: 按 mode×scenario 锁定一个模板文件夹，其 SKILL.md 的硬约束清单已被读取并纳入生成要求
3. **收集真实输入** — 完成标准: 用户的 Markdown/CSV/JSON 已解析完毕，确认内容全部来自用户真实数据、无 lorem ipsum 占位
4. **流式生成 HTML** — 完成标准: CJK 字体栈/8px 基线/对比度≥4.5/focus 态四条约束逐条满足的单文件 HTML 在沙箱 iframe 中渲染完成
5. **预览迭代** — 完成标准: 用户在实时预览中认可成品，或中断后按新指令重新生成直至认可
6. **导出交付** — 完成标准: 按目标平台完成 juice/PNG/.html/.png 导出，粘贴到目标平台后零二次排版

## B (Boundary) — 边界

### 不适用场景
- 在 VS Code 里边写边看 Markdown、数学公式/Mermaid 图渲染、导出 PDF——这是阅读增强不是页面生成 → `markdown-preview-enhanced`
- 生产级 Web 应用工程开发（组件化、路由、状态管理、CI）——本 skill 只产出一次性内容页面，不替代前端工程
- 无本地 coding-agent CLI 或不愿复用其登录会话、必须走云端 API key 的场景

### 已知局限 / 失败模式
- 强依赖本机已安装且已登录的 coding-agent CLI；CLI 未检测到时整条管线不可用
- 多模板对比预览、Hyperframes→mp4 一键转码在上游仍属 in-progress，不能承诺可用
- /api/* 仅面向单机单操作者设计（Host 白名单防 DNS rebinding），公网直接暴露需自担风险
- 模板锁定的是版式骨架与硬约束，品牌级精细视觉仍可能需要人工微调 CSS；「ship-ready」以模板水准为天花板

## 相关 skills

- contrasts-with: markdown-preview-enhanced（AI 重构生成成品页 vs 编辑器内忠实渲染预览）
- composes-with: markdown-preview-enhanced（先在 MPE 中校对内容正确性，再用本 skill 包装成发布页面）

---

## 审计信息

- **验证**: V1 ✓（README 的 Why this exists/Six load-bearing ideas/Architecture 三节互证核心理念）/ V2 ✓（可回答「该选哪个 surface、导出微信走什么链路」等问题）/ V3 ✓（「交付物哲学+复用本地 CLI 会话+硬约束防 slop」组合是非常识性架构）
- **蒸馏时间**: 2026-08-25
- **来源文件清单**: upstream/nexu-io__html-anything/{README.md}；部分工作流细节基于仓库描述蒸馏（未逐行核对源码）
