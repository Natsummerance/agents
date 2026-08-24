---
name: grill-me
description: |
  深度追问会话（非代码类）。当非代码需求不明确时使用，通过连续追问帮助用户理清思路。 不适用于范围外任务。
invocation: User-invoked
source_project: mattpocock/skills
tags: [engineering, grill-me]
---

# grill-me

## 描述

深度追问会话（非代码类）。当非代码需求不明确时使用，通过连续追问帮助用户理清思路。

## 触发条件

System.Collections.Hashtable.trigger

## 使用方式

`/grill-me`

## 边界

仅在上述触发条件下调用；超出范围时推荐更合适的 skill。