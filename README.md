# NEUCLHSBachelorThesis

<div align="center">

**东北大学生命科学与健康学院本科毕业论文 LaTeX 模板**

**Bachelor Thesis LaTeX Template for College of Life and Health Sciences Northeastern University**

[![License](https://img.shields.io/badge/license-LPPL%201.3c-blue)](LICENSES/LICENSE)
[![GitHub release](https://img.shields.io/badge/release-v1.1.2-brightgreen)](https://github.com/SchrodingerBlume/NEUCLHSBachelorThesis/releases/tag/V-1.1.2)
[![GitHub stars](https://img.shields.io/github/stars/SchrodingerBlume/NEUCLHSBachelorThesis)](https://github.com/SchrodingerBlume/NEUCLHSBachelorThesis/stargazers)

---

[快速开始](#快速开始) | [使用说明](#使用说明) | [常见问题](#常见问题) | [问题反馈](#问题反馈)

</div>

---

## 📖 目录

- [项目简介](#项目简介)
- [模板特点](#模板特点)
- [使用环境](#使用环境)
- [快速开始](#快速开始)
  - [方式一：TeXPage在线使用](#方式一TeXPage在线使用推荐)
  - [方式二：本地编译](#方式二本地编译)
- [使用说明](#使用说明)
  - [基础配置](#基础配置)
  - [撰写论文](#撰写论文)
  - [编译论文](#编译论文)
- [详细文件结构](#详细文件结构)
- [常见问题](#常见问题)
- [版本更新](#版本更新)
- [许可证](#许可证)
- [问题反馈](#问题反馈)
- [致谢](#致谢)

---

## 项目简介

本项目为**东北大学生命科学与健康学院本科毕业设计（论文）LaTeX 模板**，是一个**非官方**但严格按照学院要求制作的 LaTeX 文档模板。

### 为什么选择 LaTeX？

- **排版专业**：LaTeX 是学术界公认的专业排版系统，输出质量远超普通文字处理软件
- **公式美观**：数学公式渲染效果优秀，特别适合理工科论文
- **引用管理**：自动管理参考文献、图表编号、交叉引用等
- **专注内容**：将内容与格式分离，让你专注于论文内容本身

### 适用对象

- 东北大学生命科学与健康学院本科毕业生
- 希望使用 LaTeX 撰写毕业论文的同学
- 对 Word 模板感到困扰的同学

### 重要说明

> ⚠️ **免责声明**：
> 本模板按"原样"提供，不作任何明示或暗示的担保。使用者应自行验证模板输出是否符合所在机构的具体要求。作者不对因使用本模板而产生的任何格式问题、提交延误或其他后果承担责任。

---

## 模板特点

- ✅ **格式规范**：严格按照东北大学生命科学与健康学院本科毕业论文格式要求制作
- ✅ **开箱即用**：配置简单，修改几个参数即可开始撰写
- ✅ **模块化设计**：所有配置文件独立管理，结构清晰
- ✅ **丰富示例**：包含完整的示例文档和使用说明
- ✅ **中文支持**：完善的中文排版支持，符合国内论文规范
- ✅ **参考文献**：支持国标 GB7714 参考文献格式
- ✅ **双面打印**：支持单面/双面打印模式，对称/固定页边距可选
- ✅ **精美封面**：内置彩色封面和封底
- ✅ **持续更新**：持续维护，及时修复问题

---

## 使用环境

### 推荐配置

| 项目 | 推荐 |
|------|------|
| **操作系统** | Windows 10/11（推荐）<br>macOS / Linux（需配置中文字体） |
| **编译引擎** | XeLaTeX（**必须**） |
| **TeX 发行版** | TeX Live 2024 或更新版本 |
| **编辑器** | TeXstudio（本地，推荐）<br>VS Code + LaTeX Workshop（本地）<br>TeXPage（在线，推荐）<br>Overleaf（在线） |

### 字体要求

模板至少需要以下中文字体（Windows 系统自带）：

- **中易宋体**（SIMSUN.TTC）
- **中易黑体**（SIMHEI.TTF）

> 💡 **提示**：
> - Windows 用户：系统自带所需字体，无需额外配置
> - macOS/Linux 用户：需要自行安装中文字体，或将 Windows 字体文件复制到 `fonts` 文件夹

---

## 快速开始

### 方式一：TeXPage 在线使用（推荐）

**适合新手或不想安装 LaTeX 的用户**

1. **下载模板**
   - 点击本页面右上角绿色按钮 `Code` → `Download ZIP`

2. **上传到 TeXPage**
   - 访问 [TeXPage](https://www.texpage.com/)（需注册账号）
   - 点击 `+新建` → `上传项目`
   - 上传刚刚下载的 ZIP 压缩包

3. **编译器将自动设置为 XeLaTeX**

4. **开始编写**
   - 打开 `settings/cover.tex` 填写个人信息
   - 打开 `data/` 文件夹开始撰写论文内容
   - 点击 `编译` 预览效果

### 方式二：本地编译

**适合熟悉 LaTeX 或需要离线工作的用户**

#### 步骤 1：安装 TeX 发行版

**Windows 用户：**

1. 下载 [TeX Live](https://www.tug.org/texlive/)
2. 运行安装程序（完整安装约需 4-6 GB 空间）
3. 安装完成后重启电脑

**macOS 用户：**

```bash
# 使用 Homebrew 安装
brew install --cask mactex
```

**Linux 用户：**

```bash
# Ubuntu/Debian
sudo apt-get install texlive-full

# Fedora
sudo dnf install texlive-scheme-full
```

#### 步骤 2：安装编辑器（可选但推荐）

**TeXstudio（推荐新手）：**

- 下载地址：[https://www.texstudio.org/](https://www.texstudio.org/)
- 特点：界面友好，功能完整，开箱即用

**VS Code：**

```bash
# 安装 VS Code 后，安装以下插件：
# - LaTeX Workshop
```

#### 步骤 3：下载模板

```bash
# 使用 Git
git clone https://github.com/SchrodingerBlume/NEUCLHSBachelorThesis.git
cd NEUCLHSBachelorThesis

# 或者直接下载 ZIP 并解压
```

#### 步骤 4：编译论文

**使用 TeXstudio：**

1. 打开 `main.tex`
2. 菜单栏：`选项` → `设置 TeXstudio` → `构建`
   - 默认编译器：`XeLaTeX`
   - 默认文献工具：`Biber`
3. 按 `XeLaTeX --> Biber --> XeLaTeX --> XeLaTeX` 的顺序编译

**使用命令行：**

```bash
# 完整编译（首次编译或修改参考文献后）
xelatex main.tex
biber main
xelatex main.tex
xelatex main.tex

# 日常编译（未修改参考文献时）
xelatex main.tex
```

**使用 latexmk（推荐）：**

```bash
# 自动处理编译次数
latexmk -xelatex main.tex

# 清理辅助文件
latexmk -c
```

---

## 使用说明

### 基础配置

在开始撰写论文之前，需要配置以下**必选**和**可选**参数：

#### 必选配置

##### 1. 封面信息 (`settings/cover.tex`)

```latex
% 论文标题（会自动换行，也可用 \\ 强制换行）
\SetCoverTitle{您的论文标题}

% 学号
\SetCoverID{20XXXXXX}

% 专业
\SetCoverMajor{生物工程}

% 姓名
\SetCoverName{张三}

% 指导教师姓名
\SetCoverTeacher{李四}

% 指导教师职称
\SetCoverTeacherTitle{教授}

% 年份和月份
\SetCoverYear{2026}
\SetCoverMonth{6}

% 是否使用彩色大封面（推荐开启）
\usebigcovertrue  % 启用
% 关闭（注释掉上一行）
```

##### 2. 声明信息 (`settings/statement.tex`)

```latex
% 设置签名图片
\SetSignatureImage{settings/signature.png}

% 设置签名日期
\SetSignatureYear{2026}
\SetSignatureMonth{6}
\SetSignatureDay{1}
```

##### 3. 打印模式 (`settings/printmode.tex`)

```latex
% 打印模式
\def\PrintMode{twoside}  % twoside: 双面打印  oneside: 单面打印

% 页边距模式
\def\SymmetricMargins{false}  % true: 对称页边距  false: 固定页边距

% 建议配置：
% - 提交电子版：twoside + false
% - 打印版本：  twoside + true
```

#### 可选配置

| 文件 | 说明 | 使用频率 |
|------|------|----------|
| `settings/chapter.tex` | 控制包含哪些章节 | 常用 |
| `settings/appendix.tex` | 控制包含哪些附录 | 较少 |
| `settings/typeset.tex` | 调整字距、行距等排版细节 | 较少 |
| `settings/siunit.tex` | 自定义物理单位 | 按需 |
| `settings/hyperref.tex` | 超链接颜色和样式 | 按需 |
| `settings/timesorheiti.tex` | 标题中西文字体控制 | 较少 |
| `settings/footnotecounter.tex` | 脚注计数方式 | 较少 |
| `settings/bibliography.tex` | 参考文献排版细节 | 较少 |

### 撰写论文

#### 论文结构

```
论文内容（data/ 文件夹）
├── cabstract.tex      中文摘要
├── eabstract.tex      英文摘要
├── chap01.tex         第一章
├── chap02.tex         第二章
├── ...                更多章节
├── ack.tex            致谢
├── appendix01.tex     附录1
├── appendix02.tex     附录2
└── references.bib     参考文献数据库
```

### 编译论文

#### 完整编译流程

```bash
xelatex main      # 第一次编译，生成 .aux 文件
biber main       # 处理参考文献
xelatex main      # 第二次编译，插入参考文献
xelatex main      # 第三次编译，更新交叉引用
```

#### 何时需要完整编译？

- ✅ 首次编译
- ✅ 修改了参考文献（`references.bib`）
- ✅ 添加了新的图表或章节引用
- ❌ 仅修改正文内容（只需运行 `xelatex main` 一次）

---

## 详细文件结构

```
NEUCLHSBachelorThesis/
│
├── main.tex                          # 主文件（一般无需修改）
├── NEUCLHSBachelorThesis.cls         # 文档类（请勿修改）
├── untilchapter.sty                  # 自定义宏包（请勿修改）
├── gb7714-2025.bbx                   # 参考文献样式（请勿修改）
├── gb7714-2025.cbx                   # 参考文献引用（请勿修改）
│
├── settings/                         # 配置文件夹（用户主要操作区域）
│   ├── cover.tex                     # ⭐️ 封面信息（必填）
│   ├── statement.tex                 # ⭐️ 声明页信息（必填）
│   ├── printmode.tex                 # ⭐️ 打印模式（必填）
│   ├── chapter.tex                   # 章节包含控制
│   ├── appendix.tex                  # 附录包含控制
│   ├── typeset.tex                   # 排版细节设置
│   ├── siunit.tex                    # 自定义单位
│   ├── hyperref.tex                  # 超链接设置
│   ├── timesorheiti.tex              # 标题字体控制
│   ├── footnotecounter.tex           # 脚注计数设置
│   ├── bibliography.tex              # 文献排版设置
│   └── signature.png                 # 签名图片（可选）
│
├── data/                             # 论文内容文件夹（用户主要编辑区域）
│   ├── cabstract.tex                 # 中文摘要
│   ├── eabstract.tex                 # 英文摘要
│   ├── chap01.tex                    # 第一章
│   ├── chap02.tex                    # 第二章
│   ├── ack.tex                       # 致谢
│   ├── appendix01.tex                # 附录1
│   ├── appendix02.tex                # 附录2
│   └── references.bib                # 参考文献数据库
│
├── figures/                          # 图片文件夹
│   ├── example1.png
│   ├── example2.jpg
│   └── ...
│
├── fonts/                            # 字体文件夹（非 Windows 用户需要）
│   └── 在这里放入字体文件
│
├── DoNotEdit/                        # 核心文件（请勿修改）
│   ├── body.tex                      # 文档结构
│   ├── cover.tex                     # 封面模板
│   ├── statement.tex                 # 声明页模板
│   ├── BIGCOVER.pdf                  # 彩色封面
│   └── BIGBACKCOVER.pdf              # 彩色封底
│
├── LICENSES/                         # 许可证
│   ├── LICENSE                       # LaTeX 项目许可证
│   └── 学术共享协议
│
├── 参考文件/                          # 参考文档
│   ├── biblatex-gb7714-2015.pdf      # 参考文献帮助文档
│   └── siunitx_ZH_CN.pdf             # 单位宏包帮助文档
│
├── 使用说明与示例文档.pdf             # 完整示例文档（强烈推荐阅读）
├── 更新说明.md                        # 版本更新日志
└── README.md                          # 本文档
```

---

## 常见问题

### 编译问题

#### Q1: 编译结果字体跟 Word 效果不一致

**A:** 这是因为系统缺少必要的中文字体。

**解决方案：**
从 Windows 系统复制字体文件（SIMSUN.TTC, SIMHEI.TTF）到 `fonts/` 文件夹

#### Q2: 编译后没有参考文献

**A:** 需要完整编译流程：

```bash
xelatex main
biber main      # ← 这一步很重要
xelatex main
xelatex main
```

#### Q3: Overleaf 编译超时

**A:**
- Overleaf 免费版有编译时间限制
- 解决方案：
  1. 删除不需要的章节和图片
  2. 升级到付费版
  3. 改用 TeXPage

### 格式问题

#### Q4: 页首标题与页眉横线间距异常

**A:** 这是已知问题，通常发生在有大量浮动体（图表）的页面附近。

**临时解决方案：**
在该页之前手动添加 `\clearpage` 命令。

```latex
\clearpage  % 强制换页
\section{下一节标题}
```

#### Q5: 目录中的页码不对

**A:** 多编译几次（至少 2 次），LaTeX 需要多次编译来更新交叉引用。

#### Q6: 表格中不能使用 `\verb` 命令

**A:** 这是 `\sdbiaoge` 命令的已知限制。

---

## 版本更新

### V-1.1.2 (2025-11-18)- 当前版本

**主要改进：**

示例文档中数学部分增加了对小于等于号及类似符号的使用要求。

### V-1.1.1 (2025-11-17)

**主要改进：**
- ✅ 完成模板结构的模块化重构
- ✅ 所有配置文件集中至 `settings/` 目录
- ✅ 修正表格、摄氏度、波浪线等细节问题
- ✅ 优化数学排版，上下标样式更接近 Word
- ✅ 新增快捷命令：`\shang{}`、`\xia{}`、`\ssd`
- ✅ 改进节标题换页控制，减少页面样式异常

**详细更新内容请查看：** [更新说明.md](更新说明.md)

### 历史版本

更多历史版本信息请查看 [更新说明.md](更新说明.md)

---

## 许可证

本模板采用**双重许可协议**：

### 1. LaTeX Project Public License 1.3c

- ✅ 允许自由使用、修改和分发
- ✅ 要求修改后的文件使用不同文件名
- 📄 许可证文件：[LICENSES/LICENSE](LICENSES/LICENSE)

### 2. 学术共享协议

- ✅ **学术使用**：允许免费用于学术论文撰写
- ❌ **商业使用**：禁止任何形式的商业用途
- ✅ **修改分发**：鼓励分享改进版本，但需保留原作者署名
- 📄 许可证文件：[LICENSES/学术共享协议](LICENSES/学术共享协议)

**您需要同时遵守以上两个协议来使用本模板。**

---

## 问题反馈

### 遇到问题？

如果您在使用过程中遇到问题，欢迎通过以下方式反馈：

- **📧 邮箱**：
  - neuclhswjh@163.com
  - junhaowu_hit@163.com

- **💬 QQ**：914442048

- **🐛 GitHub Issues**：[提交 Issue](https://github.com/SchrodingerBlume/NEUCLHSBachelorThesis/issues)

### 反馈建议

为了更快解决问题，请在反馈时提供：

1. **问题描述**：详细说明遇到的问题
2. **编译环境**：操作系统、TeX 发行版版本
3. **错误信息**：完整的错误日志
4. **最小示例**：能复现问题的最小代码示例

### 贡献代码

欢迎提交 Pull Request 来改进模板！

**贡献指南：**
1. Fork 本仓库
2. 创建您的特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交您的修改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启一个 Pull Request

---

## 致谢

### 作者

- **吴俊豪** (Schrödingers Blume)
- 东北大学生命科学与健康学院

### 感谢

- 感谢所有使用本模板并提出宝贵意见的同学
- 感谢 LaTeX 社区的开源精神
- 参考了众多优秀的学位论文模板项目

### 相关项目

本模板在开发过程中主要参考了以下（但不限于）优秀项目：

- [ThuThesis](https://github.com/tuna/thuthesis) - 清华大学学位论文模板
- [NEUBachelorThesis](https://github.com/tzaiyang/NEUBachelorThesis) - tzayang2018年开发的东北大学本科学位论文模板

---

## 附录

### 推荐学习资源

#### LaTeX 入门教程

- [一份不太简短的 LaTeX 介绍](http://mirrors.ctan.org/info/lshort/chinese/lshort-zh-cn.pdf)

#### 在线工具

- [Tables Generator](https://www.tablesgenerator.com/) - 在线生成 LaTeX 表格
- [Mathpix](https://mathpix.com/) - 公式识别工具
- [Detexify](http://detexify.kirelabs.org/classify.html) - 手写识别 LaTeX 符号

---

<div align="center">

**祝您使用愉快，论文撰写顺利！** 🎓

如果这个模板对您有帮助，欢迎给个 ⭐ Star！

*最后更新时间：2025-11-18*

</div>
