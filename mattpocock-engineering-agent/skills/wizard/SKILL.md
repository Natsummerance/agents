---
name: wizard
description: |
  交互式向导生成。需要人类手动执行的步骤时生成分步向导。 不适用于范围外任务。
invocation: Model-invoked
source_project: mattpocock/skills
tags: [engineering, wizard]
---

# wizard

## 描述

交互式向导生成。需要人类手动执行的步骤时生成分步向导。

## 触发条件

System.Collections.Hashtable.trigger

## 使用方式

由 agent 根据上下文自动调用

## 边界

仅在上述触发条件下调用；超出范围时推荐更合适的 skill。