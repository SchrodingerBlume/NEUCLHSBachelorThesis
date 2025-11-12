# NEUCLHSBachelorThesis

> 东北大学生命科学与健康学院本科毕业设计（论文）LaTeX 模板  
> 基于学院 2026 届毕业生模板制作

---

## 📋 目录

- [简介](#简介)
- [工作环境](#工作环境)
- [快速开始](#快速开始)
- [编译方法](#编译方法)
- [使用说明](#使用说明)
- [字体问题](#字体问题)
- [版本历史](#版本历史)
- [致谢](#致谢)
- [联系方式](#联系方式)

---

## 📖 简介

NEUCLHSBachelorThesis 是为东北大学生命科学与健康学院本科毕业设计（论文）撰写定制的 LaTeX 模板，严格遵循学院官方格式要求，提供完整的论文排版解决方案。

**主要特性：**
- ✅ 完全符合学院官方格式要求
- ✅ 支持图表、公式、参考文献等学术元素
- ✅ 提供详细的使用文档和示例
- ✅ 持续维护和更新

---

## 💻 工作环境

### 推荐配置

- **TeX 发行版：** TexLive 2025
- **编译器：** XeLaTeX
- **文献工具：** Biber
- **推荐平台：** Overleaf（在线编辑）

---

## 🚀 快速开始

### 在 Overleaf 使用

1. 下载本模板压缩包
2. 在 Overleaf 中上传并解压
3. 设置编译器为 XeLaTeX
4. 开始撰写论文

### 本地使用

```bash
# 克隆仓库
git clone https://github.com/SchrodingerBlume/NEUCLHSBachelorThesis.git

# 进入目录
cd NEUCLHSBachelorThesis

# 编译（按顺序执行）
xelatex main.tex
biber main
xelatex main.tex
xelatex main.tex
```

---

## 🔧 编译方法

### 编译顺序

请严格按照以下顺序编译：

```
XeLaTeX → BibTeX → XeLaTeX → XeLaTeX
```

### 编译器设置

- **主编译器：** XeLaTeX
- **文献编译器：** Biber

### 常见 IDE 配置

**TeX Studio:**
```
选项 → 设置 → 构建 → 默认编译器 → XeLaTeX
选项 → 设置 → 构建 → 默认文献工具 → Biber
```

**VS Code (LaTeX Workshop):**
```json
"latex-workshop.latex.recipes": [
  {
    "name": "XeLaTeX → Biber → XeLaTeX × 2",
    "tools": ["xelatex", "biber", "xelatex", "xelatex"]
  }
]
```

---

## 📚 使用说明

### 文档结构

```
NEUCLHSBachelorThesis/
├── main.tex                    # 主文件
├── NEUCLHSBachelorThesis.cls   # 模板类文件
├── settings/                   # 用户配置文件
├── data/                       # 数据目录
│   ├── cabstract.tex           # 中文摘要
│   ├── eabstract.tex           # 英文摘要
│   ├── chap01.tex              # 第一章
│   ├── ...
│   ├── appendix01.tex          # 附录1：中文译文
│   ├── appendix02.tex          # 附录2：外文原文（无需改动）
│   └── ack.tex                 # 致谢
├── fig/                        # 图片目录
├── fonts/                      # 字体目录
├── ref/ref.bib                 # 参考文献
├── LICENSES/                   # 版权声明
│   ├── LICENSE                 # LaTeX Project Public License
│   ├── 学术共享协议.md
├── DoNotEdit/                  # 其他预设文件（不要改动）
├── 参考文件/                    # 其他也许有用的文档
└── 使用文档（编译结果）.pdf      # 详细使用文档
```

### 详细使用方法

**请务必阅读 `使用文档（编译结果）.pdf`**，其中包含：
- 模板功能详解
- 命令使用说明
- 排版技巧
- 常见问题解答

---

## 🔤 字体问题

### Windows 用户

模板默认使用 Windows 系统字体，无需额外配置。

### macOS / Linux / OverLeaf 用户

#### 方法：从 Windows 复制字体

从 Windows 系统复制以下字体文件至 `fonts/` 目录：
- `SIMSUN.TTC`（宋体）
- `SIMHEI.TTF`（黑体）

### 重要提醒

⚠️ **由于中易宋体等字体的版权问题，建议最终在 Windows 平台进行编译，或确保使用合法授权的字体文件。**

---

## 📝 版本历史

### V-1.0.1（2025年11月12日）

✨ **主要进展**

- 修正了错误的模板使用说明
- 修正了附录1摘要中的格式细节

### [查看完整更新日志]请阅读`更新说明.md`文件

---

## 🙏 致谢

本模板基于 [tzaiyang/NEUBachelorThesis](https://github.com/tzaiyang/NEUBachelorThesis) 的代码构建，特此致谢！

感谢所有为本模板提供反馈和建议的用户。

---

## 📞 联系方式

**作者：** 吴俊豪 / 薛定谔之花  
**邮箱：** neuclhswjh@163.com 或 junhaowu_hit@163.com  
**QQ：** 914442048  
**项目主页：** https://github.com/SchrodingerBlume/NEUCLHSBachelorThesis/

### 反馈建议

如有问题或建议，欢迎通过以下方式反馈：
- 📧 发送邮件
- 💬 QQ 联系
- 🐛 提交 [GitHub Issue](https://github.com/SchrodingerBlume/NEUCLHSBachelorThesis/issues)
- 🔀 提交 [Pull Request](https://github.com/SchrodingerBlume/NEUCLHSBachelorThesis/pulls)

**请不要吝啬您的宝贵建议！您的反馈将帮助改进模板。**

---

## ⭐ 如果这个项目对您有帮助

如果这个模板对您的论文撰写有所帮助，欢迎：
- ⭐ Star 本项目
- 📢 分享给需要的同学
- 💖 提供反馈和建议

---

<div align="center">

**Made with ❤️ for NEU CLHS Students**

*祝各位同学顺利完成毕业论文！*

</div>
