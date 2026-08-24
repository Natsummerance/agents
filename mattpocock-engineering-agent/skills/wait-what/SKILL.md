---
name: wait-what
description: |
  消息重述。当消息没有传达到位时用不同方式重述。 不适用于范围外任务。
invocation: User-invoked
source_project: mattpocock/skills
tags: [engineering, wait-what]
---

# wait-what

## 描述

消息重述。当消息没有传达到位时用不同方式重述。

## 触发条件

System.Collections.Hashtable.trigger

## 使用方式

`/wait-what`

## 边界

仅在上述触发条件下调用；超出范围时推荐更合适的 skill。