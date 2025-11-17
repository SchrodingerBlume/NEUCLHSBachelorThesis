# 将 NEUCLHSBachelorThesis.cls 转换为 .dtx 格式

## 完整转换指南

### 准备工作

1. **备份原文件**
```bash
cp NEUCLHSBachelorThesis.cls NEUCLHSBachelorThesis.cls.backup
cp untilchapter.sty untilchapter.sty.backup
```

2. **理解文件结构**
```
当前：
├── NEUCLHSBachelorThesis.cls  (1534 行代码)
├── untilchapter.sty           (宏包)
└── 使用说明与示例文档.pdf     (用户手册)

目标：
├── NEUCLHSBachelorThesis.dtx  (代码+文档合一)
├── NEUCLHSBachelorThesis.ins  (安装脚本)
└── NEUCLHSBachelorThesis.pdf  (从 dtx 生成)
```

---

## 步骤1：创建 .dtx 骨架

创建 `NEUCLHSBachelorThesis.dtx`，添加基础结构：

```latex
% \iffalse meta-comment
% !TeX program = XeLaTeX
% !TeX encoding = UTF-8
%
%<*internal>
\iffalse
%</internal>
%
%<*readme>
----------------------------------------------------------------
NEUCLHSBachelorThesis --- Bachelor Thesis LaTeX Template
Author:  Wu Junhao
E-mail:  neuclhswjh@163.com
License: LPPL v1.3c
Version: v1.1.1
Date:    2025-11-17
----------------------------------------------------------------
%</readme>
%
%<*internal>
\fi
\def\nameofplainTeX{plain}
\ifx\fmtname\nameofplainTeX\else
  \expandafter\begingroup
\fi
%</internal>
%
%<*install>
\input docstrip.tex
\keepsilent
\askforoverwritefalse

\preamble
----------------------------------------------------------------
NEUCLHSBachelorThesis --- Bachelor Thesis LaTeX Template
Author:  Wu Junhao
E-mail:  neuclhswjh@163.com
License: LPPL v1.3c or later
----------------------------------------------------------------
\endpreamble

\postamble
Copyright (C) 2025 by Wu Junhao <neuclhswjh@163.com>
This work may be distributed and/or modified under the
conditions of the LaTeX Project Public License (LPPL).
\endpostamble

\usedir{tex/latex/neuclhsbachelorthesis}
\generate{
  \file{NEUCLHSBachelorThesis.cls}{\from{\jobname.dtx}{class}}
  \file{untilchapter.sty}{\from{\jobname.dtx}{package}}
}
%</install>
%<install>\endbatchfile
%
%<*internal>
\usedir{source/latex/neuclhsbachelorthesis}
\generate{
  \file{\jobname.ins}{\from{\jobname.dtx}{install}}
}
\ifx\fmtname\nameofplainTeX
  \expandafter\endbatchfile
\else
  \expandafter\endgroup
\fi
%</internal>
% \fi
%
% \iffalse
%<*driver>
\ProvidesFile{NEUCLHSBachelorThesis.dtx}
%</driver>
%<class>\NeedsTeXFormat{LaTeX2e}[2020/10/01]
%<class>\ProvidesClass{NEUCLHSBachelorThesis}
%<class>  [2025/11/17 v1.1.1 Bachelor Thesis Template for NEU CLHS]
%<package>\NeedsTeXFormat{LaTeX2e}[2020/10/01]
%<package>\ProvidesPackage{untilchapter}
%<package>  [2025/11/17 v1.1.1 Page style management]
%
%<*driver>
\documentclass[a4paper]{ltxdoc}
\usepackage{xeCJK}
\usepackage{hyperref}
\setCJKmainfont{SimSun}
\EnableCrossrefs
\CodelineIndex
\RecordChanges
\begin{document}
  \DocInput{\jobname.dtx}
  \PrintChanges
  \PrintIndex
\end{document}
%</driver>
% \fi
%
% [这里开始添加文档和代码]
%
\endinput
```

---

## 步骤2：添加文档部分

在 `% [这里开始添加文档和代码]` 之后添加：

```latex
% \GetFileInfo{\jobname.dtx}
%
% \title{^^A
%   \textsf{NEUCLHSBachelorThesis} --- ^^A
%   东北大学生命科学与健康学院本科毕业论文模板\thanks{^^A
%     Version \fileversion, released \filedate.^^A
%   }^^A
% }
%
% \author{^^A
%   吴俊豪\thanks{^^A
%     E-mail: neuclhswjh@163.com^^A
%   }^^A
% }
%
% \date{Released \filedate}
%
% \maketitle
%
% \changes{v1.0.0}{2024/03/15}{首次发布}
% \changes{v1.1.0}{2025/10/15}{结构优化}
% \changes{v1.1.1}{2025/11/17}{细节修正}
%
% \begin{abstract}
% 本模板为东北大学生命科学与健康学院本科毕业论文 \LaTeX{} 模板。
% 严格按照学院要求制作，支持中英文混排、数学公式、参考文献管理等功能。
% \end{abstract}
%
% \tableofcontents
%
% \section{简介}
%
% \subsection{项目背景}
% 本项目为东北大学生命科学与健康学院本科毕业设计（论文）\LaTeX{} 模板...
%
% \subsection{系统要求}
% \begin{itemize}
%   \item \textbf{编译引擎}：必须使用 \XeLaTeX
%   \item \textbf{\TeX 发行版}：推荐 \TeX\ Live 2024 或更新版本
%   \item \textbf{中文字体}：需要中易宋体和中易黑体
% \end{itemize}
%
% \section{使用说明}
%
% \subsection{基本用法}
% 在文档导言区使用：
% \begin{verbatim}
% \documentclass{NEUCLHSBachelorThesis}
% \end{verbatim}
%
% [继续添加更多使用说明...]
%
% \StopEventually{^^A
%   \PrintChanges
%   \PrintIndex
% }
%
% \section{代码实现}
% 下面开始详细的代码实现...
```

---

## 步骤3：转换代码部分

### 3.1 转换文档类声明

**原始代码（.cls 第1-4行）：**
```latex
\ProvidesClass{NEUCLHSBachelorThesis}
\providecommand{\Version}{V-1.1.1}
\providecommand{\PrintMode}{twoside}
\LoadClass[UTF8,\PrintMode,a4paper,12pt]{ctexbook}
```

**转换为 .dtx 格式：**
```latex
% \subsection{文档类声明}
%
% \iffalse
%<*class>
% \fi
%
%    \begin{macrocode}
\NeedsTeXFormat{LaTeX2e}[2020/10/01]
\ProvidesClass{NEUCLHSBachelorThesis}
  [2025/11/17 v1.1.1 Bachelor Thesis Template for NEU CLHS]
%    \end{macrocode}
%
% \begin{macro}{\Version}
% 定义模板版本号：
%    \begin{macrocode}
\providecommand{\Version}{V-1.1.1}
%    \end{macrocode}
% \end{macro}
%
% \begin{macro}{\PrintMode}
% 定义打印模式（可通过配置文件修改）：
%    \begin{macrocode}
\providecommand{\PrintMode}{twoside}
%    \end{macrocode}
% \end{macro}
%
% 加载基础文档类 |ctexbook|，这是中文文档的标准选择。
% 我们使用 UTF-8 编码，支持双面打印，纸张为 A4，基础字号 12pt：
%    \begin{macrocode}
\LoadClass[UTF8,\PrintMode,a4paper,12pt]{ctexbook}
%    \end{macrocode}
```

**转换规则：**
1. 在代码前添加 `% \iffalse` 和 `%<*class>`
2. 在代码后添加 `%</class>` 和 `% \fi`
3. 用 `%    \begin{macrocode}` 和 `%    \end{macrocode}` 包围代码
4. 在代码前添加说明性文字
5. 使用 `\begin{macro}{命令名}...\end{macro}` 说明命令定义

### 3.2 转换宏包加载部分

**原始代码（.cls 第5-17行）：**
```latex
\RequirePackage{xeCJK}
\RequirePackage{pdfpages}
\RequirePackage{float}
\RequirePackage{flafter} % 不让浮动体出现在调用之前
...
```

**转换为 .dtx 格式：**
```latex
% \subsection{必需宏包}
%
% 加载所有必需的宏包：
%    \begin{macrocode}
\RequirePackage{xeCJK}        % CJK 支持
\RequirePackage{pdfpages}     % 插入 PDF 页面（彩色封面）
\RequirePackage{float}        % 浮动体控制
\RequirePackage{flafter}      % 不让浮动体出现在调用之前
\RequirePackage{subcaption}   % 子图支持
\captionsetup{hypcap=true}
\RequirePackage{xcolor}       % 颜色支持
\RequirePackage{ragged2e}     % 对齐控制
\RequirePackage{calc}         % 计算功能
\RequirePackage{lipsum}       % 示例文本
\RequirePackage{comment}      % 注释块
\RequirePackage{tikz}         % 绘图
\RequirePackage{needspace}    % 空间控制
%    \end{macrocode}
```

### 3.3 转换命令定义

**原始代码（.cls 第19-24行）：**
```latex
% 定义手动换页命令\huanye，根据oneside/twoside决定启用与否
\if@twoside
  \newcommand{\huanye}{\clearpage\thispagestyle{empty}\ }
\else
  \newcommand{\huanye}{}
\fi
```

**转换为 .dtx 格式：**
```latex
% \subsection{页面控制}
%
% \begin{macro}{\huanye}
% 定义手动换页命令。在双面打印模式下，这个命令会强制换页并清空页面样式；
% 在单面打印模式下，这个命令不做任何事情。
%
% 这个设计是为了在双面打印时，某些特殊页面（如封面、声明页）之后
% 能够插入一个空白页，以确保下一个内容页从奇数页开始。
%    \begin{macrocode}
\if@twoside
  \newcommand{\huanye}{\clearpage\thispagestyle{empty}\ }
\else
  \newcommand{\huanye}{}
\fi
%    \end{macrocode}
% \end{macro}
```

---

## 步骤4：处理复杂命令

对于复杂的命令定义，需要更详细的说明：

**原始代码（.cls 第98-129行，希腊字母命令）：**
```latex
% 小写希腊字母粗体命令
\newcommand{\bfalpha}{\symbf{\alpha}}
\newcommand{\bfbeta}{\symbf{\beta}}
...
```

**转换为 .dtx 格式：**
```latex
% \subsubsection{希腊字母粗体命令}
%
% 为方便在数学公式中使用粗体希腊字母，我们定义了一系列快捷命令。
% 这些命令使用 |unicode-math| 宏包提供的 |\symbf| 命令。
%
% \paragraph{小写希腊字母粗体}
%
% \begin{macro}{\bfalpha}
% \begin{macro}{\bfbeta}
% \begin{macro}{\bfgamma}
% 定义小写希腊字母的粗体版本：
%    \begin{macrocode}
\newcommand{\bfalpha}{\symbf{\alpha}}
\newcommand{\bfbeta}{\symbf{\beta}}
\newcommand{\bfgamma}{\symbf{\gamma}}
\newcommand{\bfdelta}{\symbf{\delta}}
%    \end{macrocode}
% [继续添加更多字母...]
%    \begin{macrocode}
\newcommand{\bfomega}{\symbf{\omega}}
%    \end{macrocode}
% \end{macro}
% \end{macro}
% \end{macro}
%
% 使用示例：
% \begin{verbatim}
% $\bfalpha + \bfbeta = \bfgamma$
% \end{verbatim}
```

---

## 步骤5：添加 untilchapter.sty 代码

在文档类代码之后添加：

```latex
% \iffalse
%</class>
% \fi
%
% \subsection{untilchapter 宏包}
%
% |untilchapter| 宏包用于页面样式管理...
%
% \iffalse
%<*package>
% \fi
%
%    \begin{macrocode}
\NeedsTeXFormat{LaTeX2e}[2020/10/01]
\ProvidesPackage{untilchapter}
  [2025/11/17 v1.1.1 Page style management for NEU thesis]
%    \end{macrocode}
%
% [添加 untilchapter.sty 的代码和说明...]
%
% \iffalse
%</package>
% \fi
```

---

## 步骤6：结束代码部分

在所有代码之后添加：

```latex
% \Finale
\endinput
```

---

## 步骤7：测试转换结果

### 7.1 生成 .ins 文件

```bash
xelatex NEUCLHSBachelorThesis.dtx
```

应该生成 `NEUCLHSBachelorThesis.ins`

### 7.2 从 .ins 生成 .cls 和 .sty

```bash
latex NEUCLHSBachelorThesis.ins
```

应该生成：
- `NEUCLHSBachelorThesis.cls`
- `untilchapter.sty`

### 7.3 对比验证

```bash
# 对比生成的 .cls 和原始 .cls
diff NEUCLHSBachelorThesis.cls NEUCLHSBachelorThesis.cls.backup

# 应该只有注释部分不同，代码部分应该完全相同
```

### 7.4 生成文档

```bash
xelatex NEUCLHSBachelorThesis.dtx
makeindex -s gind.ist NEUCLHSBachelorThesis.idx
makeindex -s gglo.ist -o NEUCLHSBachelorThesis.gls NEUCLHSBachelorThesis.glo
xelatex NEUCLHSBachelorThesis.dtx
xelatex NEUCLHSBachelorThesis.dtx
```

应该生成 `NEUCLHSBachelorThesis.pdf`，包含完整的用户手册和代码文档。

### 7.5 测试实际使用

```bash
# 使用生成的 .cls 编译示例文档
xelatex main.tex
```

---

## 常见问题

### Q1：转换后生成的 .cls 和原来不一致

**可能原因：**
- 标记不匹配（`%<*class>` 和 `%</class>`）
- `\begin{macrocode}` 和 `\end{macrocode}` 不配对
- 有些行前多了 `%` 或少了 `%`

**解决方案：**
仔细检查每一行的标记，确保：
- 代码行没有 `%` 前缀（除非是注释）
- `%    \begin{macrocode}` 前有 4 个空格
- 标记行完全匹配

### Q2：编译 .dtx 时出错

**可能原因：**
- driver 部分有语法错误
- 缺少必需的宏包（ltxdoc, doc 等）
- 中文字体设置问题

**解决方案：**
```latex
%<*driver>
\documentclass{ltxdoc}
\usepackage{xeCJK}
\setCJKmainfont{SimSun}  % 确保字体存在
\begin{document}
\DocInput{\jobname.dtx}
\end{document}
%</driver>
```

### Q3：生成的文档没有索引

**解决方案：**
需要运行 makeindex：

```bash
xelatex xxx.dtx
makeindex -s gind.ist xxx.idx   # 命令索引
makeindex -s gglo.ist -o xxx.gls xxx.glo  # 变更日志
xelatex xxx.dtx
xelatex xxx.dtx
```

---

## 快速参考

### 代码标记速查表

```latex
% 开始 class 部分
% \iffalse
%<*class>
% \fi

% 开始代码块
%    \begin{macrocode}
实际代码
%    \end{macrocode}

% 结束 class 部分
% \iffalse
%</class>
% \fi
```

### 宏定义标记

```latex
% \begin{macro}{\命令名}
% 命令说明...
%    \begin{macrocode}
\newcommand{\命令名}{定义}
%    \end{macrocode}
% \end{macro}
```

### 注释规则

| 代码 | 结果 | 说明 |
|------|------|------|
| `代码` | 提取 | 普通代码行 |
| `% 注释` | 不提取 | LaTeX 注释（用于文档） |
| `%%注释` | `%注释` | 提取时转为单 % |
| `%    \begin{macrocode}` | 不提取 | ltxdoc 标记 |

---

## 工具和资源

### 推荐工具

1. **sty2dtx** - 半自动转换工具
   ```bash
   sty2dtx -c NEUCLHSBachelorThesis.cls
   ```

2. **dtxtut** - dtx 教程和模板
   ```bash
   texdoc dtxtut
   ```

3. **skeleton.dtx** - dtx 骨架生成器

### 参考文档

```bash
texdoc docstrip    # DocStrip 文档
texdoc ltxdoc      # ltxdoc 类文档
texdoc clsguide    # LaTeX 类和宏包编写指南
```

---

## 总结

转换步骤总结：

1. ✅ 创建 .dtx 骨架（元注释、driver、install）
2. ✅ 添加用户文档部分
3. ✅ 转换代码部分（添加标记和说明）
4. ✅ 测试生成 .ins
5. ✅ 测试生成 .cls
6. ✅ 验证一致性
7. ✅ 生成完整文档

**预计工作量：**
- 简单项目（<500行）：2-4小时
- 中等项目（500-1500行）：1-2天
- 复杂项目（>1500行）：3-5天

**建议：**
- 先转换一小部分测试
- 逐步完善文档说明
- 多次验证生成结果
- 保留原始文件备份
