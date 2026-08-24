---
name: handoff
description: |
  会话交接文档。将当前工作状态移交给另一个 agent 或开发者。 不适用于范围外任务。
invocation: User-invoked
source_project: mattpocock/skills
tags: [engineering, handoff]
---

# handoff

## 描述

会话交接文档。将当前工作状态移交给另一个 agent 或开发者。

## 触发条件

System.Collections.Hashtable.trigger

## 使用方式

`/handoff`

## 边界

仅在上述触发条件下调用；超出范围时推荐更合适的 skill。