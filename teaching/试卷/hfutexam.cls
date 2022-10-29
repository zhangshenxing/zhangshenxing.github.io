% 文件 `hfutexam.cls'
% !TEX TS-program = xelatex
% !TEX encoding = UTF-8 Unicode
% 合肥工业大学试卷模板
% 作者: 张神星
% 使用前请先安装字体: 方正小标宋、方正仿宋, 否则请使用选项 nofangzheng (采用新宋体和仿宋代替)
% 编译模式： XeLaTeX
% 你可以任意修改或再次分发该文件
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hfutexam}[2022/10/26 v1.0 HFUTExam document class by Zhang Shenxing]
% 文档选项 shijuan, datizhi, cankaodaan, simple
\newif\ifHFUT@ShiJuan\HFUT@ShiJuantrue
\newif\ifHFUT@DaTiZhi\HFUT@DaTiZhifalse
\newif\ifHFUT@CanKaoDaAn\HFUT@CanKaoDaAnfalse
\newif\ifHFUT@Simple\HFUT@Simplefalse
\DeclareOption{datizhi}{\HFUT@ShiJuanfalse\HFUT@DaTiZhitrue}
\DeclareOption{cankaodaan}{\HFUT@ShiJuanfalse\HFUT@CanKaoDaAntrue}
\DeclareOption{simple}{\HFUT@ShiJuanfalse\HFUT@Simpletrue}
% 文档选项 nofangzheng
\newif\ifHFUT@Fandol\HFUT@Fandoltrue
\DeclareOption{nofangzheng}{\HFUT@Fandolfalse}
% 基于 ctexart 文档类
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessOptions\relax
\ifHFUT@Simple\else\PassOptionsToClass{twocolumn}{ctexart}\fi
\ProcessOptions\relax
\LoadClass[12pt,oneside]{ctexart}
% 页面设置
\RequirePackage{amsmath,amssymb,amsthm}
\RequirePackage{graphicx}
\RequirePackage{enumitem}
\RequirePackage{geometry}
\ifHFUT@Simple
	\geometry{a4paper,scale=0.8}
\else
	\geometry{
		paperheight=29.7cm,
		paperwidth=42cm,
		left=3.17cm,
		right=3.17cm,
		voffset=2.2cm,
		headheight=77pt,
		headsep=12pt,
		footskip=1cm
	}
\fi
% 试卷信息
\newcommand{\BiaoTi}[1]{\gdef\HFUT@BiaoTi{#1}}
\newcommand{\XueNian}[2]{\gdef\HFUT@XueNians{#1}\gdef\HFUT@XueNiane{#2}}
\newcommand{\XueQi}[1]{\gdef\HFUT@XueQi{#1}}
\newcommand{\KeChengDaiMa}[1]{\gdef\HFUT@KeChengDaiMa{#1}}
\newcommand{\KeChengMingCheng}[1]{\gdef\HFUT@KeChengMingCheng{#1}}
\newcommand{\XueFen}[1]{\gdef\HFUT@XueFen{#1}}
\newcommand{\KeChengXingZhi}[1]{\gdef\HFUT@KeChengXingZhi{#1}}
\newcommand{\KaoShiXingShi}[1]{\gdef\HFUT@KaoShiXingShi{#1}}
\newcommand{\ZhuanYeBanJi}[1]{\gdef\HFUT@ZhuanYeBanJi{#1}}
\newcommand{\KaoShiRiQi}[1]{\gdef\HFUT@KaoShiRiQi{#1}}
\newcommand{\MingTiJiaoShi}[1]{\gdef\HFUT@MingTiJiaoShi{#1}}
\newcommand{\XiZhuRenQianMing}[1]{\gdef\HFUT@XiZhuRenQianMing{#1}}
\BiaoTi{}
\XueNian{}{}
\XueQi{}
\KeChengDaiMa{}
\KeChengMingCheng{}
\XueFen{}
\KeChengXingZhi{}
\KaoShiXingShi{}
\ZhuanYeBanJi{}
\KaoShiRiQi{}
\MingTiJiaoShi{}
\XiZhuRenQianMing{example-sign.png}
% 粗字体设定
\newfontfamily\timesnewroman[AutoFakeBold={1.5}]{Times New Roman} % 粗罗马
\ifHFUT@Fandol
	\setCJKfamilyfont{titlesongti}[AutoFakeBold={1.5}]{FZXiaoBiaoSong-B05S} % 粗方正小标宋
	\newfontfamily\entitlesongti[AutoFakeBold={1.5}]{FZXiaoBiaoSong-B05S}
	\setCJKfamilyfont{titlefangsong}[AutoFakeBold={1.5}]{FZFangSong-Z02S} % 粗方正仿宋
	\newfontfamily\entitlefangsong[AutoFakeBold={1.5}]{FZFangSong-Z02S}
\else
	\setCJKfamilyfont{titlesongti}[AutoFakeBold={4}]{NSimSun} % 粗新宋体
	\newfontfamily\entitlesongti[AutoFakeBold={4}]{NSimSun}
	\setCJKfamilyfont{titlefangsong}[AutoFakeBold={1.5}]{FangSong} % 粗仿宋
	\newfontfamily\entitlefangsong[AutoFakeBold={1.5}]{FangSong}
\fi
\newcommand{\titlesongti}{\entitlesongti\CJKfamily{titlesongti}}
\newcommand{\titlefangsong}{\entitlefangsong\CJKfamily{titlefangsong}}
\setCJKfamilyfont{xinsongti}[AutoFakeBold={1.5}]{NSimSun} % 粗新宋体
\newfontfamily\enxinsongti[AutoFakeBold={1.5}]{NSimSun}
\newcommand{\xinsongti}{\enxinsongti\CJKfamily{xinsongti}}
\setCJKfamilyfont{cusongti}[AutoFakeBold={1.5}]{SimSun} % 粗宋体
\newcommand{\cusongti}{\CJKfamily{cusongti}}
% 重新设定字体大小
\renewcommand{\LARGE}{\fontsize{21}{21}}
\renewcommand{\large}{\fontsize{14}{14}}
\renewcommand{\normalsize}{\fontsize{12}{12}}
\renewcommand{\small}{\fontsize{10.5}{10.5}}
% 缩进
\setlength{\parindent}{0em}
\renewcommand{\indent}{\hspace*{2em}}
% 分栏
\setlength\columnsep{0.8cm} % 分栏间距
\columnseprule=0.5pt % 分栏线宽度
% 页眉页脚
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{etoolbox}
\renewcommand\headrulewidth{0.5pt} % 页眉线宽度
\renewcommand\footrulewidth{0.5pt} % 页脚线宽度
\pagestyle{fancy}
\fancyhf{}
\newcommand{\boxyes}{{\raisebox{-0.5mm}{\LARGE$\checkmark\hspace{-1.2em}\square$}}}
\newcommand{\boxno}{{\raisebox{-0.5mm}{\LARGE$\square$}}}
\RequirePackage[normalem]{ulem}
\newcommand{\fillblank}[3]{\uline{\makebox[#1]{\vphantom{\rule{0pt}{#2}}#3}}}
\newcommand{\filltitle}[2]{\uline{\makebox[#1]{#2}}}
\newlength{\ltitle}
\settowidth{\ltitle}{\HFUT@BiaoTi}
\ifHFUT@ShiJuan%试卷页眉页脚
	\fancyhead[C]{%
		\hfill\bfseries\LARGE\titlesongti\ifdimcomp\ltitle>{0.5\linewidth}{\HFUT@BiaoTi}{\makebox[0.5\linewidth][s]{\HFUT@BiaoTi}}\hfill%
		\large\cusongti 共\filltitle{1.5em}{\timesnewroman\pageref{LastPage}}页第\filltitle{1.5em}{\timesnewroman\thepage}页\\\vspace{5pt}%
		\timesnewroman\HFUT@XueNians\titlefangsong～\timesnewroman\HFUT@XueNiane\titlefangsong 学年第\filltitle{2em}{\HFUT@XueQi}学期\hfill%
		课程代码\filltitle{5em}{\HFUT@KeChengDaiMa}\hfill%
		课程名称\filltitle{12em}{\HFUT@KeChengMingCheng}\hfill%
		学分\filltitle{2.5em}{\HFUT@XueFen}\hfill%
		课程性质: 必修\ifdefstring{\HFUT@KeChengXingZhi}{必修}{\boxyes}{\boxno}%
             选修\ifdefstring{\HFUT@KeChengXingZhi}{选修}{\boxyes}{\boxno}%
             限修\ifdefstring{\HFUT@KeChengXingZhi}{限修}{\boxyes}{\boxno}\hfill%
		考试形式: 开卷\ifdefstring{\HFUT@KaoShiXingShi}{开卷}{\boxyes}{\boxno}%
             闭卷\ifdefstring{\HFUT@KaoShiXingShi}{闭卷}{\boxyes}{\boxno}\\\vspace{2pt}%
		专业班级（教学班）\filltitle{11em}{\HFUT@ZhuanYeBanJi}\hfill%
		考试日期\filltitle{16em}{\HFUT@KaoShiRiQi}\hfill%
		命题教师\fillblank{5.5em}{0.6cm}{\HFUT@MingTiJiaoShi}\hfill%
		系（所或教研室）主任审批签名%
		\begin{tikzpicture}[overlay,xshift=3.25em,yshift=0.15cm]%
			\node at (0,0) {\includegraphics[height=0.9cm]{\HFUT@XiZhuRenQianMing}};%
		\end{tikzpicture}%
		\filltitle{6.5em}{}\vspace{4pt}%
	}
	\fancyfoot[C]{\small\vspace{0.5\baselineskip}命题教师注意事项:
		1. 主考教师必须于考试一周前将“试卷A”、“试卷B”经教研室主任审批签字后送教务科印刷。\hspace{1em}%
		2. 请命题教师用黑色水笔工整地书写题目或用A4纸横式打印贴在试卷版芯中。
	}
\fi
\ifHFUT@DaTiZhi%答题纸页眉页脚
	\fancyhead[C]{%
		\bfseries\LARGE\xinsongti\scalebox{2.0}[1.0]{%
			\ifdimcomp\ltitle>{0.35\linewidth}{\HFUT@BiaoTi}{\makebox[0.35\linewidth][s]{\HFUT@BiaoTi}}%
		}\\\vspace{8pt}%
		\large\timesnewroman\HFUT@XueNians\titlefangsong～\timesnewroman\HFUT@XueNiane\titlefangsong 学年第\filltitle{2em}{\HFUT@XueQi}学期\hfill%
		课程代码\filltitle{6.5em}{\HFUT@KeChengDaiMa}\hfill%
		课程名称\filltitle{13em}{\HFUT@KeChengMingCheng}\hfill%
		命题教师\filltitle{7em}{\HFUT@MingTiJiaoShi}\hfill%
		系主任审批%
		\begin{tikzpicture}[overlay,xshift=3.5em,yshift=0.2cm]%
			\node at (0,0) {\includegraphics[height=0.9cm]{\HFUT@XiZhuRenQianMing}};%
		\end{tikzpicture}%
		\filltitle{7em}{}\\\vspace{2pt}%
		教学班级\filltitle{10.5em}{}\hfill%
		学生姓名\fillblank{8em}{0.6cm}{}\hfill%
		学号\filltitle{8em}{}\hfill%
		考试日期\filltitle{16em}{\HFUT@KaoShiRiQi}\hfill%
		成绩\filltitle{6.3em}{}\vspace{4pt}%
	}
	\fancyfoot[C]{\small\vspace{0.5\baselineskip}
		第 \timesnewroman\thepage 页~共 \timesnewroman\pageref{LastPage} 页
	}
\fi
\ifHFUT@CanKaoDaAn%参考答案页眉页脚
	\fancyhead[C]{%
		\bfseries\LARGE\titlesongti\ifdimcomp\ltitle>{0.6\linewidth}{\HFUT@BiaoTi}{\makebox[0.6\linewidth][s]{\HFUT@BiaoTi}}\\\vspace{5pt}%
		\large\timesnewroman\HFUT@XueNians\titlefangsong～\timesnewroman\HFUT@XueNiane\titlefangsong 学年第\filltitle{2em}{\HFUT@XueQi}学期\hfill%
		课程代码\filltitle{6.5em}{\HFUT@KeChengDaiMa}\hfill%
		课程名称\filltitle{13em}{\HFUT@KeChengMingCheng}\hfill%
		命题教师\filltitle{7em}{\HFUT@MingTiJiaoShi}\hfill%
		系主任审批%
		\begin{tikzpicture}[overlay,xshift=3.5em,yshift=0.2cm]%
			\node at (0,0) {\includegraphics[height=0.9cm]{\HFUT@XiZhuRenQianMing}};%
		\end{tikzpicture}%
		\filltitle{7em}{}\\\vspace{2pt}%
		教学班级\filltitle{10.5em}{}\hfill%
		学生姓名\fillblank{8em}{0.6cm}{}\hfill%
		学号\filltitle{8em}{}\hfill%
		考试日期\filltitle{16em}{\HFUT@KaoShiRiQi}\hfill%
		成绩\filltitle{6.3em}{}\vspace{4pt}%
	}
	\fancyfoot[C]{\small\vspace{0.5\baselineskip}
		第 \timesnewroman\thepage 页~共 \timesnewroman\pageref{LastPage} 页
	}
\fi
\ifHFUT@Simple%简单模式页眉页脚
	\renewcommand\headrulewidth{0pt}
	\renewcommand\footrulewidth{0pt}
	\renewcommand{\maketitle}{%
		\begin{center}
		\bfseries\LARGE\titlesongti%
		\ifdimcomp\ltitle>{0.9\linewidth}{\HFUT@BiaoTi}{\makebox[0.9\linewidth][s]{\HFUT@BiaoTi}}\\%
		\makebox[0.75\linewidth]{\large\timesnewroman\HFUT@XueNians\titlefangsong～\timesnewroman\HFUT@XueNiane\titlefangsong 学年%
			第\filltitle{2em}{\HFUT@XueQi}学期\hfill\HFUT@KeChengMingCheng(\HFUT@KeChengDaiMa)}
		\end{center}
	}
	\fancyfoot[C]{\small\vspace{0.5\baselineskip}
		第 \timesnewroman\thepage 页~共 \timesnewroman\pageref{LastPage} 页
	}
\fi
% 题号加粗
\renewcommand{\labelenumi}{{\bfseries \theenumi.}}
% 题干
\newcommand\tigan[1]{{\large\textbf{#1}}}
% 打分栏
\RequirePackage{tikz}
\usetikzlibrary{overlay-beamer-styles}
\newcommand\scorebox{%
	\vspace{0.5\baselineskip}%
	\begin{tikzpicture}[overlay,xshift=13.4cm,yshift=-1.6cm]%
		\draw (0,0) rectangle (4,2);%
		\draw (2,0)--(2,2);%
		\draw (0,1)--(4,1);%
		\draw (1,1.5) node {\textbf{\normalsize 得分}};%
		\draw (3,1.5) node {\textbf{\normalsize 阅卷人}};%
	\end{tikzpicture}%
}
% 答题纸提示信息
\newcommand\notice{%
	\textbf{\small 考生注意事项：\\%
	\indent 1. 本试卷分试题与答卷两部分；\\%
	\indent 2. 所有试题的解答（包括选择、填空）必须写在专用答卷纸上，在试题上直接作答一律无效；\\%
	\indent 3. 考试结束后，必须将试题、答卷整理上交，不得将试题带离考场；\\%
	\indent 4. 考生务必认真填写班级、姓名、学号等信息。}\par%
	{\leavevmode\xleaders\hbox{\rule[4pt]{8pt}{0.5pt}\,}\hfill\null}%
}
% 选择题, 根据选项内容长度自动排版
\newlength{\lxxa}
\newlength{\lxxb}
\newlength{\lxxc}
\newlength{\lxxd}
\newlength{\lquar}
\newlength{\lhalf}
\newlength{\lfull}
\newcounter{lxxtype}
\NewDocumentCommand\xx{O{0} m m m m}{%
	\setlength{\lquar}{0.23\columnwidth}%
	\setlength{\lhalf}{0.46\columnwidth}%
	\setlength{\lfull}{0.92\columnwidth}%
	\setcounter{lxxtype}{0}%
	\ifnum#1=1\setcounter{lxxtype}{1}\fi%
	\ifnum#1=2\setcounter{lxxtype}{2}\fi%
	\ifnum#1=4\setcounter{lxxtype}{4}\fi%
	\ifnum\value{lxxtype}=0%
		\settowidth{\lxxa}{A.~#2~~}%
		\settowidth{\lxxb}{B.~#3~~}%
		\settowidth{\lxxc}{C.~#4~~}%
		\settowidth{\lxxd}{D.~#5~~}%
		\setcounter{lxxtype}{4}%
		\ifdimcomp\lxxa>\lquar{\setcounter{lxxtype}{2}}{}%
		\ifdimcomp\lxxb>\lquar{\setcounter{lxxtype}{2}}{}%
		\ifdimcomp\lxxc>\lquar{\setcounter{lxxtype}{2}}{}%
		\ifdimcomp\lxxd>\lquar{\setcounter{lxxtype}{2}}{}%
		\ifnum\value{lxxtype}=2%
			\ifdimcomp\lxxa>\lhalf{\setcounter{lxxtype}{1}}{}%
			\ifdimcomp\lxxb>\lhalf{\setcounter{lxxtype}{1}}{}%
			\ifdimcomp\lxxc>\lhalf{\setcounter{lxxtype}{1}}{}%
			\ifdimcomp\lxxd>\lhalf{\setcounter{lxxtype}{1}}{}%
		\fi%
	\fi%
	\ifnum\value{lxxtype}=1%
		\\\makebox[\lfull][l]{A.~#2}%
		\\\makebox[\lfull][l]{B.~#3}%
		\\\makebox[\lfull][l]{C.~#4}%
		\\\makebox[\lfull][l]{D.~#5}%
	\fi%
	\ifnum\value{lxxtype}=2%
		\\\makebox[\lhalf][l]{A.~#2}%
			\makebox[\lhalf][l]{B.~#3}%
		\\\makebox[\lhalf][l]{C.~#4}%
			\makebox[\lhalf][l]{D.~#5}%
	\fi%
	\ifnum\value{lxxtype}=4%
		\\\makebox[\lquar][l]{A.~#2}% 
			\makebox[\lquar][l]{B.~#3}%
			\makebox[\lquar][l]{C.~#4}%
			\makebox[\lquar][l]{D.~#5}%
	\fi%
}
% 选择题答题框
\newcommand\xuanzeti[2]{%
	\begin{tikzpicture}%
		\draw (0,0) rectangle (1.8,2);%
		\draw (0,1)--(1.8,1);%
		\draw (0.9,0.5) node {#2} (0.9,1.5) node {\textbf{#1}};%
	\end{tikzpicture}%
}
% 得分点命令
\NewDocumentCommand\Score{O{4cm} m}{%
  \relax\ifmmode%
  	\hfill\makebox[#1]{\leavevmode\xleaders\hbox{$\cdot$\hspace{3pt}}\hfill\null}\text{#2}%
	\else%
		~~~\leavevmode\xleaders\hbox{$\cdot$\hspace{3pt}}\hfill\null#2%
  \fi%
}
\NewDocumentCommand\sscore{O{2cm} m}{\Score[#1]{(#2分)}}
\NewDocumentCommand\score{O{4cm} m}{\Score[#1]{(#2分)}}
\NewDocumentCommand\lscore{O{8cm} m}{\Score[#1]{(#2分)}}
\NewDocumentCommand\Lscore{O{12cm} m}{\Score[#1]{(#2分)}}
\renewcommand\le{\leqslant}
\renewcommand\ge{\geqslant}


