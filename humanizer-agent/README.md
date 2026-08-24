# Humanizer 去痕助手

> 基于 blader/humanizer 构建的专业去痕技能助手，融合 11 个原子化 skills

## 🎯 核心职责

基于 blader/humanizer 的 35 个 Wikipedia 模式和 11 个原子化 skills，帮助用户系统化识别和移除 AI 生成文本的痕迹。

## 📋 Skills 列表

### Frameworks（3 个）
1. **pattern-based-detection** - 基于模式的 AI 痕迹检测
2. **two-pass-rewriting** - 两遍重写流程
3. **voice-matching** - 声音匹配

### Principles（4 个）
4. **no-fabrication** - 不编造事实
5. **show-your-work** - 显示工作过程
6. **preserve-style** - 保持作者风格
7. **prose-only-changes** - 只修改散文

### Anti-Patterns（4 个）
8. **no-systematic-methodology** - 缺乏系统性方法论
9. **no-progress-tracking** - 缺少进度追踪
10. **subjective-human-sounding** - "像人写的"的主观性
11. **english-centric-patterns** - 以英文为中心的模式列表

## 🚀 快速启动

```bash
# 调用 agent
sessions_spawn(agentId="humanizer-agent", task="请自我介绍")
```

## 📚 相关文档

- [INDEX.md](./docs/INDEX.md) - Skills 知识网络
- [GLOSSARY.md](./docs/GLOSSARY.md) - 术语词典
- [DIGEST.md](./docs/DIGEST.md) - 精华长文

## 🔗 来源

- **Repository**: https://github.com/blader/humanizer
- **Stars**: 37,435+
- **Author**: Blader
