# 阶段 6：Agent 组装

## 目标

将阶段 0-5 产出的 skills 自动组装成完整的 OpenClaw Agent，包括：
1. 生成 Agent 核心配置文件（AGENT.md、IDENTITY.md、SOUL.md、USER.md、TOOLS.md）
2. 创建运行时目录结构（agent/ + sessions/）
3. 注册到 openclaw.json
4. 重启 Gateway 并验证

## 输入

- `books/<slug>/` 目录下的完整产出：
  - 19 个 skills（每个含 SKILL.md + test-prompts.json）
  - INDEX.md（含引用关系图）
  - GLOSSARY.md（术语表）
  - DIGEST.md（精华长文）
  - verified.md（通过的候选单元）

## 输出

```
/root/.openclaw/workspace/agents/<agent-slug>/
├── AGENT.md              # Agent 核心配置
├── IDENTITY.md           # 身份定义
├── SOUL.md               # 行为准则
├── USER.md               # 用户画像
├── TOOLS.md              # 技术参考
├── README.md             # 快速启动指南
├── skills/               # 复制的 skills
│   ├── <skill-1>/
│   └── ...
└── docs/                 # 配套文档
    ├── INDEX.md
    ├── GLOSSARY.md
    └── DIGEST.md

/root/.openclaw/agents/<agent-slug>/
├── agent/
│   ├── models.json
│   └── plugins/{nvidia,openai}/catalog.json
└── sessions/
```

## 执行步骤

### 步骤 1：生成 Agent 元信息

从 BOOK_OVERVIEW.md 和 verified.md 提取：
- **AGENT_NAME**: 中文名称（如"数据可视化设计助手"）
- **AGENT_ID**: kebab-case ID（如"ency-charts-agent"）
- **DOMAIN**: 领域描述（如"数据可视化"）
- **ROLE_DESCRIPTION**: 角色描述
- **EXPERTISE_LIST**: 专业能力列表
- **EMOJI**: 表情符号

### 步骤 2：生成核心文件

按模板填充：
1. **AGENT.md** ← `templates/AGENT_ASSEMBLY.md.template`
2. **IDENTITY.md** ← 基于 AGENT.md 生成
3. **SOUL.md** ← 基于书籍核心价值观生成
4. **USER.md** ← 基于目标用户画像生成
5. **TOOLS.md** ← 列出所有 skills 和技术参考

### 步骤 3：复制 skills 和文档

```bash
# 复制 skills
cp -r books/<slug>/<skill-*> workspace/agents/<agent-slug>/skills/

# 复制文档
cp books/<slug>/{INDEX.md,GLOSSARY.md,DIGEST.md} workspace/agents/<agent-slug>/docs/
```

### 步骤 4：创建运行时目录

```bash
mkdir -p /root/.openclaw/agents/<agent-slug>/{agent/plugins/{nvidia,openai},sessions}
cp /root/.openclaw/agents/content-distiller/agent/models.json /root/.openclaw/agents/<agent-slug>/agent/
cp /root/.openclaw/agents/content-distiller/agent/plugins/nvidia/catalog.json /root/.openclaw/agents/<agent-slug>/agent/plugins/nvidia/
cp /root/.openclaw/agents/content-distiller/agent/plugins/openai/catalog.json /root/.openclaw/agents/<agent-slug>/agent/plugins/openai/
```

### 步骤 5：注册到 openclaw.json

使用 Python 脚本修改配置：
```python
import json

data = json.load(open('/root/.openclaw/openclaw.json'))
agents = data['agents']['list']

# 添加新 agent
new_agent = {
    "id": "<AGENT_ID>",
    "name": "<AGENT_NAME>",
    "workspace": f"/root/.openclaw/workspace/agents/<agent-slug>",
    "agentDir": f"/root/.openclaw/agents/<agent-slug>/agent",
    "model": "enn/glm-4.7",
    "identity": {
        "name": "<AGENT_NAME>",
        "emoji": "<EMOJI>"
    }
}
agents.append(new_agent)

# 添加到 main 和 content-distiller 的 allowAgents
for a in agents:
    if a['id'] in ['main', 'content-distiller']:
        allow = a.setdefault('subagents', {}).setdefault('allowAgents', [])
        if '<AGENT_ID>' not in allow:
            allow.append('<AGENT_ID>')

json.dump(data, open('/root/.openclaw/openclaw.json', 'w'), indent=2, ensure_ascii=False)
```

### 步骤 6：重启 Gateway 并验证

```bash
# 重启 Gateway
gateway action=restart note="注册新 agent: <AGENT_NAME>"

# 等待 2 秒后验证
sleep 2
python3 -c "
import json
data = json.load(open('/root/.openclaw/openclaw.json'))
agents = [a for a in data['agents']['list'] if a['id'] == '<AGENT_ID>']
print(json.dumps(agents, indent=2, ensure_ascii=False))
"
```

### 步骤 7：测试调用

```python
# 通过 sessions_spawn 测试新 agent
sessions_spawn(
    agentId="<AGENT_ID>",
    context="isolated",
    label="测试新 agent",
    runtime="subagent",
    task="请自我介绍你的身份和职责"
)
```

## 质量检查清单

- [ ] AGENT.md、IDENTITY.md、SOUL.md、USER.md、TOOLS.md 全部生成
- [ ] 19 个 skills 全部复制到 workspace/agents/<agent-slug>/skills/
- [ ] INDEX.md、GLOSSARY.md、DIGEST.md 复制到 docs/
- [ ] 运行时目录结构正确（agent/models.json + plugins/）
- [ ] openclaw.json 中已注册新 agent
- [ ] 已添加到 main 和 content-distiller 的 allowAgents
- [ ] Gateway 已重启
- [ ] 子 agent 可以成功调用并返回正确结果
- [ ] Agent 名称为中文字符串（与其他 agent 一致）

## 常见错误模式

### 错误 1：忘记更新 identity.name
**症状**：agent 自我介绍时仍显示英文名称  
**修复**：同时修改 openclaw.json 中的 `identity.name` 和 AGENT.md/IDENTITY.md 中的 Name 字段

### 错误 2：忘记添加到 allowAgents
**症状**：sessions_spawn 返回 "agentId is not allowed"  
**修复**：将新 agent ID 添加到 main 和当前 agent 的 subagents.allowAgents 列表

### 错误 3：运行时目录结构不完整
**症状**：Gateway 重启后 agent 无法加载  
**修复**：确保 agent/models.json 和 plugins/{nvidia,openai}/catalog.json 存在

## 自动化建议

未来可以将此流程封装为 `assemble-agent` 技能，实现一键式 Agent 组装：
1. 读取 books/<slug>/ 的完整产出
2. 自动生成所有配置文件
3. 自动注册到 openclaw.json
4. 自动重启 Gateway 并验证
