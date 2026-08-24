# Content Distiller Agent 设置指南

## 📦 项目结构

```
content-distiller/
├── IDENTITY.md                    # Agent 身份定义
├── SOUL.md                        # 核心价值观和行为准则
├── AGENTS.md                      # 工作流程和场景定义
├── TOOLS.md                       # 工具清单和使用规范
├── USER.md                        # 用户画像和协作方式
├── README.md                      # 项目说明文档
├── QUICKSTART.md                  # 快速开始指南
├── EXAMPLES.md                    # 使用示例
├── SETUP.md                       # 设置指南（本文件）
├── PROJECT_SUMMARY.md             # 项目总结
├── SKILL.md                       # 核心技能包
├── methodology/                   # RIA-TV++ 方法论详解 (8 个文件)
├── extractors/                    # 5 个 extractor prompts
├── templates/                     # 6 个输出模板
└── skills/content-distillation/   # 核心技能包（同上）
```

**总计**: 27+ 个文件

---

## 🚀 安装步骤

### 步骤 1: 确认 Agent 已创建
Agent 已创建在 `/root/.openclaw/workspace/agents/content-distiller/`

### 步骤 2: 验证文件完整性
```bash
cd /root/.openclaw/workspace/agents/content-distiller
ls -la *.md
ls -la methodology/*.md
ls -la extractors/*.md
ls -la templates/*.template
```

### 步骤 3: 测试 Agent
```bash
# 在 OpenClaw 中切换到 content-distiller agent
/agent switch content-distiller

# 或者直接调用
用户: 帮我拆《穷查理宝典》
```

---

## 🔧 配置选项

### 并行度配置
在 `TOOLS.md` 中可以调整并行 sub-agents 的数量（默认 5 个）。

### 分块大小配置
在 `TOOLS.md` 中可以调整长文本分块的大小（默认 8000 字）。

### 验证阈值配置
在 `methodology/03-stage1.5-triple-verify.md` 中可以调整三重验证的阈值。

---

## 📊 监控和调试

### 查看流水线状态
```bash
cat books/<book-slug>/PIPELINE_STATE.md
```

### 查看候选池
```bash
ls -la books/<book-slug>/candidates/
```

### 查看验证结果
```bash
cat books/<book-slug>/verified.md
ls -la books/<book-slug>/rejected/
```

### 查看测试结果
```bash
cat books/<book-slug>/<skill-slug>/test-results.md
```

---

## 🔄 更新和维护

### 更新方法论
```bash
cd /tmp/cangjie-skill-sandbox
git pull
cp -r methodology/* /root/.openclaw/workspace/agents/content-distiller/methodology/
cp -r extractors/* /root/.openclaw/workspace/agents/content-distiller/extractors/
cp -r templates/* /root/.openclaw/workspace/agents/content-distiller/templates/
```

---

## 🐛 常见问题排查

### 问题 1: Agent 无法启动
**解决**: 检查文件权限 `chmod 644 *.md`

### 问题 2: 并行 sub-agents 失败
**解决**: 降级为串行执行，修改 AGENTS.md 中的并行逻辑

### 问题 3: 断点续跑失效
**解决**: 检查 PIPELINE_STATE.md 是否存在且格式正确

### 问题 4: Skills 无法激活
**解决**: 检查 skills 是否已安装到 ~/.openclaw/skills/

---

## 📚 相关资源

- **原始项目**: https://github.com/kangarooking/cangjie-skill
- **官方网站**: https://cangjie-skill.com/
- **OpenClaw 文档**: https://docs.openclaw.ai

---

**设置完成！现在可以开始使用 Content Distiller Agent 了！** 🎉
