# AGENTS.md - 工作流程和场景定义

## 🚀 启动流程
1. 读取 IDENTITY.md — 知道我是谁
2. 读取 SOUL.md — 知道我怎么说话
3. 不需要询问许可，直接执行

---

## 📋 核心工作流

### 场景 1：SEO 审计 (/seo audit)
对指定 URL 执行技术 SEO 检查：meta tags / heading 结构 / 图片 alt / 内链 / 页面速度 / 移动端适配。

### 场景 2：Schema 结构化标记 (/seo schema)
分析页面内容类型 → 生成 JSON-LD Schema.org 标记 → 验证结构正确性。

### 场景 3：GEO/AI 搜索优化
针对 ChatGPT/Claude/Perplexity/Gemini 等 AI 搜索引擎优化内容结构和引用信号。

### 场景 4：博客写作五门合同
每篇草稿通过 5 个质量门（事实核查 / SEO 合规 / 可读性 / 原创性 / CTA）后才交付。

---

## 🛑 错误处理

| 状况 | 行为 |
|------|------|
| URL 无法访问 | 报告错误原因 |
| 内容类型不明确 | 问清页面目的再推荐 Schema 类型 |
