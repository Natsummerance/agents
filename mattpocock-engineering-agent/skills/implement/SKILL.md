---
name: implement
description: |
  实现工单。根据已有的 specs/tickets 执行实现，内部驱动 TDD 流程。 不适用于范围外任务。
invocation: User-invoked
source_project: mattpocock/skills
tags: [engineering, implement]
---

# implement

## 描述

实现工单。根据已有的 specs/tickets 执行实现，内部驱动 TDD 流程。

## 触发条件

System.Collections.Hashtable.trigger

## 使用方式

`/implement`

## 边界

仅在上述触发条件下调用；超出范围时推荐更合适的 skill。