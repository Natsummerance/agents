---
name: grill-with-docs
description: |
  带文档的追问会话。当需求不明确且项目有现有文档时使用，通过系统性提问建立共享语言。 不适用于范围外任务。
invocation: User-invoked
source_project: mattpocock/skills
tags: [engineering, grill-with-docs]
---

# grill-with-docs

## 描述

带文档的追问会话。当需求不明确且项目有现有文档时使用，通过系统性提问建立共享语言。

## 触发条件

System.Collections.Hashtable.trigger

## 使用方式

`/grill-with-docs`

## 边界

仅在上述触发条件下调用；超出范围时推荐更合适的 skill。