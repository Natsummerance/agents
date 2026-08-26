# vendor/ · 上游资产库

> 各 agent skills 引用的上游一手资产（模板/脚本/prompt 库/规范文档）。
> 搬运规则：仅文本与小型功能资产（<350KB/文件），排除 .git/node_modules/图标池/大型媒体。
> 命名 `<owner>__<repo>`，内容为上游对应子树的原样拷贝。

## 已入库（17 个来源）

| 路径 | 上游 | 内容 |
|------|------|------|
| op7418__guizang-ppt-skill/ | guizang-ppt-skill | 双风格 HTML 模板(template/template-swiss)、themes/layouts 规范、motion.min.js、背景素材 |
| hugohe3__ppt-master/ppt-master/ | ppt-master | SVG→原生PPTX 工具链：scripts(py)/workflows/references/templates（**不含** templates/icons 12k SVG 图标池与音效，需完整能力请克隆上游） |
| Zeejay0__gathered-scenes-zine-skill/ | gathered-scenes-zine-skill | 实景拼贴 zine 的场景卡与 v1-3 prompt |
| LiamGvchi__gc-minimal-zine-poster/ | gc-minimal-zine-poster | 极简 zine 海报 prompt 编译器+质检门 |
| wnby__photo-relic-editorial/ | photo-relic-editorial | 遗存版画 afterimage prompt 族 |
| ZzzLc0405__photo-abstract-editorial/ | photo-abstract-editorial | 抽象面板编辑艺术 zh-CN prompt |
| nextlevelbuilder__ui-ux-pro-max-skill/ | ui-ux-pro-max-skill | design-system/banner 等 skill 源规范与 references |
| larashero3-dotcom__lieflat-charts/ | lieflat-charts | 扁平化图表风格系统全文 |
| ChenLiu-1996__figures4papers/scientific-figure-making/ | figures4papers | 学术插图 SKILL+api/design-theory/common-patterns references |
| freestylefly__awesome-gpt-image-2/ | awesome-gpt-image-2 | 图像生成模板与风格库文本资产 |
| nexu-io__html-anything/ | html-anything | docs 文档（源码未入库） |
| shd101wyy__markdown-preview-enhanced/docs/ | markdown-preview-enhanced | 渲染增强全量文档（code-chunk/diagrams/math/presentation/pdf） |
| harry0703__MoneyPrinterTurbo/docs/ | MoneyPrinterTurbo | 短视频管线文档（源码未入库） |
| UditAkhourii__neuroarxiv/ | neuroarxiv | arXiv-first 工作流全文 |
| AaravKashyap12__advise-project-approach/ | advise-project-approach | 项目方案建议工作流全文 |
| AIScientists-Dev__academic-humanizer/ | academic-humanizer | 学术润色工作流全文 |
| every-app__open-seo/.agents/ | open-seo | SEO 审计 skill 源 |

## 未入库（库类上游——能力载体是可安装的包本身，蒸馏 skill 已给用法）

mem0ai/mem0 · unclecode/crawl4ai · D4Vinci/Scrapling · rrweb-io/rrweb · TencentCloud/TencentDB-Agent-Memory · vectorize-io/hindsight · Graphify-Labs/graphify · affaan-m/ECC · chaitanyagiri/munder-difflin · webadderallorg/Recordly · arxhr007/Aliens_eye · guillaumemeyer/watermarks-remover · OpenByteInc/QuantDinger · 666ghj/MiroFish · XiaomingX/ai-money-maker-handbook · MadsLorentzen/ai-job-search · AgriciDaniel/claude-seo · AgriciDaniel/claude-blog · zubair-trabzada/geo-seo-claude
