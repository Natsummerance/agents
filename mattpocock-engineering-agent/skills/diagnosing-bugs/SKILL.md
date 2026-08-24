---
name: diagnosing-bugs
description: |
  系统性调试。遇到难以定位的 bug 时，收集信息、形成假设、逐一验证。 不适用于范围外任务。
invocation: Model-invoked
source_project: mattpocock/skills
tags: [engineering, diagnosing-bugs]
---

# diagnosing-bugs

## 描述

系统性调试。遇到难以定位的 bug 时，收集信息、形成假设、逐一验证。

## 触发条件

System.Collections.Hashtable.trigger

## 使用方式

由 agent 根据上下文自动调用

## 边界

仅在上述触发条件下调用；超出范围时推荐更合适的 skill。