\ProvidesClass{NEUCLHSBachelorThesis}
\InputIfFileExists{settings/printmode.tex}{}{}
\providecommand{\PrintMode}{twoside}
\LoadClass[UTF8,\PrintMode,a4paper,12pt]{ctexbook}
\RequirePackage{xeCJK}
\RequirePackage{pdfpages}
\RequirePackage{float}
\RequirePackage{flafter} % 不让浮动体出现在调用之前
\RequirePackage{subcaption}
\captionsetup{hypcap=true}
\RequirePackage{xcolor}
\RequirePackage{ragged2e}
\RequirePackage{calc}
\RequirePackage{lipsum}
\RequirePackage{comment}
\RequirePackage{tikz}

% 定义手动换页命令\huanye，根据oneside/twoside决定启用与否
\if@twoside
  \newcommand{\huanye}{\clearpage\thispagestyle{empty}\ }
\else
  \newcommand{\huanye}{}
\fi

% 单面打印时，确保章节从奇数页开始
\if@twoside
  % twoside，使用默认的openright行为
\else
  % oneside，在\chapter前检查页码
  \let\oldchapter\chapter
  \renewcommand{\chapter}{%
    \clearpage
    \ifodd\value{page}%
      % 当前是奇数页，章节将出现在奇数页，不需要调整
    \else
      % 当前是偶数页，章节将出现在偶数页，需要跳过一页
      \stepcounter{page}%
    \fi
    \oldchapter
  }
\fi

\RequirePackage{emptypage}

\raggedbottom % 取消齐底对齐

%------- 字体 --------%
%--- 西文字体配置 ---%
\setmainfont{Times New Roman}

%--- 数学字体配置 ---%
\RequirePackage[partial=upright]{unicode-math}
\RequirePackage{bm} % for \mathbfit
\xeCJKsetup{%
CJKmath=true, % 公式中直接写中文
CJKecglue=\hskip 0.275em % 中英文标点间距
}

\newfontfamily\timesrm{Times New Roman}[
  BoldFont = Times New Roman,
  BoldFeatures = {FakeBold=0}
]

\setmathfont{XITS Math}[StylisticSet=8]
% StylisticSet=8使积分号直立

% 小写希腊字母粗体命令
\newcommand{\bfalpha}{\symbf{\alpha}}
\newcommand{\bfbeta}{\symbf{\beta}}
\newcommand{\bfgamma}{\symbf{\gamma}}
\newcommand{\bfdelta}{\symbf{\delta}}
\newcommand{\bfepsilon}{\symbf{\epsilon}}
\newcommand{\bfvarepsilon}{\symbf{\varepsilon}}
\newcommand{\bfzeta}{\symbf{\zeta}}
\newcommand{\bfeta}{\symbf{\eta}}
\newcommand{\bftheta}{\symbf{\theta}}
\newcommand{\bfvartheta}{\symbf{\vartheta}}
\newcommand{\bfiota}{\symbf{\iota}}
\newcommand{\bfkappa}{\symbf{\kappa}}
\newcommand{\bfvarkappa}{\symbf{\varkappa}}
\newcommand{\bflambda}{\symbf{\lambda}}
\newcommand{\bfmu}{\symbf{\mu}}
\newcommand{\bfnu}{\symbf{\nu}}
\newcommand{\bfxi}{\symbf{\xi}}
\newcommand{\bfomicron}{\symbf{\omicron}}
\newcommand{\bfpi}{\symbf{\pi}}
\newcommand{\bfvarpi}{\symbf{\varpi}}
\newcommand{\bfrho}{\symbf{\rho}}
\newcommand{\bfvarrho}{\symbf{\varrho}}
\newcommand{\bfsigma}{\symbf{\sigma}}
\newcommand{\bfvarsigma}{\symbf{\varsigma}}
\newcommand{\bftau}{\symbf{\tau}}
\newcommand{\bfupsilon}{\symbf{\upsilon}}
\newcommand{\bfphi}{\symbf{\phi}}
\newcommand{\bfvarphi}{\symbf{\varphi}}
\newcommand{\bfchi}{\symbf{\chi}}
\newcommand{\bfpsi}{\symbf{\psi}}
\newcommand{\bfomega}{\symbf{\omega}}

% 小写希腊字母粗体正体命令
\newcommand{\bfupalpha}{\symbfup{\alpha}}
\newcommand{\bfupbeta}{\symbfup{\beta}}
\newcommand{\bfupgamma}{\symbfup{\gamma}}
\newcommand{\bfupdelta}{\symbfup{\delta}}
\newcommand{\bfupepsilon}{\symbfup{\epsilon}}
\newcommand{\bfupvarepsilon}{\symbfup{\varepsilon}}
\newcommand{\bfupzeta}{\symbfup{\zeta}}
\newcommand{\bfupeta}{\symbfup{\eta}}
\newcommand{\bfuptheta}{\symbfup{\theta}}
\newcommand{\bfupvartheta}{\symbfup{\vartheta}}
\newcommand{\bfupiota}{\symbfup{\iota}}
\newcommand{\bfupkappa}{\symbfup{\kappa}}
\newcommand{\bfupvarkappa}{\symbfup{\varkappa}}
\newcommand{\bfuplambda}{\symbfup{\lambda}}
\newcommand{\bfupmu}{\symbfup{\mu}}
\newcommand{\bfupnu}{\symbfup{\nu}}
\newcommand{\bfupxi}{\symbfup{\xi}}
\newcommand{\bfupomicron}{\symbfup{\omicron}}
\newcommand{\bfuppi}{\symbfup{\pi}}
\newcommand{\bfupvarpi}{\symbfup{\varpi}}
\newcommand{\bfuprho}{\symbfup{\rho}}
\newcommand{\bfupvarrho}{\symbfup{\varrho}}
\newcommand{\bfupsigma}{\symbfup{\sigma}}
\newcommand{\bfupvarsigma}{\symbfup{\varsigma}}
\newcommand{\bfuptau}{\symbfup{\tau}}
\newcommand{\bfupupsilon}{\symbfup{\upsilon}}
\newcommand{\bfupphi}{\symbfup{\phi}}
\newcommand{\bfupvarphi}{\symbfup{\varphi}}
\newcommand{\bfupchi}{\symbfup{\chi}}
\newcommand{\bfuppsi}{\symbfup{\psi}}
\newcommand{\bfupomega}{\symbfup{\omega}}

% 大写希腊字母粗体命令
\newcommand{\bfGamma}{\symbf{\Gamma}}
\newcommand{\bfDelta}{\symbf{\Delta}}
\newcommand{\bfTheta}{\symbf{\Theta}}
\newcommand{\bfLambda}{\symbf{\Lambda}}
\newcommand{\bfXi}{\symbf{\Xi}}
\newcommand{\bfPi}{\symbf{\Pi}}
\newcommand{\bfSigma}{\symbf{\Sigma}}
\newcommand{\bfUpsilon}{\symbf{\Upsilon}}
\newcommand{\bfPhi}{\symbf{\Phi}}
\newcommand{\bfPsi}{\symbf{\Psi}}
\newcommand{\bfOmega}{\symbf{\Omega}}

% 大写希腊字母粗体斜体命令
\newcommand{\bfitGamma}{\symbfit{\Gamma}}
\newcommand{\bfitDelta}{\symbfit{\Delta}}
\newcommand{\bfitTheta}{\symbfit{\Theta}}
\newcommand{\bfitLambda}{\symbfit{\Lambda}}
\newcommand{\bfitXi}{\symbfit{\Xi}}
\newcommand{\bfitPi}{\symbfit{\Pi}}
\newcommand{\bfitSigma}{\symbfit{\Sigma}}
\newcommand{\bfitUpsilon}{\symbfit{\Upsilon}}
\newcommand{\bfitPhi}{\symbfit{\Phi}}
\newcommand{\bfitPsi}{\symbfit{\Psi}}
\newcommand{\bfitOmega}{\symbfit{\Omega}}

% 大写希腊字母var版粗体斜体命令
\newcommand{\bfvarGamma}{\symbfit{\Gamma}}
\newcommand{\bfvarDelta}{\symbfit{\Delta}}
\newcommand{\bfvarTheta}{\symbfit{\Theta}}
\newcommand{\bfvarLambda}{\symbfit{\Lambda}}
\newcommand{\bfvarXi}{\symbfit{\Xi}}
\newcommand{\bfvarPi}{\symbfit{\Pi}}
\newcommand{\bfvarSigma}{\symbfit{\Sigma}}
\newcommand{\bfvarUpsilon}{\symbfit{\Upsilon}}
\newcommand{\bfvarPhi}{\symbfit{\Phi}}
\newcommand{\bfvarPsi}{\symbfit{\Psi}}
\newcommand{\bfvarOmega}{\symbfit{\Omega}}

\renewcommand{\varGamma}{\itGamma}
\renewcommand{\varDelta}{\itDelta}
\AtBeginDocument{\let\varTheta\itTheta}
\renewcommand{\varLambda}{\itLambda}
\renewcommand{\varXi}{\itXi}
\renewcommand{\varPi}{\itPi}
\renewcommand{\varSigma}{\itSigma}
\renewcommand{\varGamma}{\itGamma}
\renewcommand{\varUpsilon}{\itUpsilon}
\renewcommand{\varPhi}{\itPhi}
\renewcommand{\varPsi}{\itPsi}
\renewcommand{\varOmega}{\itOmega}

% up和bfup
\setmathfont{Times New Roman}[
  range = {up/{latin,Latin}},
]
\IfFontExistsTF{Times New Roman Bold}{
  \setmathfont{Times New Roman Bold}[
    range = {bfup/{latin,Latin}},
  ]
}{
  % 原生粗体缺失就用伪粗
  \setmathfont{Times New Roman}[
    range    = {bfup/{latin,Latin}},
    FakeBold = 2.0,
  ]
}
% it
\IfFontExistsTF{Times New Roman Italic}{
  \setmathfont{Times New Roman Italic}[
    range = {it/{latin,Latin}},
  ]
}{
  \setmathfont{Times New Roman}[
    range     = {it/{latin,Latin}},
    FakeSlant = 0.33,
  ]
}
% bfit
\IfFontExistsTF{Times New Roman Bold Italic}{
  \setmathfont{Times New Roman Bold Italic}[
    range = {bfit/{latin,Latin}},
  ]
}{
  \IfFontExistsTF{Times New Roman Bold}{
    % 粗体+伪斜
    \setmathfont{Times New Roman Bold}[
      range     = {bfit/{latin,Latin}},
      FakeSlant = 0.33,
    ]
  }{
    % 伪粗+伪斜
    \setmathfont{Times New Roman}[
      range     = {bfit/{latin,Latin}},
      FakeBold  = 2.0,
      FakeSlant = 0.33,
    ]
  }
}

\setmathfont{Times New Roman}[range={"03B5, "03C2, "03C6, "03B1, "03B2, "03B3, "03B4, "03B5, "03B6, "03B7, "03B8, "03B9, "03BA, "03BB, "03BC, "03BD, "03BE, "03BF, "03C0, "03C1, "03C3, "03C4, "03C5, "03C6, "03C7, "03C8, "03C9}]%

% 板粗体（空心体）和花体
% 参考https://www.crexyer.com/2019/06/mathbb-show-different-chars-with-unicode-math-package/
\DeclareMathAlphabet{\mathcal}{OMS}{cmsy}{m}{n} % 这个方案采用克努斯于1977–1979年设计的样式，不支持小写花体，参考https://logic.pku.edu.cn/docs/20211226234023970182.pdf
% 注释掉上一条命令，启用下一行，就可以支持小写花体，但我不喜欢这个字体
% \setmathfont[range={\mathcal}]{TeXGyrePagellaMath-Regular}
\let\mathbb\relax % remove the definition by unicode-math
\DeclareMathAlphabet{\mathbb}{U}{msb}{m}{n}


%--- 中文字体配置 ---%
\ziju{0.01} % 字距

% 在非Windows平台（如Overleaf或Linux平台）编译时，请自行将Windows下默认宋黑仿楷字体（中易字库）“SIMSUN.TTC、SIMHEI.TTF、SIMFANG.TTF及SIMKAI.TTF”复制到fonts文件夹下

% 宋体
\IfFileExists{./fonts/SIMSUN.TTC}{
    % 本地字体存在，使用本地字体
    \setCJKmainfont[
        Path=./fonts/,
        Extension=.TTC,
        AutoFakeBold=2.17,
        AutoFakeSlant=0.333,
        UprightFont=SIMSUN
    ]{simsun}
}{
    % 本地字体不存在，尝试系统字体
    \IfFontExistsTF{SimSun}{
        \setCJKmainfont{SimSun}[
            AutoFakeBold=2.17,
            AutoFakeSlant=0.333
        ]
    }{
        % 系统字体不存在，回退到Fandol宋体
        \setCJKmainfont{FandolSong-Regular}[
            AutoFakeBold=2.17,
            AutoFakeSlant=0.333
        ]
    }
}
\IfFileExists{./fonts/SIMSUN.TTC}{
    \setCJKfamilyfont{song_windows}[
        Path=./fonts/,
        Extension=.TTC,
        AutoFakeBold=2.0,
        AutoFakeSlant=0.333,
        UprightFont=SIMSUN
    ]{simsun}
}{
    \IfFontExistsTF{SimSun}{
        \setCJKfamilyfont{song_windows}{SimSun}[
            AutoFakeBold=2.0,
            AutoFakeSlant=0.333
        ]
    }{
        \setCJKfamilyfont{song_windows}{FandolSong-Regular}[
            AutoFakeBold=2.0,
            AutoFakeSlant=0.333
        ]
    }
}
\renewcommand{\songti}{\CJKfamily{song_windows}}
% 西文宋体
\IfFileExists{./fonts/SIMSUN.TTC}{
    \newfontfamily\SimSunWestern{SIMSUN}[
        Path=./fonts/,
        Extension=.TTC,
        UprightFont=*
    ]
}{
    \IfFontExistsTF{SimSun}{
        \newfontfamily\SimSunWestern{SimSun}
    }{
        \newfontfamily\SimSunWestern{FandolSong-Regular}
    }
}
\newcommand{\songtiarabic}[1]{{\SimSunWestern #1}}

% 黑体
\IfFileExists{./fonts/SIMHEI.TTF}{
    \setCJKfamilyfont{hei_windows}[
        Path=./fonts/,
        Extension=.TTF,
        AutoFakeSlant=0.333,
        UprightFont=SIMHEI
    ]{simhei}
}{
    \IfFontExistsTF{SimHei}{
        \setCJKfamilyfont{hei_windows}{SimHei}[
            AutoFakeSlant=0.333
        ]
    }{
        \setCJKfamilyfont{hei_windows}{FandolHei-Regular}[
            AutoFakeSlant=0.333
        ]
    }
}
\renewcommand{\heiti}{
  \CJKfamily{hei_windows}%
  \fontspec{Times New Roman}
}
% 西文黑体
\IfFileExists{./fonts/SIMHEI.TTF}{
    \newfontfamily\SimHeiWestern{SIMHEI}[
        Path=./fonts/,
        Extension=.TTF,
        UprightFont=*
    ]
}{
    \IfFontExistsTF{SimHei}{
        \newfontfamily\SimHeiWestern{SimHei}
    }{
        \newfontfamily\SimHeiWestern{FandolHei-Regular}
    }
}
\newcommand{\heitiarabic}[1]{{\SimHeiWestern #1}}

% 仿宋
\IfFileExists{./fonts/SIMFANG.TTF}{
    \setCJKfamilyfont{fang_windows}[
        Path=./fonts/,
        Extension=.TTF,
        AutoFakeBold=2.0,
        AutoFakeSlant=0.333,
        UprightFont=SIMFANG
    ]{simfang}
}{
    \IfFontExistsTF{FangSong}{
        \setCJKfamilyfont{fang_windows}{FangSong}[
            AutoFakeBold=2.0,
            AutoFakeSlant=0.333
        ]
    }{
        \setCJKfamilyfont{fang_windows}{FandolFang-Regular}[
            AutoFakeBold=2.0,
            AutoFakeSlant=0.333
        ]
    }
}
\renewcommand{\fangsong}{\CJKfamily{fang_windows}}

% 楷体
\IfFileExists{./fonts/SIMKAI.TTF}{
    \setCJKfamilyfont{kai_windows}[
        Path=./fonts/,
        Extension=.TTF,
        AutoFakeBold=2.0,
        AutoFakeSlant=0.333,
        UprightFont=SIMKAI
    ]{simkai}
}{
    \IfFontExistsTF{KaiTi}{
        \setCJKfamilyfont{kai_windows}{KaiTi}[
            AutoFakeBold=2.0,
            AutoFakeSlant=0.333
        ]
    }{
        \setCJKfamilyfont{kai_windows}{FandolKai-Regular}[
            AutoFakeBold=2.0,
            AutoFakeSlant=0.333
        ]
    }
}
\renewcommand{\kaishu}{\CJKfamily{kai_windows}}

%--- 字号 ---%

\newcommand{\xiaoer}{\fontsize{18.06749pt}{23.086043pt}\selectfont} % 小二
\newcommand{\sihao}{\fontsize{14.05249pt}{23.086043pt}\selectfont} % 四号
\newcommand{\xiaosi}{\fontsize{12.045pt}{23.086043pt}\selectfont} % 小四
\newcommand{\wuhao}{\fontsize{10.53937pt}{10.53937pt}\selectfont} % 五号
\newcommand{\xiaowu}{\fontsize{9.03374pt}{12.5pt}\selectfont}

%--- 快捷符号 ---%
\newcommand{\blx}{\symbol{"FF5E}} % 一字宽波浪线，符合国标，U+FF5E
%\newcommand{\blx}{\textasciitilde} % 波浪线
\newcommand{\slh}{……} % 省略号
\RequirePackage{xspace}

\newcommand{\textbib}[1]{%
  {\fontspec{Times New Roman}\MakeUppercase{\scalebox{1.2}[1.2]{\textsubscript{\hskip -0.1em #1\hskip -0.4em}}}}%
}
\newcommand{\textre}[1]{%
  {\fontspec{Times New Roman}\MakeUppercase{\scalebox{1.2}[1.2]{\textsubscript{\hskip -0.15em #1\hskip -0.2em}}}}%
}
\newcommand{\XeLaTeX}{X\textre{\reflectbox{E}}\LaTeX\xspace}
\newcommand{\BibLaTeX}{B\textbib{IB}\LaTeX\xspace}
\newcommand{\textBibTeX}{B\textbib{IB}\TeX\xspace}

%------- 数学 -------%
\RequirePackage{upgreek}
\providecommand{\dd}{\mathop{}\!\mathrm{d}}
\providecommand{\ee}{\mathrm{e}}
\providecommand{\ii}{\mathrm{i}}
\providecommand{\jj}{\mathrm{j}}

\renewcommand\mathellipsis{\cdots} % 省略号居中

\AtBeginDocument{
\renewcommand{\Re}{\operatorname{Re}} % 罗马体\Re
\renewcommand{\Im}{\operatorname{Im}} % 罗马体\Im
}

% \parallel用宋体，使之倾斜
\IfFileExists{./fonts/SIMSUN.TTC}{
    \setmathfont{SIMSUN.TTC}[
        Path=./fonts/,
        Extension=.TTC,
        range={"2225}
    ]
}{
    \IfFontExistsTF{SimSun}{
        \setmathfont{SimSun}[range={"2225}]
    }{
        \IfFontExistsTF{FandolSong-Regular}{
        \setmathfont{FandolSong-Regular}[range={"2225}]}
{% 回退默认
}}}

% 公式前后间距，改了似乎更不美观了，故隐去
% equation
%\BeforeBeginEnvironment{equation}{\vspace{-1em}}
%\AfterEndEnvironment{equation}{\vspace{-1em}}
% equation*
%\BeforeBeginEnvironment{equation*}{\vspace{-1em}}
%\AfterEndEnvironment{equation*}{\vspace{-1em}}
% align
%\BeforeBeginEnvironment{align}{\vspace{-0.5em}}
% \AfterEndEnvironment{align}{\vspace{-1.25em}}
% align*
%\BeforeBeginEnvironment{align*}{\vspace{-2em}}
%\AfterEndEnvironment{align*}{\vspace{-1em}}

%--- 单位 ---%
\RequirePackage{siunitx}
\sisetup{
  number-mode = text, % 数字字体改为与正文一致
  inter-unit-product = \cdot, % 用 \cdot 分隔
  list-separator = {、},
  list-final-separator = {和},
  list-pair-separator = {和},
  list-units = single,
  range-units = single,
  range-phrase = \blx
}

%------- 页面设置 -------%
\RequirePackage{geometry}
\makeatletter
\def\@true{true}
\ifx\SymmetricMargins\@true
    % 对称页边距模式（印刷版）
    \geometry{
        inner=30mm,
        outer=25mm,
        top=27.3mm,
        bottom=28mm,
        headsep=7.1mm,
        footskip=8.6mm
    }
\else
    % 固定页边距模式（电子版）
    \geometry{
        left=30mm,
        right=25mm,
        top=27.3mm,
        bottom=28mm,
        headsep=7.1mm,
        footskip=8.6mm
    }
    % 强制奇偶页使用相同的左右边距
    \setlength{\oddsidemargin}{\dimexpr 30mm - 1in\relax}
    \setlength{\evensidemargin}{\dimexpr 30mm - 1in\relax}
\fi
\makeatother

\setlength{\headheight}{13.37761pt}
\addtolength{\topmargin}{-1.37761pt}
% 数据经与Word模板比对得来

%--- 页眉页脚 ---%
\RequirePackage{fancyhdr}

\renewcommand{\headrulewidth}{0.725pt} % 页眉线宽
\renewcommand{\footrulewidth}{0pt} % 页脚线宽
\renewcommand{\chaptermark}[1]{\markboth{\thechapter\hspace{0.5em}#1}{}} % 修改章节标记，使\leftmark显示数字
\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}{}}

% 默认页面页眉页脚样式

\fancypagestyle{plain}{
    \fancyhf{}
    \fancyfoot[C]{\xiaowu\thepage}% 页码位于页脚居中

    % 左右两栏页眉，左为论文题目，右为当前章
    \fancyhead[L]{\wuhao{东北大学本科生毕业设计（论文）}}
    \fancyhead[R]{\wuhao{\leftmark}}
}
\pagestyle{plain}

% 调整页眉稍微超出文本宽度，也是经比对得来
\makeatletter
\renewcommand{\headrule}{%
  % 让横线往下一点
  \vspace*{0.067em}
  % 也可以让页眉横线延长
  \hrule width 1.00\textwidth height \headrulewidth}
\makeatother

\fancypagestyle{statement}{
    \fancyhead[L]{\wuhao{东北大学本科生毕业设计（论文）}}
    \fancyhead[R]{\wuhao{郑重声明}}
    \fancyfoot[C]{}
}
\fancypagestyle{contents}{
    \fancyhead[L]{\wuhao{东北大学本科生毕业设计（论文）}}
    \setlength{\headsep}{22.5pt} % 增加页眉后高度
    \fancyhead[R]{\wuhao{目录}}
    \fancyfoot[C]{}
}
\fancypagestyle{cabstract}{
    \pagenumbering{Roman}
    \fancyhead[L]{\wuhao{东北大学本科生毕业设计（论文）}}
    \fancyhead[R]{\wuhao{摘要}}
}
\fancypagestyle{eabstract}{
    \fancyhead[L]{\wuhao{东北大学本科生毕业设计（论文）}}
    \fancyhead[R]{\wuhao{Abstract}}
}
\fancypagestyle{app2}{
    \fancyhead[L]{\wuhao{东北大学本科生毕业设计（论文）}}
    \fancyhead[R]{\wuhao{附录2：外文原文}}
    \fancyfoot[C]{}
}
\fancypagestyle{ack}{
    \fancyhead[L]{\wuhao{东北大学本科生毕业设计（论文）}}
    \fancyhead[R]{\wuhao{致谢}}
    \fancyfoot[c]{}
}

\fancypagestyle{listoffiguretable}{\fancyhead[R]{\kaiti\wuhao{插图与表格目录}}}

\RequirePackage{untilchapter}
% 首页右开的时候，全空的左页不留页眉页脚

%--- 段落格式 ---%
\RequirePackage{setspace}

%------- 封面 -------%
\newcommand{\coverxt}[1]{{\rmfamily\textit{#1}}}
\newcommand{\CoverTitleText}{未设置标题}
\newcommand{\SetCoverTitle}[1]{\renewcommand{\CoverTitleText}{#1}}
\newcommand{\COVERtitle}{%
  \put(130.5,-329.65){%
    \parbox[t]{9.75cm}{%
      \zihao{-3}\setlength{\baselineskip}{31.3pt}\textbf{%
      \def\CJKglue{\hskip 0.1925em}% 逐字符插入间距，注意这个注释不能删，会干预结果。。。玄学
      \def\\{\ignorespaces}% 让 \\ 不产生任何效果
      \CoverTitleText}%
    }%
  }%
}
\newcommand{\covertitle}{%
  \put(-17.03,-226.45){%
    \parbox[t]{15cm}{%
      \zihao{2}\heiti\centering
      \setlength{\baselineskip}{32pt}\CoverTitleText
    }%
  }%
}
\newcommand{\CoverIDText}{20227523}
\newcommand{\SetCoverID}[1]{\renewcommand{\CoverIDText}{#1}}
\newcommand{\coverid}{\put(58.6,3.9){\makebox(0,0)[c]{\heiti\wuhao\heitiarabic{\CoverIDText}}}}

\newcommand{\CoverCollegeText}{生命科学与健康学院}
\newcommand{\SetCoverCollege}[1]{\renewcommand{\CoverCollegeText}{#1}}
\newcommand{\COVERcollege}{%
  \put(130.5,-442.4){%
    \makebox(0,0)[l]{%
      \zihao{-3}\textbf{%
        \def\CJKglue{\hskip 0.1925em}% 这个注释不能删，会干预结果
        \CoverCollegeText
      }%
    }%
  }%
}
\newcommand{\covercollege}{\put(224.4,-389.35){\makebox(0,0)[l]{\zihao{-3}\CoverCollegeText}}}

\newcommand{\CoverMajorText}{生物工程}
\newcommand{\SetCoverMajor}[1]{\renewcommand{\CoverMajorText}{#1}}
\newcommand{\COVERmajor}{%
  \put(130.5,-478){%
    \makebox(0,0)[l]{%
      \zihao{-3}\textbf{%
        \def\CJKglue{\hskip 0.1925em}% 别删啊，说了别删
        \CoverMajorText
      }%
    }%
  }%
}
\newcommand{\covermajor}{\put(224.4,-420.65){\makebox(0,0)[l]{\zihao{-3}\CoverMajorText}}}

\newcommand{\CoverNameText}{薛定谔}
\newcommand{\SetCoverName}[1]{\renewcommand{\CoverNameText}{#1}}
\newcommand{\COVERname}{%
  \put(130.5,-513.6){%
    \makebox(0,0)[l]{%
      \zihao{-3}\textbf{%
        \def\CJKglue{\hskip 0.1925em}% 别删
        \CoverNameText
      }%
    }%
  }%
}
\newcommand{\covername}{\put(224.4,-451.95){\makebox(0,0)[l]{\zihao{-3}\CoverNameText}}}

\newcommand{\CoverTeacherText}{郝仁}
\newcommand{\SetCoverTeacher}[1]{\renewcommand{\CoverTeacherText}{#1}}

\newcommand{\CoverTeacherTitleText}{教授}
\newcommand{\SetCoverTeacherTitle}[1]{\renewcommand{\CoverTeacherTitleText}{#1}}

\newcommand{\COVERteacher}{%
  \put(130.5,-549.2){%
    \makebox(0,0)[l]{%
      \zihao{-3}\textbf{%
        \def\CJKglue{\hskip 0.1925em}%
        \CoverTeacherText\hspace{1.385em}\CoverTeacherTitleText
      }%
    }%
  }%
}
\newcommand{\coverteacher}{\put(224.4,-483.25){\makebox(0,0)[l]{\zihao{-3}\CoverTeacherText\hspace{1em}\CoverTeacherTitleText}}}

\RequirePackage{zhnumber}
\newcommand{\CoverYearText}{2026}
\newcommand{\SetCoverYear}[1]{\renewcommand{\CoverYearText}{#1}}
\newcommand{\CoverMonthText}{6}
\newcommand{\SetCoverMonth}[1]{\renewcommand{\CoverMonthText}{#1}}

\newcommand{\COVERdate}{\put(222,-658.7){\makebox(0,0)[c]{\zihao{-3}\def\CJKglue{\hskip 0.07em}%
\zhdigits{\CoverYearText}年\hspace{0.6em}\zhnumber{\CoverMonthText}月}}}

\newcommand{\coverdate}{\put(197,-608.45){\makebox(0,0)[c]{\zihao{-3}\CoverYearText 年\CoverMonthText 月}}}

\newif\ifusebigcover
\usebigcoverfalse % 默认大封面关闭
\newcommand{\insertbigcover}{%
  \ifusebigcover
    \includepdf[
      pages=1,
      width=\paperwidth,
      height=\paperheight,
      pagecommand={
        \thispagestyle{empty}
        \begin{picture}(0,0)
         \put(29.5,-324.3){%
          \makebox(0,0)[l]{%
           \zihao{-3}\textbf{%
            \def\CJKglue{\hskip 0.1925em}
             \textbf{论文题目}
          }}}
          \COVERtitle
          \put(29.5,-442.4){%
          \makebox(0,0)[l]{%
           \zihao{-3}\textbf{%
            \def\CJKglue{\hskip 0.1925em}
             \textbf{学院名称}
          }}}
          \COVERcollege
          \put(29.5,-478){%
          \makebox(0,0)[l]{%
           \zihao{-3}\textbf{%
            \def\CJKglue{\hskip 0.1925em}
             \textbf{专业名称}
          }}}
          \COVERmajor
          \put(29.5,-513.6){%
          \makebox(0,0)[l]{%
           \zihao{-3}\textbf{%
            \def\CJKglue{\hskip 0.1925em}
             \textbf{学生姓名}
          }}}
          \COVERname
          \put(29.5,-549.2){%
          \makebox(0,0)[l]{%
           \zihao{-3}\textbf{%
            \def\CJKglue{\hskip 0.1925em}
             \textbf{指导教师}
          }}}
          \COVERteacher
          \COVERdate
        \end{picture}
      }
    ]{DoNotEdit/BIGCOVER.pdf}
    \AtEndDocument{%
    \huanye%
    \includepdf[%
    pages=-,%
    width=\paperwidth,%
    height=\paperheight]{DoNotEdit/BIGBACKCOVER.pdf}}
    \huanye
  \fi
}

% 已废弃
% \newcommand{\CoverDateText}{2026年6月} 
% \newcommand{\SetCoverDate}[1]{\renewcommand{\CoverDateText}{#1}}

%------- 郑重声明 -------%
% 签名路径与签名日期
\newcommand{\UserSignatureImage}{settings/signature.png}
\newcommand{\UserSignatureDate}{\today}

% 提供修改签名路径和日期的命令
\newcommand{\SetUserSignature}[2]{%
  \renewcommand{\UserSignatureDate}{#1}%
  \renewcommand{\UserSignatureImage}{#2}%
}

%------- 章节设置 -------%

% 修正chapter和（section/正文）之间的间距
% 原理我不懂，但调完能用就行
% 感谢@Izumi Sakai的方法
% https://ask.latexstudio.net/ask/question/17843.html
\RequirePackage{expl3} % LaTeX3
\makeatletter
\ExplSyntaxOn
\bool_new:N \l_@@_chapter_afterskip_bool
\hook_gput_code:nnn { cmd / chapter / before } {.}
  { \bool_gset_true:N \l_@@_chapter_afterskip_bool }
\hook_gput_code:nnn { cmd / @startsection / before } {.}
  { \bool_if:NT \l_@@_chapter_afterskip_bool { \vskip 0.25em } }
\DeclareDocumentCommand \banchapterskip {}
  { \bool_gset_false:N \l_@@_chapter_afterskip_bool }
\ExplSyntaxOff
\makeatother

% Heading格式
\makeatletter

\newif\ifheadingnumbertimes  % 控制编号字体
\newif\ifheadingtitletimes   % 控制标题内容字体

% 控制编号字体
\newcommand{\headingnumbertimes}[1]{%
  \def\@tempa{#1}%
  \def\@tempb{true}%
  \ifx\@tempa\@tempb
    \headingnumbertimestrue
  \else
    \headingnumbertimesfalse
  \fi
  \updateheadingformat
}

% 控制标题内容字体
\newcommand{\headingtitletimes}[1]{%
  \def\@tempa{#1}%
  \def\@tempb{true}%
  \ifx\@tempa\@tempb
    \headingtitletimestrue
  \else
    \headingtitletimesfalse
  \fi
  \updateheadingformat
}

\newcommand{\updateheadingformat}{%
  % 设置编号格式
  \ifheadingnumbertimes
    \ctexset{
      chapter/format            = \centering\zihao{-2}\heiti\timesrm,
      section/nameformat        = \zihao{4}\heiti\timesrm,
      subsection/nameformat     = \zihao{-4}\heiti\timesrm,
      subsubsection/nameformat  = \zihao{-4}\heiti\timesrm,
    }
  \else
    \ctexset{
      chapter/format            = \centering\zihao{-2}\heiti\heitiarabic,
      section/nameformat        = \zihao{4}\heiti\heitiarabic,
      subsection/nameformat     = \zihao{-4}\heiti\heitiarabic,
      subsubsection/nameformat  = \zihao{-4}\heiti\heitiarabic,
    }
  \fi
  % 设置标题内容格式
  \ifheadingtitletimes
    \ctexset{
      chapter/titleformat       = \zihao{-2}\heiti\timesrm,
      section/titleformat       = \zihao{4}\heiti\timesrm,
      subsection/titleformat    = \zihao{-4}\heiti\timesrm,
      subsubsection/titleformat = \zihao{-4}\heiti\timesrm,
    }
  \else
    \ctexset{
      chapter/titleformat       = \zihao{-2}\heiti\heitiarabic,
      section/titleformat       = \zihao{4}\heiti\heitiarabic,
      subsection/titleformat    = \zihao{-4}\heiti\heitiarabic,
      subsubsection/titleformat = \zihao{-4}\heiti\heitiarabic,
    }
  \fi
}
\makeatother

% 设置默认值
\headingnumbertimes{true} % 编号用Times
\headingtitletimes{true}  % 标题内容用Times

% 其他ctex配置
\ctexset{
  chapter = {
    name        = {},
    number      = \arabic{chapter},
    aftername   = \hskip 0.5em,
    beforeskip  = -1.6em,
    afterskip   = 1.35em
  },
  section = {
    format      = \zihao{4}\heiti,
    aftername   = \hskip 0.5em,
    beforeskip  = 0.9em,
    afterskip   = 0.975em,
    aftertitle+ = \banchapterskip
  },
  subsection = {
    format      = \zihao{-4}\heiti,
    aftername   = \hskip 0.5em,
    beforeskip  = 0.525em,
    afterskip   = 0.4em
  },
  subsubsection = {
    format      = \zihao{-4}\heiti,
    aftername   = \hskip 0.5em,
    beforeskip  = 0.48em,
    afterskip   = -1.3em
  }
}

% 以下代码实现当某页以\subsection或\subsubsection起始时，修改页眉后距离
\RequirePackage{etoolbox}

% 定义subsection页面专用样式
\fancypagestyle{subsecpage}{%
  \fancyhf{}
  \fancyfoot[C]{\wuhao-\hspace{0.25em}\thepage\hspace{0.25em}-}%
  \fancyhead[L]{\wuhao 东北大学本科生毕业设计（论文）}%
  \fancyhead[R]{\wuhao \leftmark}%
  \setlength{\headsep}{12pt}%
  \setlength{\footskip}{25pt}%
}

% 定义subsubsection页面专用样式
\fancypagestyle{subsubsecpage}{%
  \fancyhf{}
  \fancyfoot[C]{\wuhao-\hspace{0.25em}\thepage\hspace{0.25em}-}%
  \fancyhead[L]{\wuhao 东北大学本科生毕业设计（论文）}%
  \fancyhead[R]{\wuhao \leftmark}%
  \setlength{\headsep}{14pt}%
  \setlength{\footskip}{29pt}%
}

% subsection
\makeatletter
% 定义标记变量，用于指示下一页是否需要应用特殊样式
\newif\if@nextpage@special@subsection
\@nextpage@special@subsectionfalse
% 在文档开始时重置标记
\AtBeginDocument{\global\@nextpage@special@subsectionfalse}
% 小节起始检测逻辑
\def\@subsec@begin{%
  \if@mainmatter
    %\typeout{DEBUG [SUBSEC]: pagetotal=\the\pagetotal, topskip=\the\topskip}%

    % 检测是否需要标记下一页应用特殊样式
    \ifdim\pagetotal>600pt % 为了防止过高的浮动体导致标记失败，设置了一个较宽容的值，可能会导致编译时间变长一些吧
     \ifdim\pagetotal<702pt
      \global\@nextpage@special@subsectiontrue
      %\typeout{*** [SUBSEC] Marking next page for special style ***}%
     \fi
    \fi

    % 检测当前页是否需要应用特殊样式
    \ifdim\pagetotal<0.1\topskip
      \thispagestyle{subsecpage}%
      %\typeout{*** [SUBSEC] Subsection at page top - style applied ***}%
    \else
      %\typeout{*** [SUBSEC] Subsection NOT at page top - style NOT applied ***}%
    \fi
  \fi
}
% 页面输出钩子，处理标记的页面
\AddToHook{shipout/background}{%
  \if@nextpage@special@subsection
    \thispagestyle{subsecpage}%
    %\typeout{*** [SUBSEC] Applying special style to marked page ***}%
    \global\@nextpage@special@subsectionfalse
  \fi
}
% 重定义命令，添加页面样式检测逻辑
\let\oldsubsection\subsection
\renewcommand{\subsection}{%
  \@ifstar
    {\@subsec@begin\oldsubsection*} % 处理带星号的小节
    {\@ifnextchar[{\@subsec@begin@opt}{\@subsec@begin@noopt}} % 处理可选参数
}
% 处理带可选参数的小节
\def\@subsec@begin@opt[#1]#2{%
  \@subsec@begin
  \oldsubsection[#1]{#2}%
}
% 处理不带可选参数的小节
\def\@subsec@begin@noopt#1{%
  \@subsec@begin
  \oldsubsection{#1}%
}
\makeatother

% 同理处理subsubsection
\makeatletter

% 标记变量
\newif\if@nextpage@special
\@nextpage@specialfalse

% 在文档开始时重置标记
\AtBeginDocument{\global\@nextpage@specialfalse}

% 起始检测逻辑
\def\@subsubsec@begin{%
  \if@mainmatter
    %\typeout{DEBUG: pagetotal=\the\pagetotal, topskip=\the\topskip}%
    
    % 检测是否需要标记下一页应用特殊样式
    \ifdim\pagetotal>600pt
     \ifdim\pagetotal<702pt
      \global\@nextpage@specialtrue
      %\typeout{*** Marking next page for special style ***}%
     \fi
    \fi
    
    % 检测当前页是否需要应用特殊样式
    \ifdim\pagetotal<0.1\topskip
      \thispagestyle{subsubsecpage}%
      %\typeout{*** Subsubsection at page top - style applied ***}%
    \else
      %\typeout{*** Subsubsection NOT at page top - style NOT applied ***}%
    \fi
  \fi
}

% 页面输出
\AddToHook{shipout/background}{%
  \if@nextpage@special
    \thispagestyle{subsubsecpage}%
    %\typeout{*** Applying special style to marked page ***}%
    \global\@nextpage@specialfalse
  \fi
}

% 命令重定义
\let\oldsubsubsection\subsubsection
\renewcommand{\subsubsection}{%
  \@ifstar
    {\@subsubsec@begin\oldsubsubsection*}% 处理带星号的子小节
    {\@ifnextchar[{\@subsubsec@begin@opt}{\@subsubsec@begin@noopt}}% 处理可选参数
}

% 带可选参数的
\def\@subsubsec@begin@opt[#1]#2{%
  \@subsubsec@begin
  \oldsubsubsection[#1]{#2}%
}

% 不带可选参数
\def\@subsubsec@begin@noopt#1{%
  \@subsubsec@begin
  \oldsubsubsection{#1}%
}

\makeatother


% 这段实现在section后判断：正文-->添加vskip；subsection-->无操作
% 感谢Claude的帮助
% 感谢@Sagittarius Rover的灵感
% https://ask.latexstudio.net/ask/question/17843.html
% 这问题卡了我三天......
\makeatletter
% 定义标志来跟踪当前是否为section、subsection或subsubsection
\newif\if@insection
\newif\if@insubsection
\newif\if@insubsubsection
\@insectionfalse
\@insubsectionfalse
\@insubsubsectionfalse
% 保存原始的@startsection命令
\let\orig@startsection\@startsection
% 重新定义@startsection
\def\@startsection#1#2#3#4#5#6{%
  % 重置所有标志
  \@insectionfalse
  \@insubsectionfalse
  \@insubsubsectionfalse
  % 检查级别并设置相应标志
  \ifnum#2=1\relax
    \@insectiontrue
  \else\ifnum#2=2\relax
    \@insubsectiontrue
  \else\ifnum#2=3\relax
    \@insubsubsectiontrue
  \fi\fi\fi
  % 调用原始@startsection
  \orig@startsection{#1}{#2}{#3}{#4}{#5}{#6}%
}
% 保存原始的@afterheading
\let\orig@afterheading\@afterheading
% 重新定义@afterheading
\def\@afterheading{%
  \@nobreaktrue
  \everypar{%
    \if@nobreak
      \@nobreakfalse
      \clubpenalty \@M
      \if@afterindent \else
        {\setbox\z@\lastbox}%
      \fi
      % 检查section：如果是section且下一个不是subsection，则插入vskip
      \if@insection
        \@ifnextchar\subsection{}{%
          \vskip -1.73em}%
        \@insectionfalse
      % 检查subsection：如果是subsection且下一个不是subsubsection，则插入vskip
      \else\if@insubsection
        \@ifnextchar\subsubsection{}{%
          \vskip -1.75em}% 9.30 原1.75
        \@insubsectionfalse
      % 检查subsubsection：如果是subsubsection且下一个不是paragraph，则插入vskip
      \else\if@insubsubsection
        \@ifnextchar\paragraph{}{%
          \vskip 0em}%
        \@insubsubsectionfalse
      \fi\fi\fi
    \else
      \clubpenalty \@clubpenalty
    \fi
    \everypar{}%
  }%
}

\let\orig@begin\begin
% 给subsubsection后的紧跟列表添加额外间距
\renewcommand{\begin}[1]{%
  % 检查是否是列表环境且刚刚处理了subsubsection
  \if@insubsubsection
    \def\@tempa{#1}%
    \def\@tempb{itemize}%
    \def\@tempc{enumerate}%
    \ifx\@tempa\@tempb
      \vskip 1.88em  % itemize前的额外间距
      \@insubsubsectionfalse
    \else\ifx\@tempa\@tempc
      \vskip 1.88em  % enumerate前的额外间距
      \@insubsubsectionfalse
    \fi\fi
  \fi
  % 调用原始\begin命令
  \orig@begin{#1}%
}

\makeatother

%------- 中文摘要 -------%
\newenvironment{cabstract}{
    \setcounter{secnumdepth}{-1}
    \chapter*{{
    \xiaoer
    \vspace*{-23.575pt}\\
    \hspace*{0.2em}摘\hspace{1em}要}
    \vspace*{-4.5pt}}
    \addcontentsline{toc}{chapter}{摘要}
    \songti\xiaosi
    \setlength{\baselineskip}{23.086043pt}
    \thispagestyle{cabstract}
}{
    \setcounter{secnumdepth}{3}
}

%--- 中文关键词 ---%
\def\ckeywords#1{
    \vskip 1.95em
    \begin{spacing}{1}
      \noindent\heiti\xiaosi\hspace*{-0.2em}\textbf{关键词：}\songti\xiaosi #1
    \end{spacing}
}

%------- 英文摘要 -------%
\newenvironment{eabstract}{
    \setcounter{secnumdepth}{-1}
    \chapter*{{
    \xiaoer
    \vspace*{-23.575pt}\\
    \textrm{\hspace{0.2em}\textbf{ABSTRACT}}}
    \vspace*{-4.5pt}}
    \addcontentsline{toc}{chapter}{ABSTRACT}
    \xiaosi
    \setlength{\baselineskip}{23.086043pt}
    \thispagestyle{eabstract}
}{
    \setcounter{secnumdepth}{3}
}

%--- 英文关键词 ---%
\def\ekeywords#1{
    \vskip 1.65em
    \begin{spacing}{1}
      \noindent\xiaosi\textbf{Key words:~}\xiaosi #1
    \end{spacing}
    \pagestyle{eabstract}
}

%------- 附录中文摘要 -------%
\newenvironment{cfabstract}{
    \chapter*{{
    \xiaoer
    \vspace*{-23.575pt}\\
    \hspace*{0.2em}摘\hspace{1em}要}
    \vspace*{-4.5pt}}
    \songti\xiaosi
    \setlength{\baselineskip}{23.086043pt}
    \thispagestyle{plain}
}

%--- 中文附录关键词 ---%
\def\cfkeywords#1{
    \vskip 1.95em
    \begin{spacing}{1} % 目测经验值，一般关键词不换行，影响不大
      \noindent\heiti\xiaosi\hspace*{-0.2em}\textbf{关键词：}\songti\xiaosi #1
    \end{spacing}
    \thispagestyle{plain}
}

%------- 附录英文摘要 -------%
\newenvironment{efabstract}{
    \chapter*{{
    \xiaoer
    \vspace*{-23.575pt}\\
    \textrm{\hspace{0.2em}\textbf{ABSTRACT}}}
    \vspace*{-4.5pt}}
    \xiaosi
    \setlength{\baselineskip}{23.086043pt}
    \thispagestyle{plain}
}

% 附录英文关键词
\def\efkeywords#1{
    \vskip 2em
    \begin{spacing}{1}
      \noindent\xiaosi\textbf{Key words:~}\xiaosi #1
    \end{spacing}
    \pagestyle{plain}
}

%------- 目录 -------%
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}

\CTEXoptions[contentsname={\hspace*{-0.2em}目\hspace{1em}录}]

\RequirePackage{tocloft}

\renewcommand{\cfttoctitlefont}{\hfill\xiaoer\heiti}
\renewcommand{\cftaftertoctitle}{\hfill}

\setlength{\cftbeforetoctitleskip}{-9pt} % 目录标题与页面顶部间距
\setlength{\cftaftertoctitleskip}{-1.75pt} % 目录标题与内容间距

\renewcommand{\cftdot}{.}
%\renewcommand{\cftdot}{\CJKTimes…} % 官方示例的省略号引导线，但效果不好，启用的话替换掉上一行即可
\renewcommand{\cftdotsep}{0.2} % 点间距
\renewcommand{\cftchapdotsep}{\cftdotsep}

% Thanks to @Sagittarius Rover、@雾月
% https://ask.latexstudio.net/ask/question/8102.html
\makeatletter%%
\renewcommand{\cftchapfillnum}[1]{%
  {\cftchapleader}\nobreak
  \makebox{\cftchappagefont #1}\cftchapafterpnum\par
}
\renewcommand{\cftsecfillnum}[1]{%
  {\cftsecleader}\nobreak
  \makebox{\cftsecpagefont #1}\cftsecafterpnum\par
}
\renewcommand{\cftsubsecfillnum}[1]{%
  {\cftsubsecleader}\nobreak
  \makebox{\cftsubsecpagefont #1}\cftsubsecafterpnum\par
}
\renewcommand{\cftsubsubsecfillnum}[1]{%
  {\cftsubsubsecleader}\nobreak
  \makebox{\cftsubsubsecpagefont #1}\cftsubsubsecafterpnum\par
}
\renewcommand{\cftparafillnum}[1]{%
  {\cftparaleader}\nobreak
  \makebox{\cftparapagefont #1}\cftparaafterpnum\par
}
\makeatother

%--- 目录项间距设置 --- %

% 设置常规间距
\setlength{\cftbeforechapskip}{21pt}
\setlength{\cftbeforesecskip}{13pt}
\setlength{\cftbeforesubsecskip}{2.5ex}
\setlength{\cftbeforesubsubsecskip}{2.5ex}

% 以下代码使目录中每级节与其后的第一个子节之间额外增加间距
\makeatletter
% 定义所有标记
\newif\if@afterchapter
\@afterchapterfalse
\newif\if@aftersection
\@aftersectionfalse
\newif\if@aftersubsection
\@aftersubsectionfalse

% chapter渲染逻辑
\let\old@l@chapter\l@chapter
\renewcommand{\l@chapter}[2]{%
  \old@l@chapter{#1}{#2}%
  \global\@afterchaptertrue
  \global\@aftersectionfalse % 清除其他标记
  \global\@aftersubsectionfalse
}

% section渲染逻辑
\let\old@l@section\l@section
\renewcommand{\l@section}[2]{%
  \if@afterchapter
    \addvspace{2.75pt} % chapter后的额外间距
    \global\@afterchapterfalse
  \fi
  \old@l@section{#1}{#2}%
  \global\@aftersectiontrue % 为subsection设置标记
  \global\@aftersubsectionfalse % 清除subsection标记
}

% subsection渲染逻辑
\let\old@l@subsection\l@subsection
\renewcommand{\l@subsection}[2]{%
  \if@aftersection
    \addvspace{-0.65pt} % section后的额外间距
    \global\@aftersectionfalse
  \fi
  \old@l@subsection{#1}{#2}%
  \global\@aftersubsectiontrue % 为subsubsection设置标记
}

% subsubsection渲染逻辑
\let\old@l@subsubsection\l@subsubsection
\renewcommand{\l@subsubsection}[2]{%
  \if@aftersubsection
    \addvspace{0pt} % subsection后的额外间距
    \global\@aftersubsectionfalse
  \fi
  \old@l@subsubsection{#1}{#2}%
}
\makeatother

% 以下代码实现低级别标题后接chapter插入额外间距
\makeatletter
% 定义标记，用于记录最后一个渲染的标题级别
\newif\if@lastwassection
\@lastwassectionfalse
\newif\if@lastwassubsection
\@lastwassubsectionfalse
\newif\if@lastwassubsubsection
\@lastwassubsubsectionfalse

% 重新定义chapter，检测之前的标题级别
\let\oldold@l@chapter\l@chapter
\renewcommand{\l@chapter}[2]{%
  % 检测并添加相应间距
  \if@lastwassubsubsection
    \addvspace{15pt} % subsubsection-chapter
    \global\@lastwassubsubsectionfalse
  \else
    \if@lastwassubsection
      \addvspace{4pt} % subsection-chapter
      \global\@lastwassubsectionfalse
    \else
      \if@lastwassection
        \addvspace{-4.25pt} % section-chapter
        \global\@lastwassectionfalse
      \fi
    \fi
  \fi
  % 调用原始的chapter渲染
  \oldold@l@chapter{#1}{#2}%
  % 清除所有标记
  \global\@lastwassectionfalse
  \global\@lastwassubsectionfalse
  \global\@lastwassubsubsectionfalse
}

% 更新section，设置最后标题标记
\let\oldold@l@section\l@section
\renewcommand{\l@section}[2]{%
  % 清除所有标记
  \global\@lastwassectionfalse
  \global\@lastwassubsectionfalse
  \global\@lastwassubsubsectionfalse
  % 调用原始的section渲染
  \oldold@l@section{#1}{#2}%
  % 设置当前级别标记
  \global\@lastwassectiontrue
}

% 更新subsection，设置最后标题标记
\let\oldold@l@subsection\l@subsection
\renewcommand{\l@subsection}[2]{%
  % 清除所有标记
  \global\@lastwassectionfalse
  \global\@lastwassubsectionfalse
  \global\@lastwassubsubsectionfalse
  % 调用原始的subsection渲染
  \oldold@l@subsection{#1}{#2}%
  % 设置当前级别标记
  \global\@lastwassubsectiontrue
}

% 更新subsubsection，设置最后标题标记
\let\oldold@l@subsubsection\l@subsubsection
\renewcommand{\l@subsubsection}[2]{%
  % 清除所有标记
  \global\@lastwassectionfalse
  \global\@lastwassubsectionfalse
  \global\@lastwassubsubsectionfalse
  % 调用原始的subsubsection渲染
  \oldold@l@subsubsection{#1}{#2}%
  % 设置当前级别标记
  \global\@lastwassubsubsectiontrue
}
\makeatother

%--- 目录项字体格式 ---%
\makeatletter
\def\@true{true}
% Chapter编号字体
\newcommand{\tocchapternumbertimes}[1]{%
  \def\@tocchapternumbertimes{#1}%
}
\def\@tocchapternumbertimes{true} % 默认值
% Chapter标题字体
\newcommand{\tocchaptertitletimes}[1]{%
  \def\@tocchaptertitletimes{#1}%
}
\def\@tocchaptertitletimes{true} % 默认值
% Chapter页码字体
\newcommand{\tocchapterpagetimes}[1]{%
  \def\@tocchapterpagetimes{#1}%
}
\def\@tocchapterpagetimes{true} % 默认值
\AtBeginDocument{%
  % Chapter编号字体
  \ifx\@tocchapternumbertimes\@true
    \renewcommand{\cftchappresnum}{\timesrm}%
  \else
    \renewcommand{\cftchappresnum}{\heitiarabic}%
  \fi
  %
  % Chapter标题字体
  \ifx\@tocchaptertitletimes\@true
    \renewcommand{\cftchapfont}{\sihao\heiti\timesrm}%
  \else
    \renewcommand{\cftchapfont}{\sihao\heiti\SimHeiWestern}%
  \fi
  %
  % Chapter页码字体
  \ifx\@tocchapterpagetimes\@true
    \renewcommand{\cftchappagefont}{\timesrm}%
  \else
    \renewcommand{\cftchappagefont}{\heiti\SimHeiWestern}%
  \fi
}
\makeatother

\renewcommand{\cftsecfont}{\xiaosi\songti}
\renewcommand{\cftsubsecfont}{\xiaosi\songti}
\renewcommand{\cftsubsubsecfont}{\xiaosi\songti}

%--- 目录项缩进 ---%

% 设置各级标题与边距的缩进
\setlength{\cftchapindent}{-0.25em}
\setlength{\cftsecindent}{0em}
\setlength{\cftsubsecindent}{0em}
\setlength{\cftsubsubsecindent}{0em}

\setlength{\cftchapnumwidth}{1.75em} % chapter数字宽度
\renewcommand{\cftchapaftersnum}{} % chapter后不带点

% 两个数字参数分别是各级的缩进距离和数字宽度
\cftsetindents{section}{1.75em}{2.25em}
\cftsetindents{subsection}{4.05em}{3em}
\cftsetindents{subsubsection}{7.1em}{3.75em}
\renewcommand{\cftchapleader}{\cftdotfill{\cftchapdotsep}}

% 页眉页脚
\newcommand{\contents}{
\tableofcontents
\thispagestyle{contents}}

%------- 列表 -------%
\RequirePackage{enumitem}
%--- 无序列表 ---%
\setlist[itemize]{%
  itemsep=0pt, % 每一项之间的垂直间距
  topsep=0pt, % 列表上下方与正文的垂直间距
  parsep=0pt, % 段落间距
  partopsep=0pt, % 段落顶部附加间距
  left=2em % 缩进距离（控制整体左移或右移）
}

%--- 有序列表 ---%
\RequirePackage{multicol}

\setlist[enumerate]{%
  itemsep=0pt,
  topsep=0pt,
  parsep=0pt,
  partopsep=0pt,
  left=2em
}

\SetEnumitemKey{shuzi}{
    label=\arabic*.,
    listparindent=2em,
    labelsep=0.25em,
    itemindent=3em
}

\SetEnumitemKey{kuohao}{
    label=（\arabic*）,
    listparindent=2em,
    labelsep=0pt,
    itemindent=4em
}

\RequirePackage{circledsteps} % \Circled
\newcommand{\Quan}[1]{%
  \Circled{%
    \scalebox{0.45}[1]{%
      \songtiarabic{#1}%
    }%
  }%
}

\newcommand{\quansplit}[1]{%
    \ifnum#1<10
        \quan{#1}%
    \else\ifnum#1<100
        \edef\tempnum{\number#1}%
        \expandafter\quansplithelper\tempnum\relax
    \else
        \Quan{#1}%
    \fi\fi
}

\def\quansplithelper#1#2\relax{%
    \ifx\relax#2\relax
        \quan{#1}%
    \else
        \quan[#1]{#2}%
    \fi
}

\SetEnumitemKey{quan}{
    label=\hspace{1em}\protect\quansplit{\arabic*},
    listparindent=2em,
    labelwidth=2em,
    labelsep=0pt,
    itemindent=3em
}

\RequirePackage{alphalph}

% 处理enumitem星号机制
\makeatletter
\newcommand{\AlphAlphEnum}[1]{\AlphAlph{\value{#1}}}
\newcommand{\alphalphEnum}[1]{\alphalph{\value{#1}}}

% 注册为enumitem的计数器
\AddEnumerateCounter{\AlphAlphEnum}{\AlphAlph}{AA}
\AddEnumerateCounter{\alphalphEnum}{\alphalph}{aa}
\makeatother

% 定义键
\SetEnumitemKey{daxie}{
    label=\AlphAlphEnum*.,
    listparindent=2em,
    labelsep=0.25em,
    itemindent=3.25em
}
\SetEnumitemKey{xiaoxie}{
    label=\alphalphEnum*.,
    listparindent=2em,
    labelsep=0.25em,
    itemindent=3.25em
}

%------- 图表 -------%

%--- 题注格式 ---%
\renewcommand{\captionfont}{\fontsize{10.5pt}{10.5pt}\songti\selectfont}
\DeclareCaptionLabelSeparator{oneemsep}{\hspace{1em}}
\captionsetup[table]{
  font={small},
  labelsep=oneemsep, % 去掉冒号，改为1em空格
  skip=0pt,
  belowskip = 0pt
}
\captionsetup[figure]{
    labelsep=oneemsep,
    skip=17.9pt,
    belowskip=-9.9pt %-15.74
}

\NewDocumentCommand{\xucaption}{m}{%
  \caption*{图\ref{#1}（续）}} % 续图标题

% 注
\makeatletter

\newif\if@afterzhu
\@afterzhufalse

\newcommand{\zhu}[1]{%
  \vspace*{2.5pt}%
  {\wuhao\noindent #1\par\vskip -0.13075em}
  \global\@afterzhutrue%
  % 设置下一段开始时清除标志
  \everypar{\global\@afterzhufalse\everypar{}}%
}

\let\zhu@orig@section\section
\let\zhu@orig@subsection\subsection  
\let\zhu@orig@subsubsection\subsubsection

\renewcommand{\section}{%
  \if@afterzhu%
    \vspace{0.105em}%
    \global\@afterzhufalse%
    \everypar{} % 清除everypar设置
  \fi%
  \zhu@orig@section%
}

\renewcommand{\subsection}{%
  \if@afterzhu%
    \vspace{0.043em}%
    \global\@afterzhufalse%
    \everypar{}%
  \fi%
  \zhu@orig@subsection%
}

\renewcommand{\subsubsection}{%
  \if@afterzhu%
    \vspace{0.043em}%
    \global\@afterzhufalse%
    \everypar{}%
  \fi%
  \zhu@orig@subsubsection%
}
\makeatother

% 表注
\newcommand{\biaozhu}{\zhu}

% 图注
\newcommand{\tuzhu}{\zhu}

\makeatletter
\let\orig@section\section
\let\orig@subsection\subsection
\let\orig@subsubsection\subsubsection
\newif\if@notuzhu
\@notuzhufalse

\renewcommand{\tuzhu}{%
  \@ifnextchar\bgroup{\@tuzhu@witharg}{\@tuzhu@noarg}%
}

% 当后有参数时
\def\@tuzhu@witharg#1{%
  \def\@tuzhu@arg{#1}%
  \ifx\@tuzhu@arg\@empty
    % 参数为空，执行notuzhu
    \@tuzhu@notuzhu
  \else
    % 参数非空，调用原命令
    \zhu{#1}%
  \fi
}

% 当后无参数
\def\@tuzhu@noarg{%
  \@tuzhu@notuzhu
}

% notuzhu检查后续命令
\def\@tuzhu@notuzhu{%
  \futurelet\@notuzhu@next\@notuzhu@check
}

% 检查下一个是否是 section/subsection/subsubsection
\def\@notuzhu@check{%
  \ifx\@notuzhu@next\section
    \@notuzhutrue
  \else\ifx\@notuzhu@next\subsection
    \@notuzhutrue
  \else\ifx\@notuzhu@next\subsubsection
    \@notuzhutrue
  \else
    % 如果不是，立即重置标志
    \@notuzhufalse
  \fi\fi\fi
}

\renewcommand{\section}{%
  \if@notuzhu
    \vspace{-0.625em}
    \@notuzhufalse % 使用后立即重置标志
  \fi
  \orig@section
}

\renewcommand{\subsection}{%
  \if@notuzhu
    \vspace{-0.7em}
    \@notuzhufalse
  \fi
  \orig@subsection
}

\renewcommand{\subsubsection}{%
  \if@notuzhu
    \vspace{-0.665em}
    \@notuzhufalse
  \fi
  \orig@subsubsection
}

\makeatother

% 以下代码调整续图题后接正文时的间距

\newif\ifusedxucaption
\usedxucaptionfalse

\let\oldxucaption\xucaption
\renewcommand{\xucaption}[1]{%
    \global\usedxucaptiontrue % 设置标志为true
    \oldxucaption{#1}%
}

\let\oldcaption\caption
\renewcommand{\caption}[1]{%
    \global\usedxucaptionfalse % 设置标志为false
    \oldcaption{#1}%
}

% 继续修改\@tuzhu@witharg，在调用\zhu后添加检测
% 俺咋一直打补丁呢
\makeatletter
\def\@tuzhu@witharg#1{%
  \def\@tuzhu@arg{#1}%
  \ifx\@tuzhu@arg\@empty
    \@tuzhu@notuzhu
  \else
    \zhu{#1}%
    \ifusedxucaption%
        \vspace*{0.36em} % 如果使用了\xucaption，添加间距
    \fi%
    \global\usedxucaptionfalse % 重置标志
  \fi
}
\makeatother

%--- 表格 ---%
\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{
   longtable,
   xltabular, % 长表格
   booktabs,  % 三线表
   makecell,
   multirow,  % 跨行表格
   diagbox    % 斜线表头
}
% 定义表格（非续表）页面专用样式
\fancypagestyle{bgpage}{%
  \fancyhf{}
  \fancyfoot[C]{\wuhao-\hspace{0.25em}\thepage\hspace{0.25em}-}%
  \fancyhead[L]{\wuhao 东北大学本科生毕业设计（论文）}%
  \fancyhead[R]{\wuhao\leftmark}%
  \setlength{\headsep}{12pt}%
  \setlength{\footskip}{34.5pt}%
}
% 定义续表页面专用样式
\fancypagestyle{xbpage}{%
  \fancyhf{}
  \fancyfoot[C]{\wuhao-\hspace{0.25em}\thepage\hspace{0.25em}-}%
  \fancyhead[L]{\wuhao 东北大学本科生毕业设计（论文）}%
  \fancyhead[R]{\wuhao\leftmark}%
  \setlength{\headsep}{16pt}%
  \setlength{\footskip}{30.5pt}%
}

\newcommand{\tabsize}{\wuhao}

% 列类型Y：自动列宽，居中
\newcolumntype{Y}{>{\centering\arraybackslash}X}
\renewcommand{\tabularxcolumn}[1]{m{#1}} % 修改X为垂直居中

\newcolumntype{Z}{>{\hfill\arraybackslash}X}

\makeatletter

\newif\if@biaoge@firstpage

\newcommand{\biaoge}[6]{%
  \tabsize
  \setlength{\aboverulesep}{0pt}
  \setlength{\belowrulesep}{0pt}
  \renewcommand{\arraystretch}{1.925}%
  \setlength{\extrarowheight}{-1.25pt} % 额外行高
  \vspace{-\abovecaptionskip+0.167pt}
  \def\kycaption{#1}%
  \def\kylabel{#2}%
  \let\old@LT@output\LT@output
  % 每次调用重置标记
  \global\@biaoge@firstpagetrue
  \def\LT@output{%
    \if@biaoge@firstpage
      \global\@biaoge@firstpagefalse % 首页输出后，标记为false
    \else
      \thispagestyle{xbpage}
    \fi
    \old@LT@output
  }%
  % 检测当前页面位置，决定是否应用特殊样式
  \@table@begin
  \begin{xltabular}{\textwidth}{*{#3}{#4}}
    \caption[\kycaption]{\kycaption\label{\kylabel}\vspace*{-18pt}} \\
    \toprule
    #5 \\
    \midrule
    \endfirsthead
    % 续表部分调整间距
    \multicolumn{#3}{c}{%
      续表~\ref{#2}~~#1\vspace*{-3.5pt} % 续表时caption后间距
    } \\
    \toprule
    #5 \\
    \midrule
    \endhead
    \bottomrule
    \endfoot
    \bottomrule
    \endlastfoot
    #6
  \end{xltabular}
  \let\LT@output\old@LT@output
  \vspace*{-17pt} % 表格后间距
  \xiaosi
  \setlength{\baselineskip}{23.086043pt}
}
\makeatother

%--- 手动列宽表格 ---% 
\newcolumntype{n}[1]{>{\centering\arraybackslash}m{#1}} % 固定列宽且居中
\makeatletter

\newif\if@sdbiaoge@firstpage

\newcommand{\sdbiaoge}[5]{%
  \tabsize
  \setlength{\aboverulesep}{0pt}
  \setlength{\belowrulesep}{0pt}
  \renewcommand{\arraystretch}{1.925}%
  \setlength{\extrarowheight}{-1.25pt} % 额外行高
  \vspace{-\abovecaptionskip+0.167pt}%
  \def\whcaption{#1}%
  \def\whlabel{#2}%
  \let\old@LT@output\LT@output
  % 重置
  \global\@sdbiaoge@firstpagetrue
  \def\LT@output{%
    \if@sdbiaoge@firstpage
      \global\@sdbiaoge@firstpagefalse % 首页输出后，标记为false
    \else
      \thispagestyle{xbpage}
    \fi
    \old@LT@output
  }%
  % 检测当前页面位置，决定是否应用特殊样式
  \@table@begin
  \begin{longtable}{#3}
    \caption[\whcaption]{\whcaption\label{\whlabel}\vspace*{-18pt}} \\
    \toprule
    #4 \\ % 表头
    \midrule
    \endfirsthead
    \wuhao\makebox[\textwidth][c]{续表~\ref{\whlabel}\hspace{1em}\whcaption\vspace*{-3.5pt} % 续表时caption后间距
    } \\
    \toprule
    #4 \\ % 续表表头
    \midrule
    \endhead
    \bottomrule
    \endfoot
    #5 % 表体
  \end{longtable}
  \let\LT@output\old@LT@output
  \vspace*{-17pt}%
  \xiaosi
  \setlength{\baselineskip}{23.086043pt}
}
\makeatother

% 当表格出现在页面顶部时，应用表格页面样式
\makeatletter
\newif\if@nextpage@special@table
\@nextpage@special@tablefalse
\AtBeginDocument{\global\@nextpage@special@tablefalse}
\def\@table@begin{%
  %\typeout{DEBUG [TABLE]: pagetotal=\the\pagetotal, topskip=\the\topskip}%
\begingroup
  \dimen0=\pagetotal
  \ifdim\dimen0>600pt
    \ifdim\dimen0<702pt
      \global\@nextpage@special@tabletrue
      %\typeout{*** [TABLE] Marking next page for special style ***}%
    \fi
  \fi
\endgroup

  \ifdim\pagetotal<0.1\topskip
    \thispagestyle{bgpage}%
    \typeout{*** [TABLE] \thepage Table at page top - style applied: \the\pagetotal<0.5\the\topskip***}%
  \else
    \typeout{*** [TABLE] \thepage Table NOT at page top - style NOT applied ***}%
  \fi
}
\AddToHook{shipout/background}{%
  \if@nextpage@special@table
    \thispagestyle{bgpage}%
    \typeout{*** [TABLE] Applying special style to marked page ***}%
    \global\@nextpage@special@tablefalse
  \fi
}
\let\oldbiaoge\biaoge
\let\oldsdbiaoge\sdbiaoge
\renewcommand{\biaoge}{%
  \@table@begin
  \oldbiaoge
}
\renewcommand{\sdbiaoge}{%
  \@table@begin
  \oldsdbiaoge
}
\makeatother

%------- 尾注 -------%
% 尾注每页重新计数用，https://cloud.tencent.com/developer/ask/sof/109005693
\RequirePackage{perpage}
\renewcommand{\footnoterule}{
  \vspace{1em} % 分割线前的垂直间距
  \hrule width 0.35\textwidth height 1pt % 设置分割线宽度和粗细
  \vspace{0.6em} % 分割线后的垂直间距
}

\xeCJKsetcharclass{`①}{`⑩}{1} % ①~⑩ Unicode字符支持

\newcommand{\quangeweishu}[1]{% 这个没用
    \kern0.0037em%
    \tikz[baseline=(char.base)]{
        \node[shape=circle, draw, inner sep=0.35pt, minimum size=0.965em, line width=0.03em] (char) {\songtiarabic{#1}};
    }%
    \kern0.0037em%
}

\newcommand{\quanshi}[2]{% For 10-19
    \kern0.04em%
    \tikz[baseline=(char.base)]{
        \node[shape=circle, draw, inner sep=0, minimum size=0.9em, line width=0.0333em] (char) {%
            \scalebox{0.95}[1]{\fontsize{0.82em}{0.82em}\selectfont\songtiarabic{#1\kern-0.12em#2}}};
    }%
    \kern0.04em%
}

\newcommand{\quanershi}[2]{% For 20-99
    \kern0.04em%
    \tikz[baseline=(char.base)]{
        \node[shape=circle, draw, inner sep=-0.75pt, minimum size=0.9em, line width=0.0333em] (char) {%
            \scalebox{0.85}[1]{\fontsize{0.82em}{0.82em}\songtiarabic{#1\kern-0.05em#2}}};
    }%
    \kern0.04em%
}

\newcommand{\quan}[2][0]{%
    \ifnum#1=0\relax% 只有一个参数(#2)
        \ifcase#2\relax
        \or \char"2460 % 1
        \or \char"2461 % 2
        \or \char"2462 % 3
        \or \char"2463 % 4
        \or \char"2464 % 5
        \or \char"2465 % 6
        \or \char"2466 % 7
        \or \char"2467 % 8
        \or \char"2468 % 9
        \fi
    \else% 有两个参数
        \ifnum#1=1\relax
          \ifnum#2>0\relax
            \quanshi{#1}{#2} % 11-19
        \else
            \char"2469 % 10
          \fi
        \else
          \quanershi{#1}{#2} % 20-99
        \fi
    \fi
}

% 脚注使用带圈数字
\newcommand*\quanctr[1]{%
  \ifnum\value{#1}<10\relax
    % 1-9 \quan{个位数}
    \protect\quan{\number\value{#1}}%
  \else\ifnum\value{#1}<20\relax
    % 10-19 \quan[1]{个位数}
    \protect\quan[1]{\number\numexpr\value{#1}-10\relax}%
  \else\ifnum\value{#1}<100\relax
    % 20-99 \quan[十位数]{个位数}
    \protect\quan[\number\numexpr\value{#1}/10\relax]{\number\numexpr\value{#1}-(\value{#1}/10)*10\relax}%
  \else
    % 100以上
    \number\Quan{\value{#1}}%
  \fi\fi\fi
}

\renewcommand*\thefootnote{\quanctr{footnote}}

%------- 代码 -------%
\RequirePackage{fancyvrb} % 用于verbatim的高级设置
\RequirePackage{fvextra} % 支持breaklines选项
\fvset{breaklines=true}
\RequirePackage{framed} % 用于添加边框

\RecustomVerbatimEnvironment{verbatim}{Verbatim}{frame = single, numbers=left, tabsize = 4, fontsize=\footnotesize, showspaces=false} % 调整字间距，加框

\let\oldverbatim\verbatim
\let\endoldverbatim\endverbatim

\RenewDocumentEnvironment{verbatim}{}{
  \oldverbatim
}{
  \endoldverbatim
  \vspace{-1em}
}

%------- 参考文献 -------%
\RequirePackage[
    backend = biber,
    % 尽管Word模板里说的是2005，但实际采用的是2015
    style = gb7714-2025,
    % 按出现顺序编号
    sorting = none,
    % uppercase则人名全大写；lowercase则仅首字母大写
    gbnamefmt = lowercase,
    % 当false时，会放弃国标的要求，不使用"佚名""Anon""出版地不详"等补充信息，同时会导致连续出版物的格式受到影响
    gbpub = true,
    % 中文文献用全角，英文文献用半角，是2025版本的新功能，目前存在bug
    gbpunctwidth = bylan,
    % 显示链接
    url = true,
    % 显示DOI号
    doi = true    
    % url和DOI号建议保留，因为网络文献需要列出，建议在bib文件中手动删去url和DOI号
]{biblatex}%
\makeatother
\addbibresource{ref/ref.bib} % bib文件名
\AtBeginBibliography{%
\setlength{\baselineskip}{23.086043pt}%
}
\setlength{\bibitemsep}{0pt}
\setlength{\biblabelsep}{7.4mm}
% \DeclareFieldFormat[article]{journaltitle}{\mkbibemph{#1}} % 期刊名斜体，可选启用
% \DeclareFieldFormat[article]{volume}{\mkbibemph{#1}} % 卷数斜体，可选启用
% \DeclareFieldFormat{date}{\textbf{#1}} % 年份斜体，可选启用
\DeclareCiteCommand{\citenum} % 自订“裸数字”命令
  {\usebibmacro{prenote}}
  {\printtext[bibhyperref]{\printfield{labelnumber}}} % 仅输出序号并带链接
  {\multicitedelim}
  {\usebibmacro{postnote}}
\setcounter{gbrefcompress}{3} % 连续3篇文献才开始压缩
\def\gbpunctcommacite{\addcomma} % 修改宏包，使引用时用半角逗号
% 修改全角括号为半角括号
\def\gbpunctprl{(}%
\def\gbpunctprr{)}%
\def\CharParenLeft{\iffieldequalstr{userd}{chinese}{(}{(}}
\def\CharParenRight{\iffieldequalstr{userd}{chinese}{)}{)}}%
% 以下五行代码解决了gbpunctwidth=bylan的bug，文献标题后的标点问题
% 参考Hu Zhenzhen，20180405，为texlive2017以上版本中的beamer兼容性做的处理
% \DeclareFieldFormat{title}{#1}%
% \DeclareFieldFormat[article,patent,thesis,unpublished]{title}{#1}
% \makeatletter
% \AtBeginDocument{\patchcmd{\abx@macro@title}{\newunitpunct}{}{}{}}{}
% \makeatother
% 下面这行代码解决了连续出版物标识符[J]后多一个空格的bug
\def\gbpunctdot{\unskip\mbox{．}\allowbreak}
% 以上问题及解决办法已反馈至GibHub官方仓库，注释掉则代表已经被官方采纳

% ------- 附录1 -------%
%--- 标题 ---%
\newcommand{\ftitle}[1]{%
  \begin{center}%
    \heiti\xiaoer #1
  \end{center}%
}

\newcommand{\fauthor}[1]{%
  \begin{center}%
    \parbox{\textwidth}{%
      \centering
      \songti\xiaosi
      \setlength{\baselineskip}{23.086043pt}%
      \selectfont
      #1
    }%
  \end{center}%
}

\newcommand{\thanksA}[1]{\textsuperscript{\hyperlink{affil:#1}{#1}}}
\newcommand{\thanksB}[1]{\noindent\hypertarget{affil:#1}{\textnormal{#1}}}

\newcommand{\corrauth}{\textsuperscript{\hyperlink{corrmark}{*}}}
\newcommand{\corrinfo}[1]{\noindent\hypertarget{corrmark}{\textsuperscript{*}通讯作者：#1}}

% ------- 计数器定义 -------%
\newcounter{fchapter}
\renewcommand{\thefchapter}{\arabic{fchapter}}
\newcounter{fsection}[fchapter]
\renewcommand{\thefsection}{\thefchapter.\arabic{fsection}}
\newcounter{fsubsection}[fsection]
\renewcommand{\thefsubsection}{\thefsection.\arabic{fsubsection}}
\newcounter{fsubsubsection}[fsubsection]
\renewcommand{\thefsubsubsection}{\thefsubsection.\arabic{fsubsubsection}}


% \fchapter定义
\newcommand{\fchapter}[1]{%
  \refstepcounter{fchapter}%
  \chapter*{\thefchapter\,\,\,#1}%
}

\makeatletter

% \fsection定义
\newcommand{\fsection}[1]{
  \refstepcounter{fsection}
  \section*{\thefsection\,\,\,#1}
}

% \fsubsection定义
\newcommand{\fsubsection}[1]{
  \refstepcounter{fsubsection}
  \ifdim\pagetotal>600pt
    \ifdim\pagetotal<702pt
      \global\@nextpage@special@subsectiontrue
    \fi
  \fi
  \ifdim\pagetotal<0.1\topskip
    \thispagestyle{subsecpage}%
  \fi
  \oldsubsection*{\thefsubsection\,\,\,#1}
}

% \fsubsubsection定义
\newcommand{\fsubsubsection}[1]{
  \refstepcounter{fsubsubsection}
  \ifdim\pagetotal>600pt
    \ifdim\pagetotal<702pt
      \global\@nextpage@specialtrue
    \fi
  \fi
  \ifdim\pagetotal<0.1\topskip
    \thispagestyle{subsubsecpage}%
  \fi
  \oldsubsubsection*{\thefsubsubsection\,\,\,#1}
}

\makeatother

% ------- fequation编号定义 -------
\newcounter{fequation}[fchapter] % 每章重置
\renewcommand{\thefequation}{\thefchapter.\arabic{fequation}}

% ------- fequation环境 -------%
\newenvironment{fequation}{
  \refstepcounter{fequation}%
  \renewcommand{\theequation}{\thefequation}%
  \begin{equation}
}{
  \end{equation}
}

% ------- falign环境 -------%
\let\oldalign\align
\let\endoldalign\endalign
\newenvironment{falign}
  {\refstepcounter{fequation}%
   \renewcommand{\theequation}{\thefequation}%
   \oldalign}
  {\endoldalign}

% ------- ffigure计数器和编号格式 -------
\newcounter{ffigure}[fchapter]
\renewcommand{\theffigure}{\thefchapter.\arabic{ffigure}}

% ------- ffigure环境定义 -------
\newenvironment{ffigure}{
  \refstepcounter{ffigure}%
  \renewcommand{\thefigure}{\theffigure}%
  \begin{figure}
}{
  \end{figure}
}

% ------- fbiaoge计数器和编号格式 -------
\newcounter{fbiaoge}[fchapter]
\renewcommand{\thefbiaoge}{\thefchapter.\arabic{fbiaoge}}

% ------- fbiaoge定义 -------
\newenvironment{fbiaoge}{
  \refstepcounter{fbiaoge}%
  \renewcommand{\thetable}{\thefbiaoge}%
  \biaoge
}{
}

% ------- fsdbiaoge环境定义 -------
\newenvironment{fsdbiaoge}[5]{%
  \refstepcounter{fbiaoge}%
  \renewcommand{\thetable}{\thefbiaoge}%
  \sdbiaoge{#1}{#2}{#3}{#4}{#5}%
}{%
}

%------- 附录2 -------%
\RequirePackage{tocloft}
\makeatletter
\newcommand{\appendixtwo}{%
\chapter*{附录2：外文原文}\label{app2}%
\thispagestyle{app2}%

\ifx\@tocchaptertitletimes\@true
    \addtocontents{toc}{\vspace{1.755em}}%
    \addtocontents{toc}{%
    \protect\noindent
    \protect\hyperref[app2]{\sihao\heiti 附录\timesrm{2}：外文原文}%
    \protect\par
  }%
  \else
    \addtocontents{toc}{\vspace{1.755em}}%
    \addtocontents{toc}{%
    \protect\noindent
    \protect\hyperref[app2]{\sihao\heiti 附录{\heitiarabic{2}}：外文原文}%
    \protect\par
  }%
  \fi
}
\makeatother
%------- 致谢 -------%
\newcommand{\ack}{%
\chapter*{致\hspace{2em}谢}\label{ack}%
\thispagestyle{ack}
\addtocontents{toc}{\vspace*{1.755em}}%
\addtocontents{toc}{\hyperref[ack]{\noindent\heiti\sihao\hspace*{-1.05mm} 致谢}}%
}

%------- hyperref最后调用 -------%
\RequirePackage[draft=false,colorlinks=true,CJKbookmarks=true,linkcolor=black,citecolor=black,urlcolor=black,hyperindex,linktoc=all]{hyperref} % 引用链接颜色设置
