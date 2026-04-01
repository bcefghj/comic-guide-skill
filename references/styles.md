# 漫画风格详细规范

每种风格定义了：配色方案、角色设定、面板样式、对话气泡样式、CSS 变量。

---

## 1. doraemon — 哆啦A梦（默认）

### 配色 CSS 变量

```css
:root {
  --primary: #0099DD;
  --secondary: #FFFFFF;
  --accent: #DD3333;
  --accent2: #FFD700;
  --bg: #E8F4FD;
  --panel-bg: #FFFFFF;
  --text: #333333;
  --bubble-mentor: #D6EFFF;
  --bubble-learner: #FFF3CD;
  --highlight-bg: #FFF9C4;
  --border-radius: 20px;
}
```

### 角色设定

| 角色 | 身份 | Emoji | 口头禅 | 气泡颜色 |
|------|------|-------|--------|---------|
| 哆啦A梦 | 导师（技术讲解者） | 🤖 | "让我从百宝袋里拿出..." | `--bubble-mentor` |
| 大雄 | 学习者（代表读者） | 👦 | "哆啦A梦，这个好难啊..." | `--bubble-learner` |
| 静香 | 补充者（最佳实践） | 👧 | "其实还有更优雅的方式哦~" | #FFE0F0 |
| 胖虎 | 反面示范（错误做法） | 💪 | "管他的，直接上！" | #FFD0D0 |

### 面板样式

```css
.panel { border: 3px solid var(--primary); border-radius: 20px; background: white; box-shadow: 4px 4px 0 rgba(0,153,221,0.2); }
.panel-title { background: var(--primary); color: white; border-radius: 16px 16px 0 0; padding: 8px 16px; font-weight: bold; }
```

### 道具映射视觉

道具出现时用特殊面板：金色边框 + 星光背景 + 道具名称大字 + 功能说明小字。

```css
.gadget-panel { border: 3px solid #FFD700; background: linear-gradient(135deg, #FFFDE7 0%, #FFF9C4 100%); text-align: center; }
.gadget-name { font-size: 1.5em; font-weight: bold; color: var(--primary); }
.gadget-desc { font-size: 0.9em; color: #666; margin-top: 4px; }
```

---

## 2. naruto — 火影忍者

### 配色 CSS 变量

```css
:root {
  --primary: #FF6600;
  --secondary: #1A1A2E;
  --accent: #E43F3F;
  --accent2: #4ECDC4;
  --bg: #1A1A2E;
  --panel-bg: #F5F0E8;
  --text: #1A1A2E;
  --bubble-mentor: #E8E0D0;
  --bubble-learner: #FFE0B2;
  --highlight-bg: #FFF3E0;
  --border-radius: 4px;
}
```

### 角色设定

| 角色 | 身份 | Emoji | 口头禅 | 气泡颜色 |
|------|------|-------|--------|---------|
| 卡卡西 | 导师 | 🥷 | "好了，今天的任务是..." | `--bubble-mentor` |
| 鸣人 | 实践者 | 🍥 | "说干就干，影分身之术！" | `--bubble-learner` |
| 小樱 | 分析者 | 🌸 | "等等，让我分析一下..." | #FFE0F0 |
| 佐助 | 高级技巧 | ⚡ | "太慢了，还有更强的方法" | #E0E0FF |

### 面板样式

```css
.panel { border: 2px solid #1A1A2E; border-radius: 4px; background: var(--panel-bg); box-shadow: 3px 3px 0 rgba(0,0,0,0.3); position: relative; }
.panel::before { content: ''; position: absolute; top: -2px; left: -2px; right: -2px; bottom: -2px; background: linear-gradient(45deg, #FF6600, #E43F3F); z-index: -1; border-radius: 6px; }
```

### 忍术卷轴面板

技术概念用卷轴样式展示：竹简背景 + 毛笔字标题。

```css
.scroll-panel { background: linear-gradient(180deg, #D4C5A9 0%, #E8DCC8 5%, #F5F0E8 10%, #F5F0E8 90%, #E8DCC8 95%, #D4C5A9 100%); border: none; padding: 24px 32px; position: relative; }
.scroll-panel::before, .scroll-panel::after { content: ''; display: block; height: 12px; background: #8B7355; border-radius: 6px; margin: 0 -16px; }
```

---

## 3. onepiece — 海贼王

### 配色 CSS 变量

```css
:root {
  --primary: #CC0000;
  --secondary: #0066CC;
  --accent: #FFD700;
  --accent2: #F4A460;
  --bg: #FFF8F0;
  --panel-bg: #FFFFFF;
  --text: #2C1810;
  --bubble-mentor: #E0F0FF;
  --bubble-learner: #FFF0E0;
  --highlight-bg: #FFFDE7;
  --border-radius: 12px;
}
```

### 角色设定

| 角色 | 身份 | Emoji | 口头禅 | 气泡颜色 |
|------|------|-------|--------|---------|
| 路飞 | 探索者/队长 | 🏴‍☠️ | "出发吧！我要成为..." | `--bubble-learner` |
| 罗宾 | 知识者/考古 | 📚 | "根据文献记载..." | `--bubble-mentor` |
| 弗兰奇 | 工程师/建造者 | 🔧 | "SUPER！让我来造一个..." | #E0FFE0 |
| 娜美 | 策略者/导航 | 🗺️ | "按照这个路线图走..." | #FFE8F0 |

### 面板样式

```css
.panel { border: 3px solid #2C1810; border-radius: 12px; background: white; position: relative; }
.panel-title { background: linear-gradient(90deg, #CC0000, #8B0000); color: #FFD700; font-family: serif; font-weight: bold; letter-spacing: 2px; }
```

### 航海图面板

架构图用航海地图风格：羊皮纸底纹 + 罗盘 + 航线连接。

```css
.map-panel { background: url("data:image/svg+xml,...") #F4E4C1; border: 3px double #8B7355; padding: 20px; }
.map-route { stroke: #CC0000; stroke-width: 3; stroke-dasharray: 8 4; fill: none; }
.map-island { fill: #FFD700; stroke: #2C1810; stroke-width: 2; }
```

---

## 4. dragonball — 龙珠

### 配色 CSS 变量

```css
:root {
  --primary: #FF8C00;
  --secondary: #1E90FF;
  --accent: #FFD700;
  --accent2: #FF4500;
  --bg: #FFF5E6;
  --panel-bg: #FFFFFF;
  --text: #1A1A1A;
  --bubble-mentor: #E0F0FF;
  --bubble-learner: #FFE8CC;
  --highlight-bg: #FFF9C4;
  --border-radius: 8px;
}
```

### 角色设定

| 角色 | 身份 | Emoji | 口头禅 |
|------|------|-------|--------|
| 悟空 | 挑战者 | 🐉 | "太强了！再来一次！" |
| 界王 | 导师 | 👴 | "听好了悟空..." |
| 贝吉塔 | 竞争对比 | 💥 | "卡卡罗特，看我的！" |
| 布尔玛 | 技术支持 | 🔬 | "用龙珠雷达分析一下..." |

### 战斗力面板

数值对比用战斗力探测器风格：绿色数字 + 扫描线 + 对比条。

```css
.power-panel { background: #000; color: #00FF00; font-family: 'Courier New', monospace; border: 2px solid #00FF00; padding: 16px; }
.power-bar { height: 20px; background: linear-gradient(90deg, #00FF00, #FFFF00, #FF0000); border-radius: 4px; transition: width 0.5s; }
.power-value { font-size: 2em; font-weight: bold; text-shadow: 0 0 10px #00FF00; }
```

---

## 5. spyfamily — 间谍过家家

### 配色 CSS 变量

```css
:root {
  --primary: #2D5A3D;
  --secondary: #1C1C1C;
  --accent: #FFB6C1;
  --accent2: #DAA520;
  --bg: #F0EDE5;
  --panel-bg: #FFFFFF;
  --text: #1C1C1C;
  --bubble-mentor: #E8F5E9;
  --bubble-learner: #FFE0EC;
  --highlight-bg: #FFF8E1;
  --border-radius: 8px;
}
```

### 角色设定

| 角色 | 身份 | Emoji | 口头禅 |
|------|------|-------|--------|
| 黄昏(Loid) | 分析者/间谍 | 🕵️ | "任务概要如下..." |
| 阿尼亚 | 好奇宝宝 | 🥜 | "哇库哇库！阿尼亚想知道！" |
| 约尔 | 守护者/安全 | 🌹 | "交给我来保护" |
| 弗兰基 | 情报技术 | 🔑 | "情报网已经部署完成" |

### 任务档案面板

```css
.mission-panel { background: #F0EDE5; border: 1px solid #CCC; padding: 20px; position: relative; }
.mission-panel::before { content: 'CLASSIFIED'; position: absolute; top: 10px; right: 10px; color: #CC0000; font-weight: bold; font-size: 0.8em; border: 2px solid #CC0000; padding: 2px 8px; transform: rotate(12deg); }
.mission-stamp { color: #CC0000; border: 3px solid #CC0000; padding: 4px 12px; transform: rotate(-5deg); display: inline-block; font-weight: bold; }
```

---

## 6. chibi — Q版萌系

### 配色 CSS 变量

```css
:root {
  --primary: #FF6B9D;
  --secondary: #C084FC;
  --accent: #FCD34D;
  --accent2: #6EE7B7;
  --bg: #FFF0F5;
  --panel-bg: #FFFFFF;
  --text: #4A4A4A;
  --bubble-mentor: #F0E6FF;
  --bubble-learner: #FFF0F5;
  --highlight-bg: #FFFDE7;
  --border-radius: 24px;
}
```

### 角色设定

Q版风格不绑定特定IP角色，使用通用可爱角色：

| 角色 | 身份 | Emoji | 特征 |
|------|------|-------|------|
| 老师喵 | 导师 | 🐱 | 戴眼镜的猫咪，温柔讲解 |
| 学生汪 | 学习者 | 🐶 | 好奇的小狗，爱提问 |
| 助手兔 | 补充者 | 🐰 | 举着小旗帜，标注重点 |

### 面板样式

```css
.panel { border: 3px solid var(--primary); border-radius: 24px; background: white; box-shadow: 0 4px 12px rgba(255,107,157,0.15); }
.panel-title { background: linear-gradient(135deg, #FF6B9D, #C084FC); color: white; border-radius: 20px 20px 0 0; padding: 10px 16px; }
```

---

## 7. guofeng — 国风水墨

### 配色 CSS 变量

```css
:root {
  --primary: #2C2C2C;
  --secondary: #C41E3A;
  --accent: #8B6914;
  --accent2: #2E8B57;
  --bg: #F5F0E8;
  --panel-bg: #FAF6EF;
  --text: #2C2C2C;
  --bubble-mentor: #F0EBE0;
  --bubble-learner: #E8F0E0;
  --highlight-bg: #FFF8E8;
  --border-radius: 4px;
}
```

### 角色设定

| 角色 | 身份 | Emoji | 口头禅 |
|------|------|-------|--------|
| 仙人 | 导师 | 🧙 | "且听为师道来..." |
| 少侠 | 学习者 | ⚔️ | "师父，弟子不解..." |
| 书童 | 记录者 | 📜 | "此处要点已记下" |

### 面板样式

```css
.panel { border: 1px solid #D4C5A9; background: var(--panel-bg); box-shadow: 2px 2px 8px rgba(0,0,0,0.08); }
.panel-title { font-family: 'STKaiti', 'KaiTi', serif; font-size: 1.3em; color: var(--secondary); border-bottom: 1px solid #D4C5A9; padding: 12px 16px; }
```

### 水墨图解面板

```css
.ink-panel { background: #FAF6EF; border: none; position: relative; padding: 24px; }
.ink-panel::before { content: ''; position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: radial-gradient(ellipse at 30% 50%, rgba(44,44,44,0.03) 0%, transparent 70%); pointer-events: none; }
.ink-title { font-family: 'STKaiti', serif; font-size: 1.5em; color: #2C2C2C; }
.ink-divider { border: none; border-top: 1px solid #D4C5A9; margin: 16px 0; }
```

---

## 8. ghibli — 吉卜力

### 配色 CSS 变量

```css
:root {
  --primary: #4CAF50;
  --secondary: #87CEEB;
  --accent: #8B7355;
  --accent2: #FFB74D;
  --bg: #F0F7ED;
  --panel-bg: #FFFFFF;
  --text: #3E2723;
  --bubble-mentor: #E8F5E9;
  --bubble-learner: #E3F2FD;
  --highlight-bg: #FFF8E1;
  --border-radius: 16px;
}
```

### 角色设定

| 角色 | 身份 | Emoji | 风格描述 |
|------|------|-------|---------|
| 少女 | 探索者 | 🌾 | 好奇勇敢，代表学习者 |
| 老者 | 智者/导师 | 🌳 | 温和慈祥，缓缓道来 |
| 精灵 | 辅助提示 | ✨ | 飘浮出现，提供关键线索 |
| 猫巴士 | 运输/连接 | 🐱 | 连接不同知识领域 |

### 面板样式

```css
.panel { border: 2px solid #A5D6A7; border-radius: 16px; background: white; box-shadow: 0 3px 10px rgba(76,175,80,0.1); }
.panel-title { background: linear-gradient(135deg, #81C784, #66BB6A); color: white; border-radius: 14px 14px 0 0; padding: 10px 16px; }
```

---

## 9. shinchan — 蜡笔小新

### 配色 CSS 变量

```css
:root {
  --primary: #FFEB3B;
  --secondary: #F44336;
  --accent: #2196F3;
  --accent2: #4CAF50;
  --bg: #FFFDE7;
  --panel-bg: #FFFFFF;
  --text: #333333;
  --bubble-mentor: #E3F2FD;
  --bubble-learner: #FFF9C4;
  --highlight-bg: #FFEBEE;
  --border-radius: 16px;
}
```

### 角色设定

| 角色 | 身份 | Emoji | 口头禅 |
|------|------|-------|--------|
| 小新 | 犯错者 | 🖍️ | "诶~这样不行吗？" |
| 风间 | 纠正者 | 🤓 | "小新你又搞错了！正确的是..." |
| 妮妮 | 补充建议 | 🎀 | "我觉得还可以这样..." |
| 园长 | 权威总结 | 👨‍🏫 | "孩子们，记住要点！" |

### 面板样式

```css
.panel { border: 3px solid #333; border-radius: 16px; background: white; box-shadow: 4px 4px 0 #333; }
.panel-title { background: #FFEB3B; color: #333; border-radius: 12px 12px 0 0; padding: 8px 16px; font-weight: bold; }
```

### 错误警示面板

```css
.error-panel { background: #FFEBEE; border: 3px dashed #F44336; border-radius: 16px; padding: 16px; }
.error-panel::before { content: '❌ 错误示范'; display: block; color: #F44336; font-weight: bold; font-size: 1.1em; margin-bottom: 8px; }
.correct-panel { background: #E8F5E9; border: 3px solid #4CAF50; border-radius: 16px; padding: 16px; }
.correct-panel::before { content: '✅ 正确做法'; display: block; color: #4CAF50; font-weight: bold; font-size: 1.1em; margin-bottom: 8px; }
```

---

## 10. conan — 名侦探柯南

### 配色 CSS 变量

```css
:root {
  --primary: #003366;
  --secondary: #B22222;
  --accent: #FFD700;
  --accent2: #4169E1;
  --bg: #F0F2F5;
  --panel-bg: #FFFFFF;
  --text: #1A1A2E;
  --bubble-mentor: #E8EAF6;
  --bubble-learner: #FFF8E1;
  --highlight-bg: #E3F2FD;
  --border-radius: 8px;
}
```

### 角色设定

| 角色 | 身份 | Emoji | 口头禅 |
|------|------|-------|--------|
| 柯南 | 推理分析者 | 🔍 | "真相只有一个！" |
| 阿笠博士 | 技术支持 | 🧪 | "新发明派上用场了" |
| 小�的目暮警官 | 问题提出者 | 👮 | "这个案件/Bug很棘手啊..." |
| 灰原哀 | 冷静分析 | 🧬 | "从数据来看..." |

### 面板样式

```css
.panel { border: 2px solid var(--primary); border-radius: 8px; background: white; box-shadow: 0 2px 8px rgba(0,0,0,0.1); }
.panel-title { background: var(--primary); color: white; padding: 8px 16px; font-weight: bold; }
```

### 推理线索板

```css
.clue-board { background: #2C3E50; color: white; border-radius: 8px; padding: 20px; }
.clue-item { background: #FFF9C4; color: #333; padding: 8px 12px; border-radius: 4px; margin: 4px; display: inline-block; transform: rotate(var(--rotate, 0deg)); box-shadow: 2px 2px 4px rgba(0,0,0,0.3); }
.clue-connection { border-top: 2px dashed #FF0000; margin: 8px 0; }
.clue-conclusion { background: #FF0000; color: white; padding: 8px 16px; border-radius: 4px; font-weight: bold; text-align: center; margin-top: 12px; }
```

---

## 11. custom — 自定义风格

用户通过自然语言描述风格，Agent 据此生成 CSS 变量和面板样式。

**用户描述示例：**
- "赛博朋克风格，暗色背景，霓虹灯颜色"
- "宫崎骏水彩风，柔和渐变，手绘边框"
- "极简北欧风，大量留白，线条图标"

**Agent 处理流程：**
1. 解析用户描述中的视觉关键词
2. 生成对应的 CSS 变量和面板样式
3. 创建通用角色（导师/学习者/助手）
4. 应用到标准模板中

---

## 通用规则

### 面板间距

```css
.panel + .panel { margin-top: 20px; }
```

### 响应式适配

```css
.comic-container { max-width: 480px; margin: 0 auto; padding: 16px; }
@media (min-width: 768px) { .comic-container { max-width: 600px; padding: 24px; } }
```

### 字体层级

```css
.chapter-title { font-size: 1.8em; font-weight: bold; }
.panel-title { font-size: 1.1em; font-weight: bold; }
.dialogue-text { font-size: 1em; line-height: 1.6; }
.highlight-text { font-size: 0.95em; line-height: 1.5; }
.caption { font-size: 0.85em; color: #888; }
```
