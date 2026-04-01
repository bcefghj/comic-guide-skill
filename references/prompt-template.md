# 图像生成提示词编写规范

本文档定义如何为每话漫画编写 AI 图像生成提示词（prompt），使 AI 生成与用户之前作品风格一致的漫画图片。

---

## 提示词结构（五段式）

每话的提示词由五部分组成，按顺序拼接：

### 1. 全局画风描述

从 [styles.md](styles.md) 中加载对应风格的画风提示词。

示例（哆啦A梦）：
```
Doraemon anime art style, cute round character designs, soft pastel colors,
clean uniform outlines, bright cheerful atmosphere, blue and white color
scheme with red and yellow accents, kawaii Japanese cartoon style,
educational comic format, professional manga panel layout.
```

### 2. 面板布局描述

指定面板数量和排列方式：
```
Layout: landscape 16:9 ratio, [N] panels arranged in a [2x2 / 2x3 / 1+3]
grid with thin black panel borders and rounded corners, white gutters
between panels, each panel clearly separated.
```

常用布局：
- **4格（2x2）**：最常用，适合大多数章节
- **6格（2x3）**：内容较多时使用
- **1大+3小**：标题章节，上方大图+下方三小图

### 3. 逐面板内容描述

按面板位置依次描述内容。每个面板描述包含：

```
Panel [N] ([位置], [面板类型]):
[场景/背景描述]。
[角色位置和动作描述]。
[对话气泡内容]："[中文对话]"
[如有图解/图表] 用卡通风格绘制的[图解内容]，标注中文文字。
```

**面板位置命名：**
- 2x2：top-left, top-right, bottom-left, bottom-right
- 2x3：top-left, top-center, top-right, bottom-left, bottom-center, bottom-right
- 1+3：top (大), bottom-left, bottom-center, bottom-right

### 4. 文字与气泡指令

```
All text in Simplified Chinese (简体中文).
Speech bubbles: rounded rectangle shape with pointed tail directed at speaker.
Title text: bold large font in decorative banner/frame.
Labels and annotations: clean sans-serif font with good readability.
```

### 5. 质量与一致性指令

```
High quality illustration, professional comic panel layout, consistent
character designs across all panels, clean readable text, educational
content, bright well-lit scenes, no watermarks, no artist signatures.
```

---

## 完整提示词示例

以「漫画图解 OpenClaw - 第1话」为例：

```
Doraemon anime art style, cute round character designs, soft pastel colors,
clean uniform outlines, bright cheerful atmosphere, blue and white color
scheme with red and yellow accents, kawaii Japanese cartoon style,
educational comic format.

Layout: landscape 16:9 ratio, 4 panels in a 2x2 grid with thin black
panel borders and rounded corners, white gutters between panels.

Panel 1 (top-left, title):
Title banner reads "漫画图解 OpenClaw 架构" in bold decorative text with
sparkle effects. Subtitle "第1话：四次元口袋里的小龙虾".
Doraemon (round blue robot cat with white belly, red nose, yellow bell)
stands proudly next to a large cute cartoon lobster mascot. Background
has a computer screen with code and stars.

Panel 2 (top-right, dialogue):
Indoor scene, Nobita (boy with glasses, yellow shirt) sitting at desk
looking frustrated with piles of papers. Doraemon floating beside him
reaching into his 4D pocket.
Speech bubble from Nobita: "这些活儿一个人根本干不完啊！"
Speech bubble from Doraemon: "让我拿出一个新道具！"

Panel 3 (bottom-left, diagram):
A cute cartoon-style comparison diagram. Left side labeled "普通AI" shows
a simple chat bubble icon with X mark. Right side labeled "AI Agent(小龙虾)"
shows a robot with multiple arms doing tasks (typing, filing, browsing)
with checkmark. An arrow shows the evolution from left to right.
Doraemon pointing at the diagram explaining.

Panel 4 (bottom-right, info):
A colorful info panel styled as a wooden signboard. Title "小龙虾六大能力".
Six cute icons in 2x3 grid: folder icon "文件管理", link icon "跨工具协同",
globe icon "浏览器自动化", code icon "代码执行", clock icon "定时任务",
mouse icon "设备控制". Doraemon giving thumbs up at bottom.
Stats text: "GitHub 28万+ 星标 | 5400+ 技能"

All text in Simplified Chinese. Speech bubbles with tails pointing to
speakers. High quality illustration, consistent character designs,
clean readable text, educational content, no watermarks.
```

---

## 各面板类型的描述模板

### title（标题面板）

```
Panel N (位置, title):
Title banner reads "[漫画标题]" in bold decorative text with [装饰效果].
Subtitle "[第X话：章节标题]".
[主角色] stands in [姿态] next to [主题相关的视觉元素].
Background: [场景背景].
```

### dialogue（对话面板）

```
Panel N (位置, dialogue):
[场景描述]. [角色A] [位置和动作]. [角色B] [位置和动作].
Speech bubble from [角色A]: "[对话内容，不超过15字]"
Speech bubble from [角色B]: "[对话内容，不超过15字]"
```

注意：每个气泡中文不超过 15 个字，否则图片中文字会太小。

### diagram（图解面板）

```
Panel N (位置, diagram):
A cute [风格]-style technical diagram showing [图解内容描述].
[层级/流程/对比的具体描述，使用可爱卡通风格].
Labels in Chinese: "[标签1]", "[标签2]", ...
[角色] standing beside the diagram [动作：pointing/explaining/reacting].
```

### info（信息面板）

```
Panel N (位置, info):
A [展示形式：wooden signboard / scroll / bulletin board / card] showing
key points. Title: "[标题]".
[N] items with cute icons: [icon] "[要点文字]", ...
[角色] [反应动作] at [位置].
```

### reaction（反应面板）

```
Panel N (位置, reaction):
[角色] with [夸张表情：shocked/amazed/enlightened/celebrating] expression,
[动作描述]. [效果：sparkles/exclamation marks/sweat drops/light bulb].
Text: "[感叹语]"
```

### summary（总结面板）

```
Panel N (位置, summary):
A [展示形式：bulletin board / notebook / scroll] with summary title
"本话总结". Key points listed:
• [要点1]
• [要点2]
• [要点3]
Bottom text: "下一话：[预告标题]"
[角色] waving/giving thumbs up beside the board.
```

---

## 对话文字长度控制

AI 图像生成中，文字清晰度受图片分辨率限制：

| 元素 | 最大字数 | 说明 |
|------|---------|------|
| 标题 | 10-12 字 | 大号加粗字体 |
| 对话气泡 | 12-15 字 | 每个气泡，过长会模糊 |
| 标签/注释 | 4-6 字 | 图解中的标注 |
| 要点列表 | 8-10 字/条 | 信息面板中 |

**关键原则：图片中的文字越少越清晰。** 复杂的解说放在配套的 Markdown 课程文件中，漫画图片只放核心要点。

---

## 风格一致性保证

1. 同一套漫画中，角色描述词保持完全一致
2. 每话 prompt 开头都重复完整的画风描述
3. 配色方案在所有面板中保持统一
4. 如果平台支持参考图（如 `--ref`），使用角色参考图确保一致性
