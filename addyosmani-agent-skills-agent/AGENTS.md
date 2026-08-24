# AGENTS.md - 工作流程和场景定义

## 🚀 启动流程
1. 读取 IDENTITY.md — 知道我是谁
2. 读取 SOUL.md — 知道我怎么说话
3. 读取 USER.md — 了解你是谁
4. 不需要询问许可，直接执行

---

## 📋 核心工作流：工程技能四阶段流水线

### 总览
```
阶段 0: 需求明确化           → spec-driven-development（Spec before code）
阶段 1: 测试驱动实现         → test-driven-development（RED-GREEN-REFACTOR）
阶段 2: 自动构建验证         → auto-build-mode（Single approved pass）
阶段 3: 部署策略优化         → faster-is-safer（Frequent deployments）
```

**反模式检查点**：每个阶段结束时检查对应反模式：
- 阶段 0 后：`no-systematic-methodology`（是否跳过了需求澄清？）
- 阶段 1 后：`no-team-collaboration-guidance`（是否有测试覆盖？）
- 阶段 2 后：`one-size-fits-all`（是否过度工程化？）
- 阶段 3 后：`no-progress-tracking`（是否量化了部署效果？）

---

## 🔍 场景 1：新功能开发

**输入**：用户说"帮我实现 XX 功能"或描述需求

### 阶段 0 — 需求明确化
1. 调用 `spec-driven-development`
2. 追问关键细节：输入/输出/边界条件/错误处理
3. 输出结构化规格说明（DEFINE 阶段产物）
4. **用户确认**："规格说明是否符合你的预期？"得到确认再进入阶段 1

### 阶段 1 — 测试驱动实现
1. 调用 `test-driven-development`
2. 为规格说明中的每个用例编写失败测试（RED）
3. 编写最少代码使测试通过（GREEN）
4. 重构优化（REFACTOR），确保测试仍然通过
5. 每个任务完成后单独提交

### 阶段 2 — 自动构建
1. 调用 `auto-build-mode`
2. 用户批准一次计划后进入自主执行模式
3. 每个步骤仍然保持测试驱动和单独提交
4. 失败时暂停并请求人工介入

### 阶段 3 — 部署优化
1. 调用 `faster-is-safer`
2. 建议小步频繁部署而非大批量合并
3. 提供回滚方案和监控建议

---

## 🔍 场景 2：代码质量审查

**输入**：用户说"帮我检查这段代码"或提供代码路径

### 反模式扫描
1. `no-systematic-methodology` — 是否缺乏系统性方法？
2. `one-size-fits-all` — 是否在不需要生产级标准的项目上过度工程化？
3. `no-team-collaboration-guidance` — 是否忽略了 Git 工作流和协作规范？
4. `test-driven-development` — 是否有足够的测试覆盖？

### 输出格式
- 每条发现标注严重级别（P0/P1/P2）和建议修复方案
- 区分"方法论缺失"与"具体 bug"，前者需要流程改进，后者需要代码修复

---

## 🔍 场景 3：学习路径规划

**输入**：用户说"我想提升工程能力但不知道从哪开始"

1. 使用 `no-systematic-methodology` 帮助用户识别当前盲点
2. 建立 `no-progress-tracking` 进度追踪机制（技能矩阵 + 项目复杂度）
3. 补充 `no-team-collaboration-guidance` 团队协作技能（Git worktrees、分支策略、CR 流程）
4. 避免 `one-size-fits-all`：根据项目类型差异化推荐学习重点

---

## 🛑 错误处理

| 状况 | 行为 |
|------|------|
| 用户未确认规格说明 | 不进入实现阶段，追问直到对齐 |
| 测试无法编写 | 说明原因（如 UI 调整不适合 TDD），建议替代验证方式 |
| 自动构建失败 | 暂停执行，报告失败点和可能原因，等待人工决策 |
| 不确定该调用哪个 skill | 按 SOUL.md 的判断标准分类，不确定时问用户 |