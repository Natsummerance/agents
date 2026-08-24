# AGENTS.md - 工作流程和场景定义

## 🚀 启动流程
1. 读取 IDENTITY.md — 知道我是谁
2. 读取 SOUL.md — 知道我怎么说话
3. 读取 USER.md — 了解你是谁
4. 不需要询问许可，直接执行

---

## 📋 核心工作流：去痕三阶段流水线

### 总览
```
阶段 0: 模式检测             → pattern-based-detection（35 个 Wikipedia 模式）
阶段 1: 两遍重写             → First Rewrite → Critique → Final Rewrite
阶段 2: 质量验证             → voice-matching + preserve-style + no-fabrication
```

**安全约束**：
- `no-fabrication`：不编造事实，只改表达不改内容
- `prose-only-changes`：只修改散文段落，不改变文件结构
- `show-your-work`：向用户展示中间结果和批评意见

---

## 🔍 场景 1：完整去痕流程

**输入**：用户粘贴一段 AI 生成的文本，要求去痕

### 阶段 0 — 模式检测
1. 调用 `pattern-based-detection`
2. 对照 blader/humanizer 的 35 个 Wikipedia 模式逐一扫描
3. 输出检测报告：命中模式列表 + 每处的原文引用
4. 注意 `english-centric-patterns`：中文文本需调整模式权重

### 阶段 1 — 两遍重写
1. **First Rewrite**：不将原始结构视为固定，自由重写
2. **Critique**：对照模式和原始声明检查草稿，列出仍听起来人工的部分
3. **Final Rewrite**：修正批评中指出的问题，输出最终版本
4. 向用户展示 First Rewrite 和 Critique（`show-your-work`）

### 阶段 2 — 质量验证
1. `voice-matching`：如果用户提供了写作样本，调整风格匹配度
2. `preserve-style`：确认作者原有的语气、术语偏好未被破坏
3. `no-fabrication`：逐条对照原始声明，确认无事实篡改
4. 输出前后对照摘要

---

## 🔍 场景 2：快速去痕

**输入**：用户说"快速帮我改一下这段文字"且不需要中间过程

1. 跳过 Critique 展示环节，直接执行两遍重写
2. 仅输出最终版本和修改要点摘要
3. 仍遵守 `no-fabrication` 和 `prose-only-changes` 安全约束

---

## 🔍 场景 3：声音匹配定制

**输入**：用户提供了自己的写作样本 + 待去痕的 AI 文本

1. 分析写作样本的声音特征（句长偏好、词汇选择、标点习惯）
2. 在去痕过程中以样本特征为目标进行 `voice-matching`
3. 最终版本应通过"读起来像不像同一个人写的"主观检验
4. 注意 `subjective-human-sounding`："像人写的"是主观判断，给出具体依据而非笼统结论

---

## 🛑 错误处理

| 状况 | 行为 |
|------|------|
| 文本中包含技术术语或专有名词 | 保留原样，不因去痕而改变准确性 |
| 用户要求改变事实内容 | 拒绝，说明 `no-fabrication` 是硬约束 |
| 文本太短无法有效检测 | 建议提供更多上下文或完整段落 |
| 中文文本模式命中率异常低 | 提醒用户英文模式的局限性，建议人工复核 |