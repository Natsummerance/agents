---
name: wayfinder
description: |
  大规模工作规划。当工作量超出单个 session 能承受的范围时进行分解和排期。 不适用于范围外任务。
invocation: User-invoked
source_project: mattpocock/skills
tags: [engineering, wayfinder]
---

# wayfinder

## 描述

大规模工作规划。当工作量超出单个 session 能承受的范围时进行分解和排期。

## 触发条件

System.Collections.Hashtable.trigger

## 使用方式

`/wayfinder`

## 边界

仅在上述触发条件下调用；超出范围时推荐更合适的 skill。