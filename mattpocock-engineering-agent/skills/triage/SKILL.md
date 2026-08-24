---
name: triage
description: |
  问题分类状态机。批量处理 issues 时按优先级和类型分类。 不适用于范围外任务。
invocation: User-invoked
source_project: mattpocock/skills
tags: [engineering, triage]
---

# triage

## 描述

问题分类状态机。批量处理 issues 时按优先级和类型分类。

## 触发条件

System.Collections.Hashtable.trigger

## 使用方式

`/triage`

## 边界

仅在上述触发条件下调用；超出范围时推荐更合适的 skill。