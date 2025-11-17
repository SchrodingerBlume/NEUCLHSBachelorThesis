# DocStrip 工作原理详解

## 一、核心概念

DocStrip 是一个**文本过滤器**，它根据特殊标记提取代码块。

## 二、标记系统（Guards）

### 2.1 基本语法

```latex
%<*标记名>          ← 开始标记
代码内容             ← 会被提取
%</标记名>          ← 结束标记

%<标记名> 单行代码   ← 单行标记（也会被提取）

% 普通注释          ← 不会被提取
普通文本            ← 不会被提取
```

### 2.2 常用标记

| 标记名 | 用途 | 输出文件 |
|--------|------|----------|
| `class` | 文档类代码 | `.cls` |
| `package` | 宏包代码 | `.sty` |
| `driver` | 文档驱动 | 用于编译dtx |
| `install` | 安装脚本 | `.ins` |
| `readme` | README文本 | `README` |

## 三、完整示例分析

### 3.1 输入文件（demo-simple.dtx）

```latex
1   % \iffalse meta-comment
2   % 这是元注释，不会被提取
3   % \fi
4   %
5   % \section{使用说明}
6   % 这是文档部分，不会被提取
7   %
8   % \iffalse
9   %<*package>        ← 标记开始（被 \iffalse...\fi 包围，编译dtx时被跳过）
10  % \fi
11  %    \begin{macrocode}
12  %
13  \ProvidesPackage{demosimple}[2025/11/17 v1.0 Demo]
14  \newcommand{\hello}{Hello World!}
15  %
16  %    \end{macrocode}
17  % \iffalse
18  %</package>        ← 标记结束
19  % \fi
20  %
21  \endinput
```

### 3.2 处理过程

当运行 `latex demo-simple.ins` 时：

**第1步：读取 demo-simple.dtx**

**第2步：查找标记 `<*package>`**
- 找到第9行的 `%<*package>`

**第3步：提取内容**
- 从第9行到第18行的 `%</package>`
- 提取被标记的内容（第13-14行）

**第4步：处理特殊注释**
- `%    \begin{macrocode}` 和 `%    \end{macrocode}` 是文档标记，被移除
- 以 `%` 开头后跟空格的行（如 `% `）被移除
- 普通代码行保留

**第5步：生成输出文件（demosimple.sty）**

```latex
%% 文件头注释（来自 \preamble）
\ProvidesPackage{demosimple}[2025/11/17 v1.0 Demo]
\newcommand{\hello}{Hello World!}
%% 文件尾注释（来自 \postamble）
```

## 四、提取规则详解

### 4.1 守卫标记处理

| 输入行 | 是否提取 | 说明 |
|--------|----------|------|
| `%<*guard>` | ❌ 否 | 开始标记本身不输出 |
| `%</guard>` | ❌ 否 | 结束标记本身不输出 |
| `%<guard>代码` | ✅ 是 | 单行标记，输出"代码" |
| `代码` | ✅ 是 | 在标记内的普通行 |
| `% 注释` | ❌ 否 | 在标记内但以`% `开头 |
| `%%注释` | ✅ 是 | 转换为单个`%` |

### 4.2 多层标记

可以使用逻辑组合：

```latex
%<*class>           ← 只在提取class时
\ProvidesClass{...}
%</class>

%<*class|package>   ← 提取class或package时都包含
\RequirePackage{...}
%</class|package>

%<*!driver>         ← 除了driver外都包含
代码...
%</!driver>
```

## 五、.ins 文件工作流程

### 5.1 .ins 文件结构

```latex
\input docstrip.tex          ← 加载DocStrip工具

\preamble
文件头注释
\endpreamble

\postamble
文件尾注释
\endpostamble

\generate{                   ← 开始生成
  \file{输出.sty}{           ← 指定输出文件名
    \from{源.dtx}{标记}      ← 从哪个dtx的哪个标记提取
  }
}

\endbatchfile                ← 结束处理
```

### 5.2 执行流程

```
1. latex demo-simple.ins
   ↓
2. 加载 docstrip.tex
   ↓
3. 读取 \generate{} 中的指令
   ↓
4. 打开 demo-simple.dtx
   ↓
5. 查找标记 %<*package>
   ↓
6. 提取标记内的内容
   ↓
7. 添加 \preamble 和 \postamble
   ↓
8. 写入 demosimple.sty
   ↓
9. 显示成功消息
```

## 六、实际转换示例

### 6.1 从现有 .cls 转换到 .dtx

**原文件（NEUCLHSBachelorThesis.cls）：**

```latex
\ProvidesClass{NEUCLHSBachelorThesis}
\providecommand{\Version}{V-1.1.1}
\LoadClass[UTF8,twoside,a4paper,12pt]{ctexbook}
\RequirePackage{xeCJK}
% ... 更多代码 ...
```

**转换后（NEUCLHSBachelorThesis.dtx）：**

```latex
% \iffalse meta-comment
% 元信息...
% \fi
%
% \section{使用说明}
% 这里写用户文档...
%
% \section{代码实现}
%
% \subsection{文档类声明}
%
% \iffalse
%<*class>
% \fi
%    \begin{macrocode}
\ProvidesClass{NEUCLHSBachelorThesis}
  [2025/11/17 v1.1.1 Bachelor Thesis Template for NEU CLHS]
%    \end{macrocode}
%
% \begin{macro}{\Version}
% 定义版本号变量：
%    \begin{macrocode}
\providecommand{\Version}{V-1.1.1}
%    \end{macrocode}
% \end{macro}
%
% 加载基础文档类：
%    \begin{macrocode}
\LoadClass[UTF8,twoside,a4paper,12pt]{ctexbook}
\RequirePackage{xeCJK}
%    \end{macrocode}
%
% \iffalse
%</class>
% \fi
```

### 6.2 转换步骤

**步骤1：添加元注释区域**
```latex
% \iffalse meta-comment
... 安装脚本、README等
% \fi
```

**步骤2：添加文档驱动**
```latex
%<*driver>
\documentclass{ltxdoc}
\begin{document}
\DocInput{\jobname.dtx}
\end{document}
%</driver>
```

**步骤3：包裹代码**
```latex
%<*class>
... 原始代码 ...
%</class>
```

**步骤4：添加文档说明**
- 在代码前后添加 LaTeX 文档
- 使用 `\begin{macrocode}...\end{macrocode}` 标记代码块
- 使用 `\begin{macro}...\end{macro}` 说明命令

**步骤5：创建 .ins 文件**
- 指定如何提取代码

## 七、优势总结

### 7.1 传统方式 vs .dtx/.ins

| 方面 | 传统方式 | .dtx/.ins 方式 |
|------|----------|----------------|
| 代码文件 | `.cls` 独立 | 包含在 `.dtx` |
| 文档文件 | `.pdf` 独立 | 从 `.dtx` 生成 |
| 代码注释 | 简单注释 | 详细文档化注释 |
| 维护性 | 代码和文档易不同步 | 代码和文档自动同步 |
| 索引 | 需手动维护 | 自动生成索引 |
| 变更日志 | 单独文件 | 集成在文档中 |

### 7.2 何时使用 .dtx/.ins

**推荐使用：**
- ✅ 计划长期维护的项目
- ✅ 需要详细代码文档
- ✅ 发布到 CTAN
- ✅ 复杂的宏包/文档类

**可以不用：**
- ⭕ 简单的个人项目
- ⭕ 首次发布（先简化）
- ⭕ 代码量很小（<100行）
- ⭕ 不需要详细文档

## 八、调试技巧

### 8.1 查看提取结果

如果不确定提取是否正确：

```bash
# 添加 \askforoverwritetrue 到 .ins
# 这样会在覆盖前询问
```

### 8.2 常见错误

| 错误 | 原因 | 解决方案 |
|------|------|----------|
| 生成文件为空 | 标记名不匹配 | 检查 .ins 中的标记名 |
| 多余的注释 | 使用了 `% ` | 改用 `%%` 或无空格的 `%` |
| 缺少内容 | 忘记标记结束 | 添加 `%</标记>` |
| 编译dtx失败 | driver部分错误 | 检查 `%<*driver>` 部分 |

## 九、完整工作流

```
开发阶段：
1. 编写 .dtx 文件（代码+文档）
2. 测试：latex xxx.dtx → 生成 xxx.ins
3. 测试：latex xxx.ins → 生成 xxx.cls/sty
4. 测试：xelatex xxx.dtx → 生成文档 xxx.pdf

发布阶段：
1. 打包 .dtx 和 .ins
2. 上传到 CTAN

用户使用：
方式1：latex xxx.ins → 生成 xxx.cls → 安装
方式2：通过 TeX Live 自动安装
```

## 十、实用工具

### 10.1 自动化工具

- `sty2dtx` - 将 .sty 转换为 .dtx（部分自动化）
- `skeleton.dtx` - dtx 模板生成器
- `ctanify` - CTAN 打包工具

### 10.2 文档工具

- `ltxdoc` - 标准文档类（本文使用）
- `doc` - 文档宏包（代码索引）
- `hypdoc` - 带超链接的文档

---

**参考资源：**
- The DocStrip Program: https://ctan.org/pkg/docstrip
- How to Package Your LaTeX Package: https://ctan.org/pkg/dtxtut
