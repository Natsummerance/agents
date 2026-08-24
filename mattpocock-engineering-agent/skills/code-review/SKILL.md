---
name: code-review
description: |
  双轴代码审查：Standards（是否符合规范）+ Bugs（行为正确性）。PR 合并前或定期质量检查。 不适用于范围外任务。
invocation: Model-invoked
source_project: mattpocock/skills
tags: [engineering, code-review]
---

# code-review

## 描述

双轴代码审查：Standards（是否符合规范）+ Bugs（行为正确性）。PR 合并前或定期质量检查。

## 触发条件

System.Collections.Hashtable.trigger

## 使用方式

由 agent 根据上下文自动调用

## 边界

仅在上述触发条件下调用；超出范围时推荐更合适的 skill。