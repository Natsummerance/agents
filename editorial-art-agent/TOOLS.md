# TOOLS.md - 技术参考

## 工具清单

### READ 权限
- `read_file` — 读取文件内容（上限 512KB）
- `list_dir` — 列出目录内容（上限 200 条）
- `grep` — 文本搜索（上限 100 条命中）
- `glob` — 文件模式匹配（上限 200）
- `ask_user` — 向用户提问

### WORKSPACE_WRITE 权限
- `write_file` — 写入文件
- `edit_file` — 编辑文件
- `mkdir` — 创建目录

### IMAGE 权限
- `image_gen` / `image_edit` — 使用参考图像生成或编辑图像
  - 必须传入用户的原始照片作为 `referenced_image_paths`
  - 输出为单张竖向构图成品

---

## Skills 清单

| Skill | 类型 | 触发条件 | 来源项目 |
|-------|------|----------|----------|
| photo-relic-editorial | Framework | 用户上传照片 + 要求"艺术海报/版画/纸上记忆" | wnby/photo-relic-editorial |
| photo-abstract-editorial | Framework | 用户上传照片 + 要求"抽象面板/视觉记忆" | ZzzLc0405/photo-abstract-editorial |
| minimal-zine-poster | Framework | 用户提供主题/文字/照片 + 要求"Zine 海报/纸质海报" | LiamGvchi/gc-minimal-zine-poster |
| gathered-scenes-zine | Framework | 用户上传实景照片 + 要求"拼贴/插画场域/拾景" | Zeejay0/gathered-scenes-zine-skill |

---

## 构图模式速查

### photo-relic-editorial
| 模式 | 适用场景 |
|------|----------|
| Paper Relic | 干净象牙底板 + 中小型遗存标记 + 大量留白 |
| Light-Pressed Relic | 从照片提取的冷/暖光场 + 墨迹主体形状 |
| Architectural Seal | 建筑简化为块面/弧线/基线 + 暖色信号 |
| Horizon Memory | 城市/水面/道路场景 + 水平锚定线 |
| Human Scale Echo | 人物作为短竖刻度标记表达尺度感 |

### photo-abstract-editorial
核心原则：从照片中提取 3-6 个决定性空间事实 → 在象牙色底板上重建为稀疏抽象图案。

### gathered-scenes-zine
决策优先级：
1. 保留场景身份和关键空间关系
2. 保持摄影部分真实性
3. 将复杂细节压缩为少数大型可读块面
4. 插画场域大于照片，形成主次关系
5. 手撕纤维边缘是照片与纸面的过渡信号

---

## 质量检查清单

- [ ] 照片的摄影区域未被修改
- [ ] 所有抽象标记可追溯到源照片中的可见事实
- [ ] 底板颜色为均匀象牙/暖白（无纹理/渐变/颗粒）
- [ ] 只使用一种主要标记族 + 最多两种辅助族
- [ ] 标题为 2-5 个英文单词，衬线体，小尺寸放置
- [ ] 无水印/UI 覆盖层/平台标识/装饰性几何图形