---
name: improve-codebase-architecture
description: |
  架构改进扫描。定期扫描代码库中的架构债务并提出改进建议。 不适用于范围外任务。
invocation: User-invoked
source_project: mattpocock/skills
tags: [engineering, improve-codebase-architecture]
---

# improve-codebase-architecture

## 描述

架构改进扫描。定期扫描代码库中的架构债务并提出改进建议。

## 触发条件

System.Collections.Hashtable.trigger

## 使用方式

`/improve-codebase-architecture`

## 边界

仅在上述触发条件下调用；超出范围时推荐更合适的 skill。