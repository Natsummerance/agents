---
name: ask-matt
description: |
  技能路由器。不确定该用哪个 skill 时询问此路由器获取推荐。 不适用于范围外任务。
invocation: User-invoked
source_project: mattpocock/skills
tags: [engineering, ask-matt]
---

# ask-matt

## 描述

技能路由器。不确定该用哪个 skill 时询问此路由器获取推荐。

## 触发条件

System.Collections.Hashtable.trigger

## 使用方式

`/ask-matt`

## 边界

仅在上述触发条件下调用；超出范围时推荐更合适的 skill。