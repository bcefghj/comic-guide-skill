---
name: comic-guide
description: >-
  Generate illustrated comic-style educational guides from documentation, source
  code, or any technical content. Supports 10+ anime/manga styles including
  Doraemon, Naruto, One Piece, Dragon Ball, Spy x Family, Chibi, Chinese ink,
  Ghibli, Crayon Shin-chan, Detective Conan, and custom styles. Outputs
  mobile-friendly vertical HTML pages with panel layouts, speech bubbles, and
  knowledge highlights. Use when the user asks to create comics, manga,
  illustrated guides, visual explainers, or cartoon-style tutorials from any
  input material.
---

# Comic Guide - 漫画风格图解生成器

将任何文档、源码或技术知识转化为生动的动漫风格教育漫画。

## 命令格式

```
/comic-guide <source> [options]
```

| 参数 | 说明 | 示例 |
|------|------|------|
| `<source>` | 文档路径、URL 或主题描述 | `docs/api.md`, `"React Hooks 入门"` |
| `--style` | 漫画风格（见下表，默认 `doraemon`） | `--style naruto` |
| `--lang` | 输出语言（默认 `zh`） | `--lang en` |
| `--chapters` | 章节数量（默认自动，3-8） | `--chapters 5` |
| `--layout` | 面板布局（默认 `vertical`） | `--layout webtoon` |
| `--output` | 输出目录 | `--output ./my-comic/` |

## 风格选项

| ID | 名称 | 配色 | 角色设定 | 适用场景 |
|----|------|------|---------|---------|
| `doraemon` | 哆啦A梦 | 蓝#0099DD/白#FFFFFF/红#DD3333 | 哆啦A梦=导师，大雄=学习者，道具=技术概念 | 技术教程、架构解析 |
| `naruto` | 火影忍者 | 橙#FF6600/黑#1A1A2E/红#E43F3F | 鸣人=实践者，卡卡西=导师，忍术=技术 | 流程解析、实战教程 |
| `onepiece` | 海贼王 | 红#CC0000/蓝#0066CC/金#FFD700 | 路飞=探索者，罗宾=知识者，船=系统 | 团队协作、系统组件 |
| `dragonball` | 龙珠 | 橙#FF8C00/蓝#1E90FF/黄#FFD700 | 悟空=挑战者，界王=导师，战斗力=指标 | 性能对比、基准测试 |
| `spyfamily` | 间谍过家家 | 绿#2D5A3D/粉#FFB6C1/黑#1C1C1C | 黄昏=分析者，阿尼亚=好奇宝宝，约尔=守护者 | 安全系统、权限解析 |
| `chibi` | Q版萌系 | 粉#FFB7C5/黄#FFF176/蓝#81D4FA | 圆脸大眼角色、星星装饰 | 入门教程、快速上手 |
| `guofeng` | 国风水墨 | 墨#2C2C2C/宣#F5F0E8/朱#C41E3A | 仙人=导师，少侠=学习者，法器=工具 | 设计模式、哲学概念 |
| `ghibli` | 吉卜力 | 绿#4CAF50/蓝#87CEEB/棕#8B7355 | 少年少女=探索者，精灵=辅助、自然=生态 | 生态系统、工作流 |
| `shinchan` | 蜡笔小新 | 黄#FFEB3B/红#F44336/蓝#2196F3 | 小新=犯错者，风间=纠正者，妮妮=补充者 | 避坑指南、常见错误 |
| `conan` | 名侦探柯南 | 蓝#003366/红#B22222/灰#696969 | 柯南=分析者，博士=技术支持，线索板=关系图 | Debug 教程、问题排查 |
| `custom` | 自定义 | 用户指定 | 用户用自然语言描述角色和风格 | 任意场景 |

## 工作流程

### Phase 1: 输入分析

1. 读取 `<source>` 内容：
   - 如果是文件路径 → 读取文件内容
   - 如果是 URL → 获取网页内容转为文本
   - 如果是文本描述 → 直接作为主题
2. 提取核心知识点，按逻辑拆分为 3-8 个章节
3. 为每个章节确定：标题、核心概念（2-4个）、难度级别

### Phase 2: 风格加载

1. 根据 `--style` 参数确定风格（默认 `doraemon`）
2. 加载对应风格的详细规范：参见 [styles.md](references/styles.md)
3. 确定角色映射：将技术概念映射到动漫角色/道具

### Phase 3: 分镜设计

为每个章节设计 4-8 个面板：

**面板类型：**

| 类型 | 用途 | 占比 |
|------|------|------|
| `opening` | 场景导入，角色引出话题 | 每话 1 个 |
| `dialogue` | 角色对话讲解概念 | 40-50% |
| `diagram` | 架构图/流程图/关系图（CSS绘制） | 20-30% |
| `highlight` | 知识点高亮框、对比表格 | 10-20% |
| `reaction` | 角色反应（惊讶/恍然/赞叹）增加趣味 | 10% |
| `summary` | 本话总结 + 下话预告 | 每话 1 个 |

**分镜规则：**
- 开头必须有 `opening` 面板引入场景
- `diagram` 面板之前必须有 `dialogue` 面板铺垫
- 连续 `dialogue` 面板不超过 3 个，中间穿插其他类型
- 结尾必须有 `summary` 面板

### Phase 4: HTML 生成

为每话生成独立 HTML 文件，遵循模板规范：参见 [html-template.md](references/html-template.md)

**每个 HTML 文件包含：**
1. 内联 CSS（无外部依赖，离线可用）
2. 竖版布局（宽度 max-width: 480px，适配手机）
3. 面板组件：圆角边框 + 阴影 + 风格配色
4. 对话气泡：角色 emoji/SVG + 文字 + 尾巴方向
5. 图解区域：CSS Grid/Flexbox 绘制的架构图
6. 知识点框：高亮背景 + 图标 + 要点列表
7. 导航：上一话 / 目录 / 下一话

**角色表示方式（优先级）：**
1. CSS 绘制的简笔角色（最佳，纯代码无依赖）
2. Unicode Emoji 组合（✨🤖📦等，兼容性好）
3. SVG 内联图形（精致但代码量大）

### Phase 5: 目录页生成

生成 `index.html` 目录页：
- 漫画标题和封面（风格化 CSS 绘制）
- 各话标题列表（带链接）
- 风格和作者信息
- 使用说明

### Phase 6: 输出检查

1. 确认所有 HTML 文件可独立打开（无外部依赖）
2. 确认手机竖版布局正确（max-width: 480px）
3. 确认导航链接正确
4. 汇报生成结果：文件列表、总章节数、使用的风格

## 角色对话设计原则

1. **导师角色**发起话题，用简单比喻引入复杂概念
2. **学习者角色**提出困惑，代表读者的疑问
3. 每轮对话不超过 3 句，保持节奏紧凑
4. 技术术语首次出现时用「」标注并用通俗语言解释
5. 关键代码用等宽字体，放在独立代码面板中
6. 每话结尾用学习者的"恍然大悟"表情收束

## 比喻映射规则

将技术概念映射为动漫世界中的事物：

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

对于输入 `/comic-guide "OpenClaw 架构" --style doraemon --chapters 5`，生成：

```
openclaw-guide/
├── index.html       # 封面目录
├── chapter01.html   # 第1话：四次元口袋里的小龙虾
├── chapter02.html   # 第2话：小龙虾的四层铠甲
├── chapter03.html   # 第3话：百宝袋就是 Skills
├── chapter04.html   # 第4话：记忆面包与安全头盔
└── chapter05.html   # 第5话：一起养虾吧！
```

## 补充资源

- 风格详细规范：[references/styles.md](references/styles.md)
- HTML 模板参考：[references/html-template.md](references/html-template.md)
- 完整示例：[examples/openclaw-guide/](examples/openclaw-guide/)
