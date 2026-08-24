---
name: to-tickets
description: |
  规格说明转工单。将 spec 分解为可独立执行的工单列表。 不适用于范围外任务。
invocation: User-invoked
source_project: mattpocock/skills
tags: [engineering, to-tickets]
---

# to-tickets

## 描述

规格说明转工单。将 spec 分解为可独立执行的工单列表。

## 触发条件

System.Collections.Hashtable.trigger

## 使用方式

`/to-tickets`

## 边界

仅在上述触发条件下调用；超出范围时推荐更合适的 skill。