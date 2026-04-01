# HTML 漫画模板规范

所有生成的漫画 HTML 遵循此模板结构。每个文件完全自包含（无外部依赖），可离线浏览。

---

## 基础 HTML 骨架

```html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>第X话：标题 | 漫画名</title>
  <style>
    /* === 重置 === */
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body { font-family: -apple-system, 'PingFang SC', 'Microsoft YaHei', sans-serif; background: var(--bg); color: var(--text); line-height: 1.6; }

    /* === 风格变量（替换为对应风格的变量） === */
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

    /* === 容器 === */
    .comic-container { max-width: 480px; margin: 0 auto; padding: 16px 12px; }
    @media (min-width: 768px) { .comic-container { max-width: 600px; padding: 24px; } }

    /* === 章节头 === */
    .chapter-header { text-align: center; padding: 32px 16px; margin-bottom: 24px; background: linear-gradient(180deg, var(--primary), transparent); border-radius: var(--border-radius); color: white; }
    .chapter-number { font-size: 0.9em; opacity: 0.8; margin-bottom: 4px; }
    .chapter-title { font-size: 1.8em; font-weight: bold; text-shadow: 1px 1px 2px rgba(0,0,0,0.2); }
    .chapter-subtitle { font-size: 0.95em; opacity: 0.9; margin-top: 8px; }

    /* === 面板 === */
    .panel { background: var(--panel-bg); border: 3px solid var(--primary); border-radius: var(--border-radius); margin-bottom: 20px; overflow: hidden; box-shadow: 4px 4px 0 rgba(0,0,0,0.08); }
    .panel-title-bar { background: var(--primary); color: white; padding: 8px 16px; font-weight: bold; font-size: 1.05em; }
    .panel-body { padding: 16px; }

    /* === 对话气泡 === */
    .dialogue { display: flex; gap: 12px; margin-bottom: 16px; align-items: flex-start; }
    .dialogue.reverse { flex-direction: row-reverse; }
    .dialogue-avatar { width: 48px; height: 48px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 1.8em; flex-shrink: 0; background: var(--panel-bg); border: 2px solid var(--primary); }
    .dialogue-bubble { position: relative; padding: 12px 16px; border-radius: 16px; max-width: calc(100% - 68px); font-size: 0.95em; line-height: 1.6; }
    .dialogue-bubble.mentor { background: var(--bubble-mentor); }
    .dialogue-bubble.learner { background: var(--bubble-learner); }
    .dialogue-bubble::before { content: ''; position: absolute; top: 14px; width: 0; height: 0; border: 8px solid transparent; }
    .dialogue:not(.reverse) .dialogue-bubble::before { left: -14px; border-right-color: var(--bubble-mentor); }
    .dialogue.reverse .dialogue-bubble::before { right: -14px; border-left-color: var(--bubble-learner); }
    .dialogue-name { font-size: 0.8em; font-weight: bold; color: var(--primary); margin-bottom: 4px; }

    /* === 知识点高亮框 === */
    .highlight-box { background: var(--highlight-bg); border-left: 4px solid var(--accent2); border-radius: 0 var(--border-radius) var(--border-radius) 0; padding: 16px; margin: 16px 0; }
    .highlight-box .icon { font-size: 1.3em; margin-right: 8px; }
    .highlight-box .title { font-weight: bold; font-size: 1.05em; margin-bottom: 8px; display: flex; align-items: center; }
    .highlight-box ul { padding-left: 20px; }
    .highlight-box li { margin-bottom: 4px; }

    /* === 图解面板 === */
    .diagram-panel { background: var(--panel-bg); border: 2px dashed var(--primary); border-radius: var(--border-radius); padding: 20px; margin: 16px 0; }
    .diagram-title { text-align: center; font-weight: bold; font-size: 1.1em; color: var(--primary); margin-bottom: 16px; }

    /* 架构图 - 垂直层级 */
    .arch-layers { display: flex; flex-direction: column; gap: 8px; }
    .arch-layer { padding: 12px 16px; border-radius: 8px; text-align: center; font-weight: bold; color: white; position: relative; }
    .arch-layer::after { content: '↓'; position: absolute; bottom: -16px; left: 50%; transform: translateX(-50%); color: var(--text); font-size: 1.2em; z-index: 1; }
    .arch-layer:last-child::after { display: none; }

    /* 流程图 - 横向 */
    .flow-chart { display: flex; align-items: center; gap: 8px; overflow-x: auto; padding: 8px 0; }
    .flow-step { background: var(--primary); color: white; padding: 8px 14px; border-radius: 8px; font-size: 0.85em; white-space: nowrap; text-align: center; min-width: 70px; }
    .flow-arrow { color: var(--primary); font-size: 1.2em; flex-shrink: 0; }

    /* 对比表格 */
    .compare-table { width: 100%; border-collapse: collapse; font-size: 0.9em; margin: 12px 0; }
    .compare-table th { background: var(--primary); color: white; padding: 8px 12px; text-align: left; }
    .compare-table td { padding: 8px 12px; border-bottom: 1px solid #eee; }
    .compare-table tr:nth-child(even) td { background: rgba(0,0,0,0.02); }

    /* === 道具/概念卡片 === */
    .concept-card { background: linear-gradient(135deg, #FFFDE7, #FFF9C4); border: 3px solid var(--accent2); border-radius: var(--border-radius); padding: 20px; margin: 16px 0; text-align: center; }
    .concept-card .emoji { font-size: 2.5em; margin-bottom: 8px; }
    .concept-card .name { font-size: 1.4em; font-weight: bold; color: var(--primary); }
    .concept-card .desc { font-size: 0.9em; color: #666; margin-top: 8px; line-height: 1.5; }

    /* === 代码面板 === */
    .code-panel { background: #1E1E2E; color: #CDD6F4; border-radius: 12px; padding: 16px; margin: 12px 0; overflow-x: auto; }
    .code-panel pre { font-family: 'Courier New', 'SF Mono', monospace; font-size: 0.85em; line-height: 1.6; white-space: pre-wrap; }
    .code-panel .comment { color: #6C7086; }
    .code-panel .keyword { color: #CBA6F7; }
    .code-panel .string { color: #A6E3A1; }
    .code-panel .function { color: #89B4FA; }

    /* === 角色反应面板 === */
    .reaction { text-align: center; padding: 20px; margin: 12px 0; }
    .reaction .emoji { font-size: 3em; display: block; margin-bottom: 8px; }
    .reaction .text { font-size: 1.1em; font-weight: bold; color: var(--primary); }

    /* === 总结面板 === */
    .summary-panel { background: linear-gradient(135deg, var(--primary), color-mix(in srgb, var(--primary) 70%, black)); color: white; border-radius: var(--border-radius); padding: 24px; margin: 20px 0; }
    .summary-panel h3 { font-size: 1.2em; margin-bottom: 12px; }
    .summary-panel ul { padding-left: 20px; }
    .summary-panel li { margin-bottom: 6px; }
    .next-preview { margin-top: 16px; padding-top: 12px; border-top: 1px solid rgba(255,255,255,0.3); font-size: 0.9em; opacity: 0.9; }

    /* === 导航 === */
    .nav-bar { display: flex; justify-content: space-between; align-items: center; padding: 16px 0; margin-top: 24px; border-top: 2px solid var(--primary); }
    .nav-btn { display: inline-block; padding: 8px 20px; background: var(--primary); color: white; text-decoration: none; border-radius: 20px; font-size: 0.9em; transition: opacity 0.2s; }
    .nav-btn:hover { opacity: 0.85; }
    .nav-btn.disabled { background: #ccc; pointer-events: none; }
    .nav-home { font-size: 1.2em; text-decoration: none; color: var(--primary); }

    /* === 页脚 === */
    .footer { text-align: center; padding: 24px 16px; color: #999; font-size: 0.8em; }
  </style>
</head>
<body>
  <div class="comic-container">

    <!-- 章节头 -->
    <div class="chapter-header">
      <div class="chapter-number">第 1 话</div>
      <div class="chapter-title">标题</div>
      <div class="chapter-subtitle">副标题说明</div>
    </div>

    <!-- 开场面板 -->
    <div class="panel">
      <div class="panel-title-bar">场景：引入</div>
      <div class="panel-body">
        <div class="dialogue">
          <div class="dialogue-avatar">👦</div>
          <div class="dialogue-bubble learner">
            <div class="dialogue-name">大雄</div>
            哆啦A梦，这个好难啊...
          </div>
        </div>
        <div class="dialogue reverse">
          <div class="dialogue-avatar">🤖</div>
          <div class="dialogue-bubble mentor">
            <div class="dialogue-name">哆啦A梦</div>
            别担心！让我从百宝袋里拿出一个好东西...
          </div>
        </div>
      </div>
    </div>

    <!-- 概念卡片 -->
    <div class="concept-card">
      <div class="emoji">🦞</div>
      <div class="name">技术概念名称</div>
      <div class="desc">用一句话通俗解释这个概念</div>
    </div>

    <!-- 知识点框 -->
    <div class="highlight-box">
      <div class="title"><span class="icon">💡</span> 知识要点</div>
      <ul>
        <li>要点一</li>
        <li>要点二</li>
        <li>要点三</li>
      </ul>
    </div>

    <!-- 架构图解面板 -->
    <div class="diagram-panel">
      <div class="diagram-title">系统架构</div>
      <div class="arch-layers">
        <div class="arch-layer" style="background: #FF6B6B;">交互层</div>
        <div class="arch-layer" style="background: #4ECDC4;">网关层</div>
        <div class="arch-layer" style="background: #45B7D1;">智能体层</div>
        <div class="arch-layer" style="background: #96CEB4;">执行层</div>
      </div>
    </div>

    <!-- 流程图 -->
    <div class="diagram-panel">
      <div class="diagram-title">执行流程</div>
      <div class="flow-chart">
        <div class="flow-step">输入</div>
        <div class="flow-arrow">→</div>
        <div class="flow-step">解析</div>
        <div class="flow-arrow">→</div>
        <div class="flow-step">执行</div>
        <div class="flow-arrow">→</div>
        <div class="flow-step">输出</div>
      </div>
    </div>

    <!-- 代码面板 -->
    <div class="code-panel">
      <pre><span class="comment"># 示例代码</span>
<span class="keyword">def</span> <span class="function">hello</span>():
    <span class="keyword">return</span> <span class="string">"Hello, World!"</span></pre>
    </div>

    <!-- 角色反应 -->
    <div class="reaction">
      <span class="emoji">😲</span>
      <span class="text">原来如此！</span>
    </div>

    <!-- 总结面板 -->
    <div class="summary-panel">
      <h3>📝 本话总结</h3>
      <ul>
        <li>要点一</li>
        <li>要点二</li>
        <li>要点三</li>
      </ul>
      <div class="next-preview">📖 下一话：标题预告...</div>
    </div>

    <!-- 导航 -->
    <div class="nav-bar">
      <a class="nav-btn disabled" href="#">← 上一话</a>
      <a class="nav-home" href="index.html">📖 目录</a>
      <a class="nav-btn" href="chapter02.html">下一话 →</a>
    </div>

    <div class="footer">
      漫画图解 by comic-guide-skill | 风格：哆啦A梦
    </div>
  </div>
</body>
</html>
```

---

## 目录页模板

```html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>漫画名 - 目录</title>
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body { font-family: -apple-system, 'PingFang SC', 'Microsoft YaHei', sans-serif; background: var(--bg); color: var(--text); }
    :root { --primary: #0099DD; --bg: #E8F4FD; --text: #333; --border-radius: 20px; }
    .container { max-width: 480px; margin: 0 auto; padding: 24px 16px; }
    .cover { text-align: center; padding: 48px 24px; background: linear-gradient(180deg, var(--primary), #006699); border-radius: var(--border-radius); color: white; margin-bottom: 24px; }
    .cover-emoji { font-size: 4em; margin-bottom: 16px; }
    .cover h1 { font-size: 1.8em; margin-bottom: 8px; }
    .cover p { opacity: 0.9; font-size: 0.95em; }
    .toc { list-style: none; }
    .toc li { margin-bottom: 12px; }
    .toc a { display: flex; align-items: center; gap: 12px; padding: 16px; background: white; border-radius: 12px; text-decoration: none; color: var(--text); border: 2px solid transparent; transition: border-color 0.2s, box-shadow 0.2s; box-shadow: 0 2px 8px rgba(0,0,0,0.05); }
    .toc a:hover { border-color: var(--primary); box-shadow: 0 4px 12px rgba(0,153,221,0.15); }
    .toc .num { width: 36px; height: 36px; background: var(--primary); color: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: bold; flex-shrink: 0; }
    .toc .info h3 { font-size: 1em; margin-bottom: 2px; }
    .toc .info p { font-size: 0.8em; color: #888; }
    .meta { text-align: center; padding: 24px; color: #999; font-size: 0.8em; }
  </style>
</head>
<body>
  <div class="container">
    <div class="cover">
      <div class="cover-emoji">🦞🤖</div>
      <h1>漫画标题</h1>
      <p>副标题描述</p>
      <p style="margin-top:8px;font-size:0.85em;opacity:0.7;">风格：哆啦A梦 | 共 5 话</p>
    </div>
    <ul class="toc">
      <li><a href="chapter01.html">
        <span class="num">1</span>
        <div class="info">
          <h3>第1话标题</h3>
          <p>简短描述</p>
        </div>
      </a></li>
      <!-- 更多章节... -->
    </ul>
    <div class="meta">由 comic-guide-skill 生成</div>
  </div>
</body>
</html>
```

---

## 组件使用规则

1. **每话面板数**：4-8 个面板，不要太多导致阅读疲劳
2. **对话与图解比例**：对话面板 40-50%，图解面板 20-30%，其余为知识点和反应
3. **代码面板**：仅在必要时使用，每话不超过 2 个
4. **概念卡片**：每话引入的核心新概念用概念卡片呈现（每话 1-2 个）
5. **颜色一致性**：同一话内架构图的颜色保持一致
6. **导航完整性**：每话必须有导航栏，首话的"上一话"设为 disabled，末话的"下一话"设为 disabled
