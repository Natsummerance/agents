---
name: grilling
description: |
  通用追问原语。被其他 user-invoked skills 调用的底层追问能力。 不适用于范围外任务。
invocation: Model-invoked
source_project: mattpocock/skills
tags: [engineering, grilling]
---

# grilling

## 描述

通用追问原语。被其他 user-invoked skills 调用的底层追问能力。

## 触发条件

System.Collections.Hashtable.trigger

## 使用方式

由 agent 根据上下文自动调用

## 边界

仅在上述触发条件下调用；超出范围时推荐更合适的 skill。