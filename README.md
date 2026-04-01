# comic-guide-skill 🎨

**漫画风格图解生成器** — 将任何文档、源码或技术知识转化为生动的动漫风格教育漫画。

支持 **10+ 种动漫风格**（哆啦A梦、火影忍者、海贼王、龙珠等），兼容 **Cursor / Claude Code / OpenClaw** 等多平台。

## 效果预览

以「图解 OpenClaw」为例，哆啦A梦风格漫画效果：

- 📖 **5 话完整漫画**，每话 4-8 个面板
- 📱 竖版布局，适配手机/小红书浏览
- 🎭 角色对话 + 架构图解 + 知识点高亮
- 🚀 纯 HTML/CSS，无外部依赖，离线可用

👉 [在线查看示例](examples/openclaw-guide/index.html)

## 支持的漫画风格

| 风格 ID | 名称 | 视觉特点 | 适合场景 |
|---------|------|---------|---------|
| `doraemon` | 哆啦A梦（默认） | 蓝白配色、圆润线条、道具解说 | 技术教程、架构解析 |
| `naruto` | 火影忍者 | 热血风格、忍术卷轴 | 流程解析、实战教程 |
| `onepiece` | 海贼王 | 航海图风格、冒险感 | 团队协作、系统组件 |
| `dragonball` | 龙珠 | 战斗力数值、能量波 | 性能对比、基准测试 |
| `spyfamily` | 间谍过家家 | 任务档案风格、优雅 | 安全系统、权限解析 |
| `chibi` | Q版萌系 | 大头小身、简约可爱 | 入门教程、快速上手 |
| `guofeng` | 国风水墨 | 中国画风、墨色晕染 | 设计模式、哲学概念 |
| `ghibli` | 吉卜力 | 温暖自然、田园风光 | 生态系统、工作流 |
| `shinchan` | 蜡笔小新 | 搞笑幽默、简笔画风 | 避坑指南、常见错误 |
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

# 安装到所有检测到的平台
curl -sL ... | bash -s -- --all
```

### 方式二：ClawHub 安装（OpenClaw 用户）

```bash
clawhub install comic-guide
```

### 方式三：npx 安装（Claude Code 用户）

```bash
npx skills add bcefghj/comic-guide-skill
```

### 方式四：手动安装

```bash
# Cursor
git clone https://github.com/bcefghj/comic-guide-skill.git ~/.cursor/skills/comic-guide

# Claude Code
git clone https://github.com/bcefghj/comic-guide-skill.git ~/.claude/skills/comic-guide

# OpenClaw
git clone https://github.com/bcefghj/comic-guide-skill.git ~/.openclaw/skills/comic-guide
```

### 方式五：项目级安装

```bash
# 在项目根目录
git clone https://github.com/bcefghj/comic-guide-skill.git .cursor/skills/comic-guide
# 或
git clone https://github.com/bcefghj/comic-guide-skill.git .claude/skills/comic-guide
```

### 方式六：对话安装（最简单）

直接告诉 AI：

> 请从 github.com/bcefghj/comic-guide-skill 安装漫画图解技能

AI 会自动完成安装！

## 使用方法

### 命令方式

```
/comic-guide path/to/doc.md                     # 默认哆啦A梦风格
/comic-guide path/to/doc.md --style naruto       # 火影忍者风格
/comic-guide path/to/doc.md --style chibi        # Q版萌系风格
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
| `--layout` | 面板布局 | `vertical` |
| `--output` | 输出目录 | `./<topic>-guide/` |

## 输出格式

生成一组自包含 HTML 文件：

```
output-guide/
├── index.html       # 封面目录页
├── chapter01.html   # 第1话
├── chapter02.html   # 第2话
├── ...
└── chapterNN.html   # 第N话
```

每个 HTML 文件特点：
- 纯 HTML/CSS，无外部依赖
- 竖版布局（max-width: 480px），适配手机
- 角色对话气泡 + 架构图解 + 知识点高亮
- 前后话导航 + 目录链接

## 项目结构

```
comic-guide-skill/
├── SKILL.md                   # 核心 Skill 指令文件
├── README.md                  # 本文件
├── LICENSE                    # MIT 协议
├── CLAUDE.md                  # Claude Code 入口
├── AGENTS.md                  # Agent 规则
├── references/
│   ├── styles.md              # 10+ 漫画风格详细规范
│   └── html-template.md       # HTML 输出模板
├── examples/
│   └── openclaw-guide/        # 示例：哆啦A梦图解 OpenClaw
│       ├── index.html
│       ├── chapter01.html     # 四次元口袋里的小龙虾
│       ├── chapter02.html     # 小龙虾的四层铠甲
│       ├── chapter03.html     # 百宝袋就是 Skills
│       ├── chapter04.html     # 记忆面包与安全头盔
│       └── chapter05.html     # 一起养虾吧！
└── scripts/
    └── install.sh             # 多平台安装脚本
```

## 创建自己的漫画

1. 准备好你想图解的文档（Markdown、URL 或直接描述主题）
2. 选择一个喜欢的风格
3. 运行命令或自然语言描述
4. 等待生成，打开 `index.html` 查看效果

**示例：**

```
# 图解 React Hooks
/comic-guide docs/react-hooks.md --style chibi

# 图解你的项目架构
/comic-guide "我们的微服务架构" --style naruto --chapters 4

# 图解一篇论文
/comic-guide paper.pdf --style conan --lang zh
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
