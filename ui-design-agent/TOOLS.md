# TOOLS.md - 技术参考

## 工具权限

### READ 权限
read_file / list_dir / grep / glob / ask_user

### WORKSPACE_WRITE 权限
write_file / edit_file / mkdir / apply_patch / run_tests

---

## Skills 清单

| Skill | 类型 | 触发条件 |
|-------|------|----------|
$(($skills | ForEach-Object { "| **$_** | Framework | 见 SKILL.md description |" }) -join "`n")

---

## 质量检查清单

- [ ] 输出基于源文本而非记忆
- [ ] 每个 skill 的触发条件已明确定义
- [ ] 结果经过自检
