% 文件 `hfutexam.cls'
% !TEX TS-program = xelatex
% !TEX encoding = UTF-8 Unicode
% 合肥工业大学试卷模板
% 作者: 张神星
% 使用前请先安装字体: 方正小标宋、方正仿宋
% 编译模式： XeLaTeX
% 你可以任意修改或再次分发该文件
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hfutexam}[2022/10/15 v1.0 HFUTExam document class by Zhang Shenxing]
% 文档选项 shijuan, datizhi
\newif\ifExam\Examtrue
\DeclareOption{datizhi}{\Examfalse}
\newif\ifFandol\Fandoltrue
\DeclareOption{nofangzheng}{\Fandolfalse}
% 基于 ctexart 文档类
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessOptions\relax
\LoadClass[12pt,twocolumn,oneside]{ctexart}
% 页面设置
\RequirePackage{amsmath,amssymb,amsthm}
\RequirePackage{graphicx}
\RequirePackage{enumitem}
\RequirePackage{geometry}
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
% 试卷信息
\newcommand{\ABJuan}[1]{\gdef\@ABJuan{#1}}
\newcommand{\XueNian}[2]{\gdef\@XueNians{#1}\gdef\@XueNiane{#2}}
\newcommand{\XueQi}[1]{\gdef\@XueQi{#1}}
\newcommand{\KeChengDaiMa}[1]{\gdef\@KeChengDaiMa{#1}}
\newcommand{\KeChengMingCheng}[1]{\gdef\@KeChengMingCheng{#1}}
\newcommand{\XueFen}[1]{\gdef\@XueFen{#1}}
\newcommand{\KeChengXingZhi}[1]{\gdef\@KeChengXingZhi{#1}}
\newcommand{\KaoShiXingShi}[1]{\gdef\@KaoShiXingShi{#1}}
\newcommand{\ZhuanYeBanJi}[1]{\gdef\@ZhuanYeBanJi{#1}}
\newcommand{\KaoShiRiQi}[1]{\gdef\@KaoShiRiQi{#1}}
\newcommand{\MingTiJiaoShi}[1]{\gdef\@MingTiJiaoShi{#1}}
\newcommand{\XiZhuRenQianMing}[1]{\gdef\@XiZhuRenQianMing{#1}}
\ABJuan{}
\XueNian{}{}
\XueQi{}
\KeChengDaiMa{}
\KeChengMingCheng{}
\XueFen{}
\KeChengXingZhi{必修}
\KaoShiXingShi{闭卷}
\ZhuanYeBanJi{}
\KaoShiRiQi{}
\MingTiJiaoShi{集体}
\XiZhuRenQianMing{example-sign.png}
% 粗字体设定
\newfontfamily\timesnewroman[AutoFakeBold={1.5}]{Times New Roman} % 粗罗马
\ifFandol
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
\newcommand{\fillblank}[2]{\underline{\makebox[#1]{#2}}}
\ifExam
	\fancyhead[C]{\hfill\bfseries%
		\LARGE\titlesongti 合\hspace{2em}肥\hspace{2em}工\hspace{2em}业\hspace{2em}大\hspace{2em}学\hspace{2em}试\hspace{2em}卷%
			\hspace{2em}（\@ABJuan）\hfill%
		\large\cusongti 共\fillblank{1.5em}{\timesnewroman\pageref{LastPage}}页第\fillblank{1.5em}{\timesnewroman\thepage}页 \vspace{5pt}\\ %
		\timesnewroman\@XueNians\titlefangsong～\timesnewroman\@XueNiane\titlefangsong 学年第\fillblank{2em}{\@XueQi}学期\hfill%
		课程代码\fillblank{5em}{\@KeChengDaiMa}\hfill%
		课程名称\fillblank{12em}{\@KeChengMingCheng}\hfill%
		学分\fillblank{2.5em}{\@XueFen}\hfill%
		课程性质: 必修\ifdefstring{\@KeChengXingZhi}{必修}{\boxyes}{\boxno}%
             选修\ifdefstring{\@KeChengXingZhi}{选修}{\boxyes}{\boxno}%
             限修\ifdefstring{\@KeChengXingZhi}{限修}{\boxyes}{\boxno}\hfill%
		考试形式: 开卷\ifdefstring{\@KaoShiXingShi}{开卷}{\boxyes}{\boxno}%
             闭卷\ifdefstring{\@KaoShiXingShi}{闭卷}{\boxyes}{\boxno}\vspace{2pt}\\ %
		专业班级（教学班）\fillblank{11em}{\@ZhuanYeBanJi}\hfill%
		考试日期\fillblank{16em}{\@KaoShiRiQi}\hfill%
		命题教师\fillblank{5.5em}{\@MingTiJiaoShi}\hfill%
		系（所或教研室）主任审批签名\fillblank{6.5em}{\includegraphics[height=0.7cm]{\@XiZhuRenQianMing}} \vspace{4pt}%
	}
	\fancyfoot[C]{\small\vspace{0.5\baselineskip}命题教师注意事项:
		1. 主考教师必须于考试一周前将“试卷A”、“试卷B”经教研室主任审批签字后送教务科印刷。\hspace{1em}%
		2. 请命题教师用黑色水笔工整地书写题目或用A4纸横式打印贴在试卷版芯中。
	}
\else
	\fancyhead[C]{\hfill\bfseries%
		\LARGE\xinsongti\scalebox{2.0}[1.0]{合肥工业大学考试专用答卷纸（\xinsongti\@ABJuan）}\hfill \vspace{8pt}\\ \hfill%
		\large\timesnewroman\@XueNians\titlefangsong～\timesnewroman\@XueNiane\titlefangsong 学年第\fillblank{2em}{\@XueQi}学期\hfill%
		课程代码\fillblank{6.5em}{\@KeChengDaiMa}\hfill%
		课程名称\fillblank{13em}{\@KeChengMingCheng}\hfill%
		命题教师\fillblank{7em}{\@MingTiJiaoShi}\hfill%
		系主任审批\fillblank{7em}{\includegraphics[height=0.7cm]{\@XiZhuRenQianMing}}\hfill\vspace{2pt}\\\hfill%
		教学班级\fillblank{10.5em}{}\hfill%
		学生姓名\fillblank{8em}{}\hfill%
		学号\fillblank{8em}{}\hfill%
		考试日期\fillblank{16em}{\@KaoShiRiQi}\hfill%
		成绩\fillblank{6.3em}{}\hfill\vspace{4pt}%
	}
	\fancyfoot[C]{\small\vspace{0.5\baselineskip}
		第 \timesnewroman\thepage 页~共 \timesnewroman\pageref{LastPage} 页
	}
\fi

% 题号
\renewcommand{\labelenumi}{{\bfseries \theenumi.}}
% 标题
\newcommand\tigan[1]{{\large\textbf{#1}}}
% 选择题
\newcommand{\yihang}[4]{\\
\makebox[92pt][l]{A. #1} \hfill
\makebox[92pt][l]{B. #2} \hfill
\makebox[92pt][l]{C. #3} \hfill
\makebox[92pt][l]{D. #4}}
\newcommand{\erhang}[4]{\\
\makebox[110pt][l]{A. #1} \hfill\makebox[220pt][l]{B. #2}\\
\makebox[110pt][l]{C. #3} \hfill\makebox[220pt][l]{D. #4}}
\newcommand{\sihang}[4]{\\
\makebox[262pt][l]{A. #1}\\
\makebox[262pt][l]{B. #2}\\
\makebox[262pt][l]{C. #3}\\
\makebox[262pt][l]{D. #4}}
% 打分栏
\RequirePackage{tikz}
\usetikzlibrary{overlay-beamer-styles}
\newcommand\scorebox{
\begin{tikzpicture}[overlay,xshift=13.4cm,yshift=-1.6cm]
\draw (0,0) rectangle (4,2);
\draw (2,0)--(2,2);
\draw (0,1)--(4,1);
\draw
	(1,1.5) node {\textbf{\normalsize 得分}}
	(3,1.5) node {\textbf{\normalsize 阅卷人}};
\end{tikzpicture}}
% 答题纸提示信息
\newcommand\notice{
\textbf{\small 考生注意事项：\\
\indent 1. 本试卷分试题与答卷两部分；\\
\indent 2. 所有试题的解答（包括选择、填空）必须写在专用答卷纸上，在试题上直接作答一律无效；\\
\indent 3. 考试结束后，必须将试题、答卷整理上交，不得将试题带离考场；\\
\indent 4. 考生务必认真填写班级、姓名、学号等信息。}\par\vspace{-8pt}
{\leavevmode\xleaders\hbox{\rule{8pt}{0.5pt}\,}\hfill\null}\par}
\newcommand\xuanzeti[2]{\begin{tikzpicture}
\draw (0,0) rectangle (1.8,2);
\draw (0,1)--(1.8,1);
\draw (0.9,0.5) node {#2} (0.9,1.5) node {\textbf{#1}};
\end{tikzpicture}}
\newcommand\dotsep{\hspace{3pt}}
\newcommand\dotseps{.\dotsep.\dotsep.\dotsep.\dotsep.\dotsep.\dotsep.\dotsep.\dotsep.\dotsep}
\newcommand\sscore[1]{\hfill\text{\dotseps(#1分)}}
\newcommand\score[1]{\hfill\text{\dotseps\dotseps(#1分)}}
\newcommand\lscore[1]{\hfill\text{\dotseps\dotseps\dotseps\dotseps(#1分)}}
\newcommand\Lscore[1]{\hfill\text{\dotseps\dotseps\dotseps\dotseps\dotseps\dotseps(#1分)}}
\renewcommand\le{\leqslant}
\renewcommand\ge{\geqslant}


