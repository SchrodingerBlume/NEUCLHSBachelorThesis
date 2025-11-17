# .dtx/.ins 工作流程可视化

## 一、完整工作流程图

```
┌─────────────────────────────────────────────────────────────┐
│                    开发者编写 .dtx 文件                      │
│  ┌───────────────────────────────────────────────────────┐  │
│  │ NEUCLHSBachelorThesis.dtx                            │  │
│  │                                                       │  │
│  │  % \iffalse meta-comment                            │  │
│  │  %   [安装脚本、README等元信息]                      │  │
│  │  % \fi                                               │  │
│  │                                                       │  │
│  │  %<*driver>                                          │  │
│  │  \documentclass{ltxdoc}                             │  │
│  │  \begin{document}                                    │  │
│  │  \DocInput{\jobname.dtx}                            │  │
│  │  \end{document}                                      │  │
│  │  %</driver>                                          │  │
│  │                                                       │  │
│  │  % \section{使用说明}                                │  │
│  │  % [用户文档内容]                                    │  │
│  │                                                       │  │
│  │  % \section{代码实现}                                │  │
│  │                                                       │  │
│  │  %<*class>                                           │  │
│  │  \ProvidesClass{NEUCLHSBachelorThesis}[...]         │  │
│  │  \LoadClass{ctexbook}                               │  │
│  │  % [更多代码]                                        │  │
│  │  %</class>                                           │  │
│  │                                                       │  │
│  │  %<*package>                                         │  │
│  │  \ProvidesPackage{untilchapter}[...]               │  │
│  │  % [宏包代码]                                        │  │
│  │  %</package>                                         │  │
│  │                                                       │  │
│  └───────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────┘
                              │
                              │ xelatex xxx.dtx
                              ↓
┌─────────────────────────────────────────────────────────────┐
│                  生成两个文件                                │
├──────────────────────────────┬──────────────────────────────┤
│                              │                              │
│  ┌────────────────────────┐ │ ┌────────────────────────┐  │
│  │ xxx.ins                │ │ │ xxx.pdf                │  │
│  │ (安装脚本)             │ │ │ (用户文档)             │  │
│  │                        │ │ │                        │  │
│  │ \input docstrip.tex    │ │ │ [目录]                 │  │
│  │ \generate{             │ │ │ 1. 简介                │  │
│  │   \file{xxx.cls}{      │ │ │ 2. 使用说明            │  │
│  │     \from{xxx.dtx}     │ │ │ 3. 代码实现            │  │
│  │          {class}       │ │ │    - 文档类声明        │  │
│  │   }                    │ │ │    - 字体配置          │  │
│  │   \file{yyy.sty}{      │ │ │    - 命令定义          │  │
│  │     \from{xxx.dtx}     │ │ │ [索引]                 │  │
│  │          {package}     │ │ │ [变更日志]             │  │
│  │   }                    │ │ │                        │  │
│  │ }                      │ │ └────────────────────────┘  │
│  └────────────────────────┘ │          │                   │
│              │               │          │ texdoc xxx       │
│              │               │          ↓                   │
│              │ latex xxx.ins │    ┌──────────────┐         │
│              ↓               │    │ 用户查看文档 │         │
│  ┌────────────────────────┐ │    └──────────────┘         │
│  │ DocStrip 处理          │ │                              │
│  │ ┌────────────────────┐ │ │                              │
│  │ │1. 读取 xxx.dtx    │ │ │                              │
│  │ │2. 查找 %<*class>  │ │ │                              │
│  │ │3. 提取代码块      │ │ │                              │
│  │ │4. 添加 preamble   │ │ │                              │
│  │ │5. 写入 xxx.cls    │ │ │                              │
│  │ └────────────────────┘ │ │                              │
│  └────────────────────────┘ │                              │
│              │               │                              │
│              ↓               │                              │
│  ┌────────────────────────┐ │                              │
│  │ 生成的文件             │ │                              │
│  ├────────────────────────┤ │                              │
│  │ NEUCLHSBachelor-      │ │                              │
│  │ Thesis.cls             │ │                              │
│  │                        │ │                              │
│  │ untilchapter.sty       │ │                              │
│  └────────────────────────┘ │                              │
└──────────────────────────────┴──────────────────────────────┘
                │
                │ 安装到 TeX 搜索路径
                ↓
┌─────────────────────────────────────────────────────────────┐
│                   用户使用                                   │
│                                                              │
│  \documentclass{NEUCLHSBachelorThesis}                      │
│  \usepackage{untilchapter}                                  │
│                                                              │
│  \begin{document}                                            │
│  ...                                                         │
│  \end{document}                                              │
└─────────────────────────────────────────────────────────────┘
```

## 二、DocStrip 提取过程详解

```
输入：demo-simple.dtx
┌──────────────────────────────────────────┐
│ % \iffalse                               │ ← 元注释，跳过
│ % 元信息                                 │
│ % \fi                                    │
├──────────────────────────────────────────┤
│ % \section{使用说明}                     │ ← 文档部分，跳过
│ % 这是文档内容...                        │
├──────────────────────────────────────────┤
│ % \iffalse                               │ ← 开始守卫区域
│ %<*package>          ← 标记开始          │
│ % \fi                                    │
├──────────────────────────────────────────┤
│ %    \begin{macrocode}                   │ ← ltxdoc 标记，移除
│ \ProvidesPackage{demo}[...]     ✓ 提取  │
│ \newcommand{\hello}{...}         ✓ 提取  │
│ \endinput                        ✓ 提取  │
│ %    \end{macrocode}                     │ ← ltxdoc 标记，移除
├──────────────────────────────────────────┤
│ % \iffalse                               │
│ %</package>          ← 标记结束          │
│ % \fi                                    │
└──────────────────────────────────────────┘
                │
                │ DocStrip 过滤
                ↓
输出：demosimple.sty
┌──────────────────────────────────────────┐
│ %% 文件头注释 (from \preamble)          │
│ %%                                       │
│ \ProvidesPackage{demo}[...]              │
│ \newcommand{\hello}{...}                 │
│ \endinput                                │
│ %%                                       │
│ %% 文件尾注释 (from \postamble)         │
└──────────────────────────────────────────┘
```

## 三、标记匹配过程

### 示例1：简单标记

```
.dtx 文件：
┌────────────────────────────────┐
│ 第1行：% 普通注释              │ → 跳过
│ 第2行：%<*package>             │ → 开始提取
│ 第3行：\ProvidesPackage{...}   │ → 提取 ✓
│ 第4行：\newcommand{...}        │ → 提取 ✓
│ 第5行：%</package>             │ → 停止提取
│ 第6行：% 更多文档              │ → 跳过
└────────────────────────────────┘

.ins 文件：
\file{demo.sty}{\from{demo.dtx}{package}}
                                    ↑
                                匹配这个标记

生成的 .sty：
┌────────────────────────────────┐
│ \ProvidesPackage{...}          │
│ \newcommand{...}               │
└────────────────────────────────┘
```

### 示例2：多重标记

```
.dtx 文件：
┌────────────────────────────────┐
│ %<*class>                      │ ← class 标记开始
│   \ProvidesClass{...}          │
│   %<*font>                     │ ← font 子标记开始
│     \setmainfont{...}          │
│   %</font>                     │ ← font 子标记结束
│ %</class>                      │ ← class 标记结束
│                                │
│ %<*package>                    │ ← package 标记开始
│   \ProvidesPackage{...}        │
│ %</package>                    │
└────────────────────────────────┘

.ins 指令1：\from{xxx.dtx}{class}
生成：
┌────────────────────────────────┐
│ \ProvidesClass{...}            │
│ \setmainfont{...}              │ ← 包含 font 子标记
└────────────────────────────────┘

.ins 指令2：\from{xxx.dtx}{package}
生成：
┌────────────────────────────────┐
│ \ProvidesPackage{...}          │
└────────────────────────────────┘
```

### 示例3：逻辑组合

```
.dtx 文件：
┌────────────────────────────────┐
│ %<*class|package>              │ ← class 或 package
│   \RequirePackage{xcolor}      │
│ %</class|package>              │
│                                │
│ %<*!driver>                    │ ← 除了 driver
│   \newcommand{\foo}{bar}       │
│ %</!driver>                    │
└────────────────────────────────┘

提取 class 时：
  ✓ \RequirePackage{xcolor}  (class|package 匹配)
  ✓ \newcommand{\foo}{bar}   (!driver 匹配)

提取 driver 时：
  ✓ \RequirePackage{xcolor}  (class|package 匹配)
  ✗ \newcommand{\foo}{bar}   (!driver 不匹配)
```

## 四、实际转换示例

### 从 .cls 到 .dtx 的转换

**原始文件（simplified.cls）：**

```latex
\ProvidesClass{simplified}[2025/11/17 v1.0 Simplified Class]
\LoadClass{article}
\RequirePackage{xcolor}
\newcommand{\highlight}[1]{\textcolor{red}{#1}}
```

**转换后（simplified.dtx）：**

```latex
% \iffalse meta-comment
%<*install>
\input docstrip.tex
\generate{\file{simplified.cls}{\from{simplified.dtx}{class}}}
\endbatchfile
%</install>
%<*driver>
\documentclass{ltxdoc}
\begin{document}\DocInput{simplified.dtx}\end{document}
%</driver>
% \fi
%
% \section{简化文档类}
%
% 这是一个简化的文档类示例。
%
% \subsection{使用方法}
%
% 在导言区使用：
% \begin{verbatim}
% \documentclass{simplified}
% \end{verbatim}
%
% \subsection{提供的命令}
%
% \DescribeMacro{\highlight}
% |\highlight{文本}| 命令将文本高亮为红色。
%
% \StopEventually{}
%
% \section{代码实现}
%
% \iffalse
%<*class>
% \fi
%
%    \begin{macrocode}
\ProvidesClass{simplified}[2025/11/17 v1.0 Simplified Class]
%    \end{macrocode}
%
% 加载基础文档类：
%    \begin{macrocode}
\LoadClass{article}
%    \end{macrocode}
%
% 加载颜色支持：
%    \begin{macrocode}
\RequirePackage{xcolor}
%    \end{macrocode}
%
% \begin{macro}{\highlight}
% 高亮命令，将文本变为红色：
%    \begin{macrocode}
\newcommand{\highlight}[1]{\textcolor{red}{#1}}
%    \end{macrocode}
% \end{macro}
%
% \iffalse
%</class>
% \fi
%
% \Finale
\endinput
```

**转换步骤分解：**

1. **添加元注释区**（第1-10行）
   - 包含 install 部分（生成 .ins）
   - 包含 driver 部分（编译 .dtx）

2. **添加用户文档**（第12-22行）
   - 使用说明
   - 命令描述

3. **包裹代码**（第26-52行）
   - 用 `%<*class>..%</class>` 包围
   - 用 `\begin{macrocode}..\end{macrocode}` 标记
   - 添加详细注释说明

## 五、常见模式和最佳实践

### 模式1：单一文档类

```
.dtx 结构：
├── 元注释（install + driver）
├── 用户文档
│   ├── 简介
│   ├── 使用说明
│   └── 命令列表
└── 代码实现
    └── %<*class>..%</class>

生成：
- xxx.ins  (从 install 部分)
- xxx.cls  (从 class 部分)
- xxx.pdf  (从整个 dtx)
```

### 模式2：文档类 + 宏包

```
.dtx 结构：
├── 元注释（install + driver）
├── 用户文档
│   ├── 简介
│   ├── 文档类使用
│   └── 宏包使用
└── 代码实现
    ├── %<*class>..%</class>
    └── %<*package>..%</package>

生成：
- xxx.ins
- xxx.cls     (从 class 部分)
- xxx-helper.sty (从 package 部分)
- xxx.pdf
```

### 模式3：多文件项目

```
主 .dtx：
├── 元注释
├── 总体文档
└── 代码：
    ├── %<*main-class>..%</main-class>
    ├── %<*helper1>..%</helper1>
    └── %<*helper2>..%</helper2>

.ins 生成：
├── main.cls
├── helper1.sty
└── helper2.sty
```

## 六、调试技巧

### 技巧1：查看提取内容

在 .ins 中添加：

```latex
\Msg{*** Extracting class code ***}
\generate{
  \file{test.cls}{\from{source.dtx}{class}}
}
\Msg{*** Extraction complete ***}
```

### 技巧2：分步测试

```bash
# 步骤1：测试 .dtx 是否能编译
xelatex source.dtx

# 步骤2：检查是否生成 .ins
ls -l *.ins

# 步骤3：测试 .ins 提取
latex source.ins

# 步骤4：检查生成的文件
ls -l *.cls *.sty

# 步骤5：测试生成的文件
pdflatex test-document.tex
```

### 技巧3：使用日志

DocStrip 会输出详细日志：

```
This is DocStrip version ...
Generating file(s) test.cls
Processing file source.dtx (class) -> test.cls
Lines processed: 150
Comments removed: 50
Control sequences: 25
```

## 七、性能对比

### 文件大小对比

```
传统方式：
├── example.cls     (10 KB)
├── example-doc.tex (5 KB)
└── example.pdf     (100 KB)
总计：115 KB

.dtx/.ins 方式：
├── example.dtx     (30 KB) ← 包含代码+文档
├── example.ins     (2 KB)
└── example.pdf     (150 KB) ← 更详细的文档
总计：182 KB

分发时只需：
├── example.dtx     (30 KB)
├── example.ins     (2 KB)
└── example.pdf     (150 KB)
用户运行 latex example.ins 生成 .cls
```

### 维护成本对比

```
传统方式：
修改代码 → 更新 .cls → 手动更新文档 → 可能不同步

.dtx/.ins 方式：
修改 .dtx → 自动生成 .cls 和文档 → 永远同步
```

## 八、总结

```
┌──────────────────────────────────────────────────────┐
│              .dtx/.ins 核心优势                      │
├──────────────────────────────────────────────────────┤
│                                                      │
│  1. 文学编程：代码即文档，文档即代码                │
│  2. 自动同步：代码修改自动反映在文档                │
│  3. 专业标准：CTAN 推荐，LaTeX 社区认可             │
│  4. 易于维护：结构清晰，便于长期维护                │
│  5. 自动索引：命令、宏、变量自动生成索引            │
│  6. 变更追踪：集成的变更日志系统                    │
│                                                      │
└──────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────┐
│              何时使用 .dtx/.ins                      │
├──────────────────────────────────────────────────────┤
│                                                      │
│  推荐使用：                                          │
│  ✓ 发布到 CTAN 的宏包/文档类                        │
│  ✓ 需要详细代码文档                                 │
│  ✓ 长期维护的项目                                   │
│  ✓ 多人协作的项目                                   │
│                                                      │
│  可以不用：                                          │
│  ○ 简单的个人项目                                   │
│  ○ 代码量很小（<100行）                            │
│  ○ 首次发布（可后续迁移）                           │
│                                                      │
└──────────────────────────────────────────────────────┘
```

---

**下一步行动：**

1. 如果选择使用 .dtx/.ins：
   - 学习本文档的示例
   - 从简单项目开始练习
   - 逐步转换现有代码

2. 如果暂不使用：
   - 在代码中添加详细注释
   - 提供单独的 PDF 文档
   - 将来有需要时再迁移
