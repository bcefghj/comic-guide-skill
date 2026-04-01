# comic-guide-skill

**漫画风格图解生成器** — 将任何文档、源码或技术知识转化为 **AI 绘制的漫画图片**（PNG）。

支持 **10+ 种动漫风格**（哆啦A梦、火影忍者、海贼王、龙珠等），兼容 **Cursor / Claude Code / OpenClaw** 等多平台。

## 效果预览

以「漫画图解 OpenClaw」为例，哆啦A梦风格：

### 第1话：四次元口袋里的小龙虾
![01-what-is-openclaw](examples/openclaw-guide/01-what-is-openclaw.png)

### 第2话：小龙虾的四层铠甲
![02-four-layer-architecture](examples/openclaw-guide/02-four-layer-architecture.png)

### 第3话：百宝袋就是 Skills
![03-skills-system](examples/openclaw-guide/03-skills-system.png)

### 第4话：记忆面包与安全头盔
![04-memory-and-security](examples/openclaw-guide/04-memory-and-security.png)

### 第5话：一起养虾吧！
![05-deployment](examples/openclaw-guide/05-deployment.png)

**特点：**
- 每话一张 AI 绘制的漫画 PNG 图片（约 1.2-1.4MB）
- 哆啦A梦风格角色 + 对话气泡 + 架构图解
- 多面板布局（2x2 / 2x3），中文文字嵌入图片
- 可直接用于文档、博客、小红书、微信公众号分享

## 10 种风格预览

同一主题「图解 OpenClaw」的 10 种画风效果对比：

### 哆啦A梦（默认）
![doraemon](examples/openclaw-guide/01-what-is-openclaw.png)

### 火影忍者
![naruto](examples/openclaw-guide/styles-preview/naruto-openclaw.png)

### 海贼王
![onepiece](examples/openclaw-guide/styles-preview/onepiece-openclaw.png)

### 龙珠
![dragonball](examples/openclaw-guide/styles-preview/dragonball-openclaw.png)

### 间谍过家家
![spyfamily](examples/openclaw-guide/styles-preview/spyfamily-openclaw.png)

### Q版萌系
![chibi](examples/openclaw-guide/styles-preview/chibi-openclaw.png)

### 国风水墨
![guofeng](examples/openclaw-guide/styles-preview/guofeng-openclaw.png)

### 吉卜力
![ghibli](examples/openclaw-guide/styles-preview/ghibli-openclaw.png)

### 蜡笔小新
![shinchan](examples/openclaw-guide/styles-preview/shinchan-openclaw.png)

### 名侦探柯南
![conan](examples/openclaw-guide/styles-preview/conan-openclaw.png)

---

## 支持的漫画风格

| 风格 ID | 名称 | 画风特点 | 适合场景 |
|---------|------|---------|---------|
| `doraemon` | 哆啦A梦（默认） | 蓝白配色、圆润线条、道具解说 | 技术教程、架构解析 |
| `naruto` | 火影忍者 | 热血动感、忍术卷轴 | 流程解析、实战教程 |
| `onepiece` | 海贼王 | 航海图风格、冒险感 | 团队协作、系统组件 |
| `dragonball` | 龙珠 | 战斗力数值、能量波 | 性能对比、基准测试 |
| `spyfamily` | 间谍过家家 | 任务档案风格、优雅 | 安全系统、权限解析 |
| `chibi` | Q版萌系 | 大头小身、粉彩可爱 | 入门教程、快速上手 |
| `guofeng` | 国风水墨 | 水墨晕染、宣纸纹理 | 设计模式、哲学概念 |
| `ghibli` | 吉卜力 | 水彩风、温暖自然 | 生态系统、工作流 |
| `shinchan` | 蜡笔小新 | 蜡笔画风、搞笑幽默 | 避坑指南、常见错误 |
| `conan` | 名侦探柯南 | 推理风格、线索连接 | Debug 教程、问题排查 |
| `custom` | 自定义 | 用户自然语言描述 | 任意场景 |

## 安装

### 方式一：一键脚本安装（推荐）

自动检测你安装了哪些平台（Cursor / Claude Code / OpenClaw），安装到正确位置：

```bash
curl -sL https://raw.githubusercontent.com/bcefghj/comic-guide-skill/main/scripts/install.sh | bash
```

指定平台：

```bash
# 只安装到 Cursor
curl -sL ... | bash -s -- --cursor

# 只安装到 Claude Code
curl -sL ... | bash -s -- --claude

# 只安装到 OpenClaw
curl -sL ... | bash -s -- --openclaw
```

### 方式二：ClawHub 安装（OpenClaw 用户）

```bash
clawhub install comic-guide
```

### 方式三：手动安装

```bash
# Cursor
git clone https://github.com/bcefghj/comic-guide-skill.git ~/.cursor/skills/comic-guide

# Claude Code
git clone https://github.com/bcefghj/comic-guide-skill.git ~/.claude/skills/comic-guide

# OpenClaw
git clone https://github.com/bcefghj/comic-guide-skill.git ~/.openclaw/skills/comic-guide
```

### 方式四：项目级安装

```bash
git clone https://github.com/bcefghj/comic-guide-skill.git .cursor/skills/comic-guide
# 或
git clone https://github.com/bcefghj/comic-guide-skill.git .claude/skills/comic-guide
```

### 方式五：对话安装（最简单）

直接告诉 AI：

> 请从 github.com/bcefghj/comic-guide-skill 安装漫画图解技能

AI 会自动完成安装！

## 使用方法

### 命令方式

```
/comic-guide path/to/doc.md                     # 默认哆啦A梦风格
/comic-guide path/to/doc.md --style naruto       # 火影忍者风格
/comic-guide "OpenClaw 架构解析" --style doraemon --chapters 5
```

### 自然语言方式

直接对 AI 说：

- "请用哆啦A梦风格帮我图解这个文档"
- "把这份 API 文档变成火影忍者风格的漫画"
- "用蜡笔小新风格做一个避坑指南"

### 完整参数

| 参数 | 说明 | 默认值 |
|------|------|--------|
| `<source>` | 文档路径、URL 或主题描述 | 必填 |
| `--style` | 漫画风格 | `doraemon` |
| `--lang` | 输出语言 | `zh` |
| `--chapters` | 章节数 | 自动（3-8） |
| `--aspect` | 图片比例 | `16:9` |
| `--output` | 输出目录 | `./<topic>-guide/` |
| `--storyboard-only` | 只生成分镜脚本 | — |
| `--prompts-only` | 只生成分镜+提示词 | — |

## 输出格式

生成一组 AI 绘制的漫画 PNG 图片和配套文档：

```
output-guide/
├── analysis.md              # 内容分析
├── storyboard.md            # 分镜脚本
├── characters.md            # 角色定义
├── prompts/                 # 图像提示词
│   ├── 01-chapter-slug.md
│   └── ...
├── 01-chapter-slug.png      # 漫画图片（AI 绘制）
├── 02-chapter-slug.png
└── ...
```

每张 PNG 图片特点：
- AI 绘制的真正漫画图片（非 HTML 渲染）
- 多面板布局（2x2 / 2x3），角色+对话气泡+图解
- 中文文字嵌入图片
- 16:9 横版（默认）或 3:4 竖版

## 图像生成后端

| 平台 | 生成方式 | 是否需要 API Key |
|------|---------|----------------|
| Cursor | 内置 `GenerateImage` 工具 | 不需要 |
| Claude Code | `baoyu-imagine` 等图像生成技能 | 需要 OpenAI / Google API Key |
| OpenClaw | `image-gen` 技能或内置能力 | 需要 API Key |
| 通用 | 导出提示词，用任意图像工具生成 | 取决于工具 |

> **提示**：如果你的平台没有图像生成能力，可以使用 `--prompts-only` 参数只生成提示词，
> 然后手动粘贴到 Midjourney / DALL-E / Stable Diffusion 等工具生成图片。

## 项目结构

```
comic-guide-skill/
├── SKILL.md                      # 核心 Skill 指令文件
├── README.md                     # 本文件
├── LICENSE                       # MIT 协议
├── CLAUDE.md                     # Claude Code 入口
├── AGENTS.md                     # Agent 规则
├── references/
│   ├── styles.md                 # 10+ 漫画风格 AI 图像提示词模板
│   └── prompt-template.md        # 提示词编写规范
├── examples/
│   └── openclaw-guide/           # 示例：哆啦A梦图解 OpenClaw
│       ├── storyboard.md         # 分镜脚本
│       ├── characters.md         # 角色定义
│       ├── prompts/              # 每话图像提示词
│       │   ├── 01-what-is-openclaw.md
│       │   ├── 02-four-layer-architecture.md
│       │   ├── 03-skills-system.md
│       │   ├── 04-memory-and-security.md
│       │   └── 05-deployment.md
│       ├── 01-what-is-openclaw.png          # 第1话：四次元口袋里的小龙虾
│       ├── 02-four-layer-architecture.png   # 第2话：小龙虾的四层铠甲
│       ├── 03-skills-system.png             # 第3话：百宝袋就是 Skills
│       ├── 04-memory-and-security.png       # 第4话：记忆面包与安全头盔
│       └── 05-deployment.png                # 第5话：一起养虾吧！
└── scripts/
    └── install.sh                # 多平台安装脚本
```

## 创建自己的漫画

1. 准备好你想图解的文档（Markdown、URL 或直接描述主题）
2. 选择一个喜欢的风格（默认哆啦A梦）
3. 运行命令或用自然语言描述需求
4. AI 会生成分镜脚本 → 提示词 → 漫画图片

**示例：**

```
# 图解 React Hooks
/comic-guide docs/react-hooks.md --style chibi

# 图解你的项目架构
/comic-guide "我们的微服务架构" --style naruto --chapters 4

# 只生成提示词（手动用 Midjourney 生成图片）
/comic-guide paper.pdf --style conan --prompts-only
```

## 兼容平台

| 平台 | 安装位置 | 调用方式 |
|------|---------|---------|
| Cursor | `~/.cursor/skills/comic-guide/` | 在 Agent 对话中使用 |
| Claude Code | `~/.claude/skills/comic-guide/` | `/comic-guide` 或对话 |
| OpenClaw | `~/.openclaw/skills/comic-guide/` | `clawhub install` 或对话 |

## 致谢

- 灵感来源：[JimLiu/baoyu-skills](https://github.com/JimLiu/baoyu-skills) 的 comic skill
- 参考项目：[zlh-428/naruto-skills](https://github.com/zlh-428/naruto-skills)
- OpenClaw 社区

## License

MIT License - 随意使用、修改和分享！
