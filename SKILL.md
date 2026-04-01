---
name: comic-guide
description: >-
  Generate AI-illustrated comic-style educational guides from documentation,
  source code, or any technical content. Produces actual comic PNG images using
  AI image generation (not HTML). Supports 10+ anime styles: Doraemon, Naruto,
  One Piece, Dragon Ball, Spy x Family, Chibi, Chinese ink, Ghibli, Crayon
  Shin-chan, Detective Conan, and custom. Each chapter outputs a multi-panel
  comic image with drawn characters, speech bubbles, and technical diagrams in
  cartoon style. Use when user asks to create comics, manga, illustrated guides,
  visual explainers, or cartoon-style tutorials.
---

# Comic Guide - 漫画风格图解生成器

将任何文档、源码或技术知识转化为 **AI 绘制的漫画图片**（PNG）。

## 命令格式

```
/comic-guide <source> [options]
```

| 参数 | 说明 | 示例 |
|------|------|------|
| `<source>` | 文档路径、URL 或主题描述 | `docs/api.md`, `"React Hooks 入门"` |
| `--style` | 漫画风格（默认 `doraemon`） | `--style naruto` |
| `--lang` | 输出语言（默认 `zh`） | `--lang en` |
| `--chapters` | 章节数（默认自动 3-8） | `--chapters 5` |
| `--aspect` | 图片比例（默认 `16:9`） | `--aspect 3:4` |
| `--output` | 输出目录 | `--output ./my-comic/` |
| `--storyboard-only` | 只生成分镜脚本，不生成图片 | |
| `--prompts-only` | 只生成分镜+提示词，不生成图片 | |

## 风格选项

| ID | 名称 | 画风关键词 | 角色设定 | 适用场景 |
|----|------|-----------|---------|---------|
| `doraemon` | 哆啦A梦 | 蓝白配色、圆润线条、可爱卡通、柔和色彩 | 哆啦A梦=导师，大雄=学习者，道具=技术概念 | 技术教程、架构解析 |
| `naruto` | 火影忍者 | 热血动感、速度线、橙黑配色、动作感 | 鸣人=实践者，卡卡西=导师，忍术卷轴=文档 | 流程解析、实战教程 |
| `onepiece` | 海贼王 | 航海图风格、冒险感、红蓝金配色 | 路飞=探索者，罗宾=知识者，船=系统 | 团队协作、系统组件 |
| `dragonball` | 龙珠 | 战斗力数值、能量波、橙蓝配色 | 悟空=挑战者，界王=导师，战斗力探测器=性能 | 性能对比、基准测试 |
| `spyfamily` | 间谍过家家 | 优雅档案风格、绿粉黑配色 | 黄昏=分析者，阿尼亚=好奇宝宝 | 安全系统、权限解析 |
| `chibi` | Q版萌系 | 大头小身、粉彩、星星装饰 | 通用可爱角色 | 入门教程、快速上手 |
| `guofeng` | 国风水墨 | 水墨晕染、宣纸纹理、朱红印章 | 仙人=导师，少侠=学习者 | 设计模式、哲学概念 |
| `ghibli` | 吉卜力 | 水彩风、温暖自然、绿蓝棕配色 | 少年少女=探索者，精灵=辅助 | 生态系统、工作流 |
| `shinchan` | 蜡笔小新 | 蜡笔画风、搞笑幽默、黄红蓝配色 | 小新=犯错者，风间=纠正者 | 避坑指南、常见错误 |
| `conan` | 名侦探柯南 | 推理风格、暗色调、蓝红灰配色 | 柯南=分析者，博士=技术支持 | Debug 教程、问题排查 |
| `custom` | 自定义 | 用户自然语言描述 | 用户自定义 | 任意场景 |

## 核心工作流

```
输入 → 内容分析 → 分镜脚本 → 角色定义 → 图像提示词 → AI 图像生成 → PNG 输出
```

### Phase 1: 内容分析

1. 读取 `<source>` 内容（文件/URL/文本描述）
2. 提取核心知识点，按逻辑拆分为 3-8 个章节
3. 为每章确定：标题、核心概念（2-4 个）、难度级别
4. 输出 `analysis.md`

### Phase 2: 分镜脚本

为每章设计 4-6 个面板的分镜脚本，输出 `storyboard.md`。

**面板类型与节奏：**

| 类型 | 用途 | 占比 |
|------|------|------|
| `title` | 章节标题面板，大字+角色 | 每话 1 个 |
| `dialogue` | 角色对话讲解概念，对话气泡 | 30-40% |
| `diagram` | 架构图/流程图，以漫画风格绘制 | 20-30% |
| `info` | 知识要点面板，图标+列表 | 10-20% |
| `reaction` | 角色表情反应，增加趣味 | 10% |
| `summary` | 本话总结，木牌/卷轴/公告板形式 | 每话 1 个 |

**分镜规则：**
- 每话 4-6 个面板，横版 2x2 或 2x3 布局
- 开头必有 `title` 面板
- `diagram` 前必有 `dialogue` 铺垫
- 结尾必有 `summary` 面板

### Phase 3: 角色定义

输出 `characters.md`，描述每个角色的视觉特征：

```markdown
## 角色表

### 导师角色
- 名称：哆啦A梦
- 外观：蓝色圆滚滚的机器猫，白色肚皮，红鼻子，黄色铃铛项圈
- 表情变化：讲解时自信微笑，强调时举起手指，展示道具时从口袋掏出
- 对话气泡颜色：浅蓝色

### 学习者角色
- 名称：大雄
- 外观：黑发男孩，戴大圆框眼镜，黄色上衣
- 表情变化：困惑时挠头，惊讶时张大嘴巴，领悟时竖起大拇指
- 对话气泡颜色：浅黄色
```

### Phase 4: 图像提示词生成

为每话生成一份详细的图像生成提示词，保存为 `prompts/NN-chapter-slug.md`。

提示词结构（以哆啦A梦风格为例）：

```
A educational comic page in Doraemon anime art style, cute round character
designs, soft blue and white color scheme, clean lines.

Layout: landscape 16:9 ratio, [N] panels arranged in a [2x2 / 2x3] grid
with thin black panel borders and white gutters between panels.

Panel 1 (top-left, title panel):
[章节标题大字]，哆啦A梦站在左侧，举起右手，背景是[场景描述]。
对话气泡："[对话内容]"

Panel 2 (top-right):
[面板内容描述，角色位置、表情、动作]
对话气泡："[对话内容]"

Panel 3 (bottom-left, diagram):
[技术图解描述：用可爱卡通风格绘制的架构图/流程图，标注中文文字]

Panel 4 (bottom-right, summary):
[总结面板描述]

All text in Chinese. Speech bubbles with tails pointing to speakers.
Consistent character appearance across all panels.
```

详细的风格提示词模板见 [styles.md](references/styles.md)。
提示词编写规范见 [prompt-template.md](references/prompt-template.md)。

### Phase 5: AI 图像生成

根据运行平台选择图像生成方式：

| 平台 | 生成方式 | 操作 |
|------|---------|------|
| Cursor | 内置 `GenerateImage` 工具 | 直接调用，传入提示词描述 |
| Claude Code | `baoyu-imagine` 技能 | `/baoyu-imagine --prompt ... --image output.png` |
| OpenClaw | `image-gen` 技能 | `/image-gen --prompt ... --image output.png` |
| 通用 | 将提示词保存为文件 | 用户自行调用任意图像生成工具 |

**生成规则：**
- 每话一张 PNG 图片
- 默认 16:9 横版（适合桌面/分享）；可选 3:4 竖版（适合手机/小红书）
- 文件命名：`NN-chapter-slug.png`（如 `01-overall-architecture.png`）

### Phase 6: 输出汇总

最终输出目录结构：

```
{topic}-guide/
├── analysis.md              # 内容分析
├── storyboard.md            # 分镜脚本
├── characters.md            # 角色定义
├── prompts/                 # 图像提示词
│   ├── 01-chapter-slug.md
│   ├── 02-chapter-slug.md
│   └── ...
├── 01-chapter-slug.png      # 生成的漫画图片
├── 02-chapter-slug.png
└── ...
```

汇报：文件列表、章节数、风格、图片数量。

## 角色对话设计原则

1. **导师角色**发起话题，用简单比喻引入复杂概念
2. **学习者角色**提出困惑，代表读者的疑问
3. 每轮对话不超过 2 句，保持紧凑（图片中文字不宜太多）
4. 技术术语首次出现时用通俗比喻解释
5. 每话结尾用学习者的"恍然大悟"表情收束

## 比喻映射规则

| 技术概念 | 哆啦A梦 | 火影忍者 | 海贼王 |
|---------|---------|---------|--------|
| API | 任意门 | 通灵术 | 电话虫 |
| 数据库 | 四次元口袋 | 封印卷轴 | 历史正文 |
| 缓存 | 记忆面包 | 影分身 | 镜之船 |
| 多线程 | 缩小灯分身 | 多重影分身 | 路飞的档 |
| 安全机制 | 独裁者按钮 | 结界术 | 霸气 |
| 框架 | 百宝袋 | 忍具包 | 海贼船 |
| 插件/模块 | 道具 | 忍术 | 恶魔果实 |
| 部署 | 时光机出发 | 出任务 | 出航 |

## 输出示例

对于 `/comic-guide "OpenClaw 架构" --style doraemon --chapters 5`：

```
openclaw-guide/
├── analysis.md
├── storyboard.md
├── characters.md
├── prompts/
│   ├── 01-what-is-openclaw.md
│   ├── 02-four-layer-architecture.md
│   ├── 03-skills-system.md
│   ├── 04-memory-and-security.md
│   └── 05-deployment.md
├── 01-what-is-openclaw.png          # 第1话：四次元口袋里的小龙虾
├── 02-four-layer-architecture.png   # 第2话：小龙虾的四层铠甲
├── 03-skills-system.png             # 第3话：百宝袋就是 Skills
├── 04-memory-and-security.png       # 第4话：记忆面包与安全头盔
└── 05-deployment.png                # 第5话：一起养虾吧！
```

## 补充资源

- 风格提示词模板：[references/styles.md](references/styles.md)
- 提示词编写规范：[references/prompt-template.md](references/prompt-template.md)
- 完整示例：[examples/openclaw-guide/](examples/openclaw-guide/)
