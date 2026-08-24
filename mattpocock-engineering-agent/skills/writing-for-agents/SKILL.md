---
name: writing-for-agents
description: |
  面向 Agent 的写作。编写 skills、AGENTS.md 等 Agent 可读文档的最佳实践。 不适用于范围外任务。
invocation: Model-invoked
source_project: mattpocock/skills
tags: [engineering, writing-for-agents]
---

# writing-for-agents

## 描述

面向 Agent 的写作。编写 skills、AGENTS.md 等 Agent 可读文档的最佳实践。

## 触发条件

System.Collections.Hashtable.trigger

## 使用方式

由 agent 根据上下文自动调用

## 边界

仅在上述触发条件下调用；超出范围时推荐更合适的 skill。