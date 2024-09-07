%%%%%%%%%%%%%%%%%%%%%%
%% start of file `elegantbook.cls'.
%% Copyright 2013-2022 ElegantLaTeX (elegantlatex2e@gmail.com)
%%
%% This work may be distributed and/or modified freely
%% available at https://github.com/ElegantLaTeX/ElegantBook
% 
%%%%%%%%%%%%%%%%%%%%%
% % !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{elegantbook}[2022/08/15 v4.4 ElegantBook document class]


%%%
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\RequirePackage{amsthm}
\SetupKeyvalOptions{family=ELEGANT, prefix=ELEGANT@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{ELEGANT}{#1}}
% ----- Colors -----
\DeclareStringOption[nocolor]{color}
\DeclareStringOption[en]{lang}
\DeclareStringOption[answer]{result}
\DeclareStringOption[fancy]{mode}
\DeclareStringOption[normal]{device}
\DeclareStringOption[cm]{math}
\DeclareStringOption[marginfalse]{marginpar}
\DeclareStringOption[onecol]{toc}
\DeclareStringOption{scheme}

% ----- backward compatibility
\DeclareVoidOption{nocolor}{\ekv{color=none}}
\DeclareVoidOption{green}{\ekv{color=green}}
\DeclareVoidOption{cyan}{\ekv{color=cyan}}
\DeclareVoidOption{blue}{\ekv{color=blue}}
\DeclareVoidOption{gray}{\ekv{color=gray}}
\DeclareVoidOption{black}{\ekv{color=black}}
\DeclareVoidOption{beamercolor}{\ekv{color=beamercolor}}
\DeclareVoidOption{doremi}{\ekv{color=doremi}}
\DeclareVoidOption{madoka}{\ekv{color=madoka}}

\DeclareVoidOption{chinese}{\ekv{scheme=chinese}}

\DeclareStringOption[ctexfont]{chinesefont}
\DeclareVoidOption{ctexfont}{\ekv{chinesefont=ctexfont}}
\DeclareVoidOption{founder}{\ekv{chinesefont=founder}}
\DeclareVoidOption{nofont}{\ekv{chinesefont=nofont}}

\DeclareVoidOption{en}{\ekv{lang=en}}
\DeclareVoidOption{cn}{\ekv{lang=cn}}
\DeclareVoidOption{it}{\ekv{lang=it}}
\DeclareVoidOption{fr}{\ekv{lang=fr}}
\DeclareVoidOption{nl}{\ekv{lang=nl}}
\DeclareVoidOption{hu}{\ekv{lang=hu}}
\DeclareVoidOption{de}{\ekv{lang=de}}
\DeclareVoidOption{mn}{\ekv{lang=mn}}
\DeclareVoidOption{pt}{\ekv{lang=pt}}
\DeclareVoidOption{jp}{\ekv{lang=jp}}

\DeclareVoidOption{fancy}{\ekv{mode=fancy}}
\DeclareVoidOption{simple}{\ekv{mode=simple}}
\DeclareBoolOption[false]{usesamecnt}

\DeclareVoidOption{answer}{\ekv{result=answer}}
\DeclareVoidOption{noanswer}{\ekv{result=noanswer}}

\DeclareVoidOption{normal}{\ekv{device=normal}}
\DeclareVoidOption{pad}{\ekv{device=pad}}

\DeclareStringOption[numeric-comp]{citestyle}
\DeclareStringOption[numeric]{bibstyle}

\DeclareVoidOption{newtx}{\ekv{math=newtx}}
\DeclareVoidOption{mtpro2}{\ekv{math=mtpro2}}
\DeclareVoidOption{cm}{\ekv{math=cm}}

\DeclareVoidOption{margintrue}{\ekv{marginpar=margintrue}}
\DeclareVoidOption{marginfalse}{\ekv{marginpar=marginfalse}}


\DeclareVoidOption{onecol}{\ekv{toc=onecol}}
\DeclareVoidOption{twocol}{\ekv{toc=twocol}}

\DeclareStringOption[chapter]{thmcnt}
\DeclareVoidOption{chapter}{\ekv{thmcnt=chapter}}
\DeclareVoidOption{section}{\ekv{thmcnt=section}}

\DeclareStringOption[biber]{bibend}
\DeclareVoidOption{biber}{\ekv{bibend=biber}}
\DeclareVoidOption{bibtex}{\ekv{bibend=bibtex}}


% ----- Math option -----
% \newcommand\mailto[1]{\href{mailto:#1}{\nolinkurl{#1}}}

% ----- Title Style -----
\DeclareStringOption[hang]{titlestyle}[hang]
% ----- backward compatibility
\DeclareVoidOption{hang}{\ekv{titlestyle=hang}}
\DeclareVoidOption{display}{\ekv{titlestyle=display}}
% ----- Default Options -----
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{book}}

\ProcessKeyvalOptions*\relax
% \ProcessOptions*\relax
\LoadClass[a4paper,oneside]{book}
\RequirePackage{setspace}
\RequirePackage{csquotes}
\RequirePackage{hyperref}
\hypersetup{
  breaklinks,
  unicode,
  linktoc=all,
  bookmarksnumbered=true,
  bookmarksopen=true,
  pdfkeywords={ElegantBook},
  colorlinks,
  linkcolor=winered,
  citecolor=winered,
  urlcolor=winered,
  plainpages=false,
  pdfstartview=FitH,
  pdfborder={0 0 0},
  linktocpage
}
\newif\ifELEGANT@Hy@later
  \@ifpackagelater{hyperref}{2022/05/16}
    {\ELEGANT@Hy@latertrue}
    {\ELEGANT@Hy@laterfalse}

%% device settings
\RequirePackage{geometry}
\ifdefstring{\ELEGANT@device}{normal}{
  \geometry{
    a4paper,
    top=25.4mm, bottom=25.4mm,
    left=20mm, right=20mm,
    headheight=2.17cm,
    headsep=4mm,
    footskip=12mm
  }
  \ifdefstring{\ELEGANT@marginpar}{margintrue}{
    \geometry{
      marginparwidth=5cm, marginparsep=5mm,
      left=2cm,right=7cm}}{\relax}}{
    \relax}

\ifdefstring{\ELEGANT@device}{pad}{
\geometry{
  paperwidth=7.5in, 
  paperheight=10in,
  margin=16mm,
  headheight=2.17cm,
  footskip=4mm
}}{\relax}


\RequirePackage{indentfirst,comment}
% fontsetting
\ifdefstring{\ELEGANT@math}{mtpro2}{
  \let\Bbbk\relax
  \RequirePackage[lite]{mtpro2}
}{\relax}

\setcounter{tocdepth}{1}
\renewcommand{\baselinestretch}{1.2}

\PassOptionsToPackage{no-math}{fontspec}
\PassOptionsToPackage{quiet}{fontspec}
\RequirePackage{iftex}

\ifpdftex
  \RequirePackage{newtxtext}
  \RequirePackage[scaled=.90]{helvet}
\else
  \RequirePackage[no-math]{fontspec}
  \setmainfont{TeXGyreTermesX}[
    UprightFont = *-Regular ,
    BoldFont = *-Bold ,
    ItalicFont = *-Italic ,
    BoldItalicFont = *-BoldItalic ,
    Extension = .otf ,
    Scale = 1.0]
    
  \setsansfont{texgyreheros}[
    UprightFont = *-regular ,
    BoldFont = *-bold ,
    ItalicFont = *-italic ,
    BoldItalicFont = *-bolditalic ,
    Extension = .otf ,
    Scale = 0.9]
\fi

\ifdefstring{\ELEGANT@lang}{cn}{
  \ifdefstring{\ELEGANT@chinesefont}{founder}{
    \RequirePackage[UTF8, scheme=plain, fontset=none]{ctex}
    \setCJKsecondfont[BoldFont={FZHei-B01},ItalicFont={FZKai-Z03}]{FZShuSong-Z01}
    \setCJKsansfont[BoldFont={FZHei-B01}]{FZKai-Z03}
    \setCJKmonofont[BoldFont={FZHei-B01}]{FZFangSong-Z02}
    \setCJKfamilyfont{zhsong}{FZShuSong-Z01}
    \setCJKfamilyfont{zhhei}{FZHei-B01}
    \setCJKfamilyfont{zhkai}[BoldFont={FZHei-B01}]{FZKai-Z03}
    \setCJKfamilyfont{zhfs}[BoldFont={FZHei-B01}]{FZFangSong-Z02}
    \newcommand*{\songti}{\CJKfamily{zhsong}}
    \newcommand*{\heiti}{\CJKfamily{zhhei}}
    \newcommand*{\kaishu}{\CJKfamily{zhkai}}
    \newcommand*{\fangsong}{\CJKfamily{zhfs}}}{\relax}
  
  \ifdefstring{\ELEGANT@chinesefont}{nofont}{
    \RequirePackage[UTF8,scheme=plain,fontset=none]{ctex}
    \xeCJKsetup{AutoFakeBold=true}
    }{\relax}

  \ifdefstring{\ELEGANT@chinesefont}{ctexfont}{
    \RequirePackage[UTF8,scheme=plain]{ctex}
    \xeCJKsetup{AutoFakeBold=true}
    }{\relax}
  
  \AfterEndPreamble{
    \setlength\parindent{2\ccwd}}
}{\relax}

\ifcsname heiti\endcsname
  \newcommand{\cbfseries}{\heiti}
\else
  \newcommand{\cbfseries}{\bfseries}
\fi


\ifcsname kaishu\endcsname
  \newcommand{\citshape}{\kaishu}
\else
  \newcommand{\citshape}{\itshape}
\fi
\ifcsname kaishu\endcsname
  \newcommand{\cnormal}{\kaishu}
\else
  \newcommand{\cnormal}{\normalfont}
\fi

\ifcsname fangsong\endcsname
  \newcommand{\cfs}{\fangsong}
\else
  \newcommand{\cfs}{\normalfont}
\fi

\RequirePackage{anyfontsize}
\ifdefstring{\ELEGANT@math}{newtx}{
  \let\oldencodingdefault\encodingdefault
  \let\oldrmdefault\rmdefault
  \let\oldsfdefault\sfdefault
  \let\oldttdefault\ttdefault
  \def\encodingdefault{T1}
  \renewcommand{\rmdefault}{ntxtlf}
  \renewcommand{\sfdefault}{qhv}
  \renewcommand{\ttdefault}{ntxtt}
  \RequirePackage{newtxmath}
  \let\encodingdefault\oldencodingdefault
  \let\rmdefault\oldrmdefault
  \let\sfdefault\oldsfdefault
  \let\ttdefault\oldttdefault
  \let\Bbbk\relax
  \RequirePackage{esint}
  %%% use yhmath pkg, uncomment following code
  % \let\oldwidering\widering
  % \let\widering\undefined
  % \RequirePackage{yhmath}
  % \let\widering\oldwidering

  %%% use esvect pkg, uncomment following code
  % \RequirePackage{esvect}

  \DeclareSymbolFont{CMlargesymbols}{OMX}{cmex}{m}{n}
  \let\sumop\relax\let\prodop\relax
  \DeclareMathSymbol{\sumop}{\mathop}{CMlargesymbols}{"50}
  \DeclareMathSymbol{\prodop}{\mathop}{CMlargesymbols}{"51}
}{\relax}


% ----- Handle Colors -----
%% 章节以及页脚图形

\RequirePackage[table]{xcolor}
\ifdefstring{\ELEGANT@color}{nocolor}{
  \definecolor{main}{RGB}{0,0,0}
  \definecolor{second}{RGB}{0,0,0}%
  \definecolor{third}{RGB}{0,0,0}%
  \definecolor{fourth}{RGB}{0,0,0}%
}{\relax}
\ifdefstring{\ELEGANT@color}{green}{
  \definecolor{main}{RGB}{0,120,2}%
  \definecolor{second}{RGB}{0,120,2}%
  \definecolor{third}{RGB}{230,90,7}%
  \definecolor{fourth}{RGB}{0,160,152}%
}{\relax}
\ifdefstring{\ELEGANT@color}{cyan}{
  \definecolor{main}{RGB}{31,186,190}%
  \definecolor{second}{RGB}{59,180,5}%
  \definecolor{third}{RGB}{175,153,8}%
  \definecolor{fourth}{RGB}{244,105,102}%
}{\relax}
\ifdefstring{\ELEGANT@color}{blue}{
  \definecolor{main}{RGB}{60,113,183}
  \definecolor{second}{RGB}{0,166,82}%
  \definecolor{third}{RGB}{255,134,24}%
  \definecolor{fourth}{RGB}{0,174,247}%
}{\relax}
\ifdefstring{\ELEGANT@color}{gray}{
  \definecolor{main}{RGB}{150,150,150}
  \definecolor{second}{RGB}{150,150,150}%
  \definecolor{third}{RGB}{150,150,150}%
  \definecolor{fourth}{RGB}{150,150,150}%
}{\relax}
\ifdefstring{\ELEGANT@color}{black}{
  \definecolor{main}{RGB}{0,0,0}
  \definecolor{second}{RGB}{0,0,0}%
  \definecolor{third}{RGB}{0,0,0}%
  \definecolor{fourth}{RGB}{0,0,0}%
}{\relax}
\ifdefstring{\ELEGANT@color}{beamercolor}{
  \definecolor{main}{RGB}{242,0,0}%
  \definecolor{second}{RGB}{51,51,179}%
  \definecolor{third}{RGB}{0,128,0}%
  \definecolor{fourth}{RGB}{121,64,0}%
  \definecolor{fifth}{RGB}{25,89,90}%
}{\relax}
\ifdefstring{\ELEGANT@color}{doremi}{
  \definecolor{main}{RGB}{73,119,213}%
  \definecolor{second}{RGB}{220,60,105}%
  \definecolor{third}{RGB}{122,89,166}%
  \definecolor{fourth}{RGB}{229,143,52}%
  \definecolor{fifth}{RGB}{244,220,10}%
}{\relax}
\ifdefstring{\ELEGANT@color}{madoka}{
  \definecolor{main}{RGB}{255,77,166}%
  \definecolor{second}{RGB}{237,128,18}%
  \definecolor{third}{RGB}{100,157,232}%
  \definecolor{fourth}{RGB}{191,64,100}%
}{\relax}

% corlor definition
\definecolor{winered}{rgb}{0.5,0,0}
\definecolor{bule}{RGB}{18,29,57}
\colorlet{coverlinecolor}{third}


% ----- Title Style -----
\ifdefstring{\ELEGANT@titlestyle}{hang}{\def\style{hang}}{\relax}
\ifdefstring{\ELEGANT@titlestyle}{display}{\def\style{display}}{\relax}

% reference: 
% https://tex.stackexchange.com/questions/58506/how-to-make-a-new-command-similar-to-author
% https://pastebin.com/C8W4axzV
\newcommand\email[1]{\href{mailto:#1}{\nolinkurl{#1}}}

\global\let\@title\@empty
\global\let\@author\@empty
\global\let\@date\@empty
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}
\newcommand{\institute}[1]{\gdef\@institute{#1}}
\newcommand{\version}[1]{\gdef\@version{#1}}
\newcommand{\extrainfo}[1]{\gdef\@extrainfo{#1}}

\RequirePackage{mwe}
\newcommand{\logo}[1]{\gdef\@logo{#1}}
\newcommand{\cover}[1]{\gdef\@cover{#1}}

\newcommand{\question}[1]{{\par\citshape #1}\\[0.2ex]}

\RequirePackage[labelfont={bf,color=fourth}]{caption} 
\captionsetup[table]{skip=3pt}
\captionsetup[figure]{skip=3pt}

\AtBeginDocument{
  \setlength{\abovedisplayskip}{3pt}
  \setlength{\belowdisplayskip}{3pt}
  \RequirePackage[flushmargin,stable]{footmisc}
  \setlength{\footnotesep}{12pt}
}



\RequirePackage{graphicx}
%\RequirePackage{enumerate}
\RequirePackage{amsmath,mathrsfs,amsfonts,amssymb}
% \providecommand\qed{}
% \renewcommand{\qed}{\hfill\ensuremath{\square}}
\RequirePackage{booktabs}
\RequirePackage{multicol,multirow}

\RequirePackage{fancyvrb}
\RequirePackage{makecell,lipsum,hologo}
%%中文结构名字


%%   章节设置
\RequirePackage[center,pagestyles]{titlesec}
\RequirePackage[title,titletoc,header]{appendix}


\RequirePackage[
  backend=\ELEGANT@bibend,
  citestyle=\ELEGANT@citestyle,
  bibstyle=\ELEGANT@bibstyle]{biblatex}

\ifdefstring{\ELEGANT@lang}{cn}{
  \renewcommand{\baselinestretch}{1.3}
  \renewcommand{\contentsname}{目录}
  \renewcommand{\figurename}{图}
  \renewcommand{\tablename}{表}
  \renewcommand{\partname}{\color{main}}
  \renewcommand{\thepart}{第\zhnumber{\arabic{part}}部分}
  \renewcommand{\listfigurename}{插图目录}
  \renewcommand{\listtablename}{表格目录}
  \renewcommand{\bibname}{参考文献}
  \newcommand{\ebibname}{参考文献}
  \renewcommand{\appendixname}{附录}
  \renewcommand{\appendixtocname}{附录}
  \renewcommand{\indexname}{索\hspace{2em}引}
  \newcommand\figref[1]{\textbf{图}~\ref{#1}}
  \newcommand\tabref[1]{\textbf{表}~\ref{#1}}
  \newcommand{\authorname}{\citshape 作者：}
  \newcommand{\institutename}{\citshape 组织：}
  \newcommand{\datename}{\citshape 时间：}
  \newcommand{\versionname}{\citshape 版本：}
  \newcommand{\notename}{笔记}
  \renewcommand*{\proofname}{证明}
  \newcommand{\definitionname}{定义}
  \newcommand{\theoremname}{定理}
  \newcommand{\axiomname}{公理}
  \newcommand{\postulatename}{公设}
  \newcommand{\lemmaname}{引理}
  \newcommand{\propositionname}{命题}
  \newcommand{\corollaryname}{推论}
  \newcommand{\examplename}{例} %
  \newcommand{\instancename}{示例} %
  \newcommand{\problemname}{问题} % 问题
  \newcommand{\exercisename}{练习} % 练习=习题
  \newcommand{\homeworkname}{作业}
  \newcommand{\answername}{参考答案}
  \newcommand{\remarkname}{注记}
  \newcommand{\assumptionname}{假设}
  \newcommand{\conclusionname}{结论}
  \newcommand{\solutionname}{解}
  \newcommand{\propertyname}{性质}
  \newcommand{\introductionname}{内容提要}
  \newcommand\bioinfo[2]{\gdef\@bioinfo{{\citshape #1}：#2}}
  \newcommand{\updatename}{更新：}
  \newcommand{\historyname}{版本更新历史}
  \newcommand{\beforechap}{第}
  \newcommand{\afterchap}{章}
}{\relax}


\ifdefstring{\ELEGANT@lang}{en}{
  \setlength\parindent{2em}
  \newcommand\figref[1]{\textbf{Figure}~\ref{#1}}
  \newcommand\tabref[1]{\textbf{Table}~\ref{#1}}
  \renewcommand{\chaptername}{Chapter}
  \renewcommand{\partname}{\color{main} Part}
  \newcommand{\authorname}{\textbf{Author: }}
  \newcommand{\institutename}{\textbf{Institute: }}
  \newcommand{\datename}{\textbf{Date: }}
  \newcommand{\versionname}{\textbf{Version: }}
  \newcommand{\notename}{Note}
  \renewcommand{\proofname}{Proof}
  \newcommand{\problemname}{Problem}
  \newcommand{\definitionname}{Definition}
  \newcommand{\theoremname}{Theorem}
  \newcommand{\axiomname}{Axiom}
  \newcommand{\postulatename}{Postulate}
  \newcommand{\lemmaname}{Lemma}
  \newcommand{\propositionname}{Proposition}
  \newcommand{\corollaryname}{Corollary}
  \newcommand{\examplename}{Example}
  \newcommand{\exercisename}{Exercise}
  \newcommand{\homeworkname}{Homework}
  \newcommand{\answername}{Answer}
  \newcommand{\remarkname}{Remark}
  \newcommand{\assumptionname}{Assumption}
  \newcommand{\conclusionname}{Conclusion}
  \newcommand{\solutionname}{Solution}
  \newcommand{\propertyname}{Property}
  \newcommand{\introductionname}{Introduction}
  \renewcommand{\appendixname}{Appendix}
  \newcommand{\ebibname}{Bibliography}
  % \newcommand{\homeworkname}{Exercise}
  \newcommand\bioinfo[2]{\gdef\@bioinfo{\textbf{#1}: #2}}
  \newcommand{\updatename}{Updates:}
  \newcommand{\historyname}{Version History}
}{\relax}

\ifdefstring{\ELEGANT@lang}{it}{
  % \RequirePackage[utf8]{inputenc}
  \RequirePackage[italian]{babel}
  % \RequirePackage[T1]{fontenc}
  \setlength\parindent{2em}
  \newcommand\figref[1]{\textbf{Figura}~\ref{#1}}
  \newcommand\tabref[1]{\textbf{Tabella}~\ref{#1}}
  \renewcommand{\chaptername}{Chapter}
  \newcommand{\authorname}{\textbf{Autore: }}
  \newcommand{\institutename}{\textbf{Istituto: }}
  \newcommand{\datename}{\textbf{Data: }}
  \newcommand{\versionname}{\textbf{Versione: }}
  \newcommand{\notename}{Nota}
  \renewcommand{\proofname}{Dimostrazione}
  \newcommand{\problemname}{Problema}
  \newcommand{\definitionname}{Definizione}
  \newcommand{\theoremname}{Teorema}
  \newcommand{\axiomname}{Assioma}
  \newcommand{\postulatename}{Postulato}
  \newcommand{\lemmaname}{Lemma}
  \newcommand{\propositionname}{Proposizione}
  \newcommand{\corollaryname}{Corollario}
  \newcommand{\examplename}{Esempio}
  \newcommand{\exercisename}{Esercizio}
  \newcommand{\homeworkname}{作业}
  \newcommand{\answername}{参考答案}
  \newcommand{\remarkname}{Commento}
  \newcommand{\assumptionname}{Assunto}
  \newcommand{\conclusionname}{Conclusione}
  \newcommand{\solutionname}{Soluzione}
  \newcommand{\propertyname}{Proprietà}
  \newcommand{\introductionname}{Introduzione}
  \newcommand\bioinfo[2]{\gdef\@bioinfo{\textbf{#1}: #2}}
  \newcommand{\updatename}{Aggiornamenti:}
  \newcommand{\ebibname}{Bibliografia}
  \newcommand{\historyname}{Cronologia delle versioni}
}{\relax}

\ifdefstring{\ELEGANT@lang}{fr}{
  \RequirePackage[utf8]{inputenc}
  \RequirePackage[T1]{fontenc}
  \RequirePackage[french]{babel}
  \setlength\parindent{2em}
  \renewcommand\figref[1]{\textbf{Figure}\ref{#1}}
  \renewcommand\tabref[1]{\textbf{Tableau}\ref{#1}}
  \renewcommand{\chaptername}{Chapitre}
  \renewcommand{\authorname}{\textbf{Auteur: }}
  \renewcommand{\institutename}{\textbf{Institut: }}
  \renewcommand{\datename}{\textbf{Date: }}
  \renewcommand{\versionname}{\textbf{Version: }}
  \renewcommand{\notename}{Note}
  \renewcommand{\proofname}{Démonstration}
  \renewcommand{\problemname}{Problème}
  \renewcommand{\definitionname}{Définition}
  \renewcommand{\theoremname}{Théorème}
  \renewcommand{\axiomname}{Axiôme}
  \renewcommand{\postulatename}{Postulat}
  \renewcommand{\lemmaname}{Lemme}
  \renewcommand{\propositionname}{Proposition}
  \renewcommand{\corollaryname}{Corollaire}
  \renewcommand{\examplename}{Exemple}
  \renewcommand{\exercisename}{Exercice}
  \newcommand{\homeworkname}{作业}
  \newcommand{\answername}{参考答案}
  \renewcommand{\remarkname}{Remarque}
  \renewcommand{\assumptionname}{Supposition}
  \renewcommand{\conclusionname}{Conclusion}
  \renewcommand{\solutionname}{Solution}
  \renewcommand{\propertyname}{Propriété}
  \renewcommand{\introductionname}{Introduction}
  \renewcommand{\homeworkname}{Exercice}
  \renewcommand{\updatename}{Mises à jour:}
  \newcommand{\ebibname}{Bibliographie}
  \renewcommand{\historyname}{Historique des versions}
}{\relax}


\ifdefstring{\ELEGANT@lang}{nl}{
  \RequirePackage[dutch]{babel}
  \setlength\parindent{2em}
  \newcommand\figref[1]{\textbf{Figuur}~\ref{#1}}
  \newcommand\tabref[1]{\textbf{Tabel}~\ref{#1}}
  \renewcommand{\chaptername}{Hoofdstuk}
  \newcommand{\authorname}{\textbf{Auteur: }}
  \newcommand{\institutename}{\textbf{Instituut: }}
  \newcommand{\datename}{\textbf{Datum: }}
  \newcommand{\versionname}{\textbf{Versie: }}
  \newcommand{\notename}{Opmerking}
  \renewcommand{\proofname}{Bewijs}
  \newcommand{\problemname}{Probleem}
  \newcommand{\definitionname}{Definitie}
  \newcommand{\theoremname}{Stelling}
  \newcommand{\axiomname}{Uitgangspunt}
  \newcommand{\postulatename}{Hypothese}
  \newcommand{\lemmaname}{Lemma}
  \newcommand{\propositionname}{Voorstel}
  \newcommand{\corollaryname}{Gevolgtrekking}
  \newcommand{\examplename}{Voorbeeld}
  \newcommand{\exercisename}{Oefening}
  \newcommand{\homeworkname}{作业}
  \newcommand{\answername}{参考答案}
  \newcommand{\remarkname}{Commentaar}
  \newcommand{\assumptionname}{Veronderstelling}
  \newcommand{\conclusionname}{Besluit}
  \newcommand{\solutionname}{Oplossing}
  \newcommand{\propertyname}{Eigenschap}
  \newcommand{\introductionname}{Introductie}
  \newcommand{\homeworkname}{Probleemcomplex}
  \newcommand\bioinfo[2]{\gdef\@bioinfo{\textbf{#1}: #2}}
  \newcommand{\updatename}{Update:}
  \newcommand{\ebibname}{Bibliographie}
  \newcommand{\historyname}{Versie Geschiedenis}
}{\relax}


\ifdefstring{\ELEGANT@lang}{hu}{
  \RequirePackage[magyar]{babel}
  \setlength\parindent{2em}
  \newcommand\figref[1]{\ref{#1}~\textbf{Ábra}}
  \newcommand\tabref[1]{\ref{#1}~\textbf{Táblázat}}
  \renewcommand{\chaptername}{Fejezet}
  \newcommand{\authorname}{\textbf{Szerző: }}
  \newcommand{\institutename}{\textbf{Intézmény: }}
  \newcommand{\datename}{\textbf{Dátum: }}
  \newcommand{\versionname}{\textbf{Verziószám: }}
  \newcommand{\notename}{Jegyzet}
  \renewcommand{\proofname}{Bizonyítás}
  \newcommand{\problemname}{Probléma}
  \newcommand{\definitionname}{Definíció}
  \newcommand{\theoremname}{Tétel}
  \newcommand{\axiomname}{Axióma}
  \newcommand{\postulatename}{Követelmény}
  \newcommand{\lemmaname}{Lemma}
  \newcommand{\propositionname}{Előzmény}
  \newcommand{\corollaryname}{Következmény}
  \newcommand{\examplename}{Példa}
  \newcommand{\exercisename}{Feladat}
  \newcommand{\homeworkname}{作业}
  \newcommand{\answername}{参考答案}
  \newcommand{\remarkname}{Megjegyzés}
  \newcommand{\assumptionname}{Sejtés}
  \newcommand{\conclusionname}{Összefoglalás}
  \newcommand{\solutionname}{Megoldás}
  \newcommand{\propertyname}{Tulajdonság}
  \newcommand{\introductionname}{Bevezetés}
  \newcommand{\homeworkname}{Feladatok}
  \newcommand\bioinfo[2]{\gdef\@bioinfo{\textbf{#1}: #2}}
  \newcommand{\updatename}{Frissítve:}
  \newcommand{\ebibname}{Bibliográfia}
  \newcommand{\historyname}{Korábbi verziók}
}{\relax}

\ifdefstring{\ELEGANT@lang}{de}{
  \setlength\parindent{2em}
  \renewcommand{\contentsname}{Inhaltsverzeichnis}
  \newcommand\figref[1]{\textbf{Figur}~\ref{#1}}
  \newcommand\tabref[1]{\textbf{Tabelle}~\ref{#1}}
  \renewcommand{\partname}{\color{main} Teil}
  \renewcommand{\listfigurename}{Abbildungsverzeichnis}
  \renewcommand{\listtablename}{Tabellenverzeichnis}
  \renewcommand{\bibname}{Bibliographie}
  \renewcommand{\appendixname}{Anhang}
  \renewcommand{\chaptername}{Kapitel}
  \newcommand{\authorname}{\textbf{Autor: }}
  \newcommand{\institutename}{\textbf{Institut: }}
  \newcommand{\datename}{\textbf{Datum: }}
  \newcommand{\versionname}{\textbf{Version: }}
  \newcommand{\notename}{Notiz}
  \renewcommand{\proofname}{Beweis}
  \newcommand{\problemname}{Problem}
  \newcommand{\definitionname}{Definition}
  \newcommand{\theoremname}{Theorem}
  \newcommand{\axiomname}{Axiom}
  \newcommand{\postulatename}{Postulat}
  \newcommand{\lemmaname}{Lemma}
  \newcommand{\propositionname}{Behauptung}
  \newcommand{\corollaryname}{Corollary}
  \newcommand{\examplename}{Beispiel}
  \newcommand{\instancename}{Beispiel} %
  \newcommand{\exercisename}{\"{U}bung}
  \newcommand{\homeworkname}{作业}
  \newcommand{\answername}{参考答案}
  \newcommand{\remarkname}{Anmerkung}
  \newcommand{\assumptionname}{Annahme}
  \newcommand{\conclusionname}{Abschluss}
  \newcommand{\solutionname}{Aufl\"{o}sung}
  \newcommand{\propertyname}{Property}
  \newcommand{\introductionname}{Einleitung}
  \newcommand\bioinfo[2]{\gdef\@bioinfo{\textbf{#1}: #2}}
  \newcommand{\updatename}{Updates:}
  \renewcommand{\ebibname}{Bibliographie}
  \newcommand{\historyname}{Version der Geschichte}
}{\relax}

\ifdefstring{\ELEGANT@lang}{es}{
  \RequirePackage[spanish]{babel}
  \setlength\parindent{2em}
  \newcommand\figref[1]{\textbf{Figura}~\ref{#1}}
  \newcommand\tabref[1]{\textbf{Tabla}~\ref{#1}}
  \renewcommand{\spanishchaptername}{Capítulo}
  \newcommand{\authorname}{\textbf{Autor: }}
  \newcommand{\institutename}{\textbf{Instituto: }}
  \newcommand{\datename}{\textbf{Fecha: }}
  \newcommand{\versionname}{\textbf{Versión: }}
  \newcommand{\notename}{Nota}
  \renewcommand{\proofname}{Demostración}
  \newcommand{\problemname}{Problema}
  \newcommand{\definitionname}{Definición}
  \newcommand{\theoremname}{Teorema}
  \newcommand{\axiomname}{Axioma}
  \newcommand{\postulatename}{Postulado}
  \newcommand{\lemmaname}{Lema}
  \newcommand{\propositionname}{Proposición}
  \newcommand{\corollaryname}{Corolario}
  \newcommand{\examplename}{Ejemplo}
  \newcommand{\exercisename}{Ejercicio}
  \newcommand{\homeworkname}{作业}
  \newcommand{\answername}{参考答案}
  \newcommand{\remarkname}{Comentario}
  \newcommand{\assumptionname}{Asunto}
  \newcommand{\conclusionname}{Conclusión}
  \newcommand{\solutionname}{Solución}
  \newcommand{\propertyname}{Propiedad}
  \newcommand{\introductionname}{Introducción}
  \newcommand{\homeworkname}{Ejercicio}
  \newcommand\bioinfo[2]{\gdef\@bioinfo{\textbf{#1}: #2}}
  \newcommand{\updatename}{Actualización:}
  \newcommand{\ebibname}{Bibliografía}
  \newcommand{\historyname}{Historial de versiones}
}{\relax}

\ifdefstring{\ELEGANT@lang}{mn}{
  \RequirePackage[mongolian]{babel}
  \RequirePackage[utf8]{inputenc}
  \RequirePackage[T2A]{fontenc}
  \setlength\parindent{2em}
  \newcommand\figref[1]{\textbf{Зураг}\ref{#1}}
  \newcommand\tabref[1]{\textbf{Хүснэгт}\ref{#1}}
  \renewcommand{\chaptername}{Бүлэг}
  \newcommand{\authorname}{\textbf{Зохиогч: }}
  \newcommand{\institutename}{\textbf{Сургууль: }}
  \newcommand{\datename}{\textbf{Огноо: }}
  \newcommand{\versionname}{\textbf{Хувилбар: }}
  \newcommand{\notename}{Тэмдэглэл}
  \renewcommand{\proofname}{Баталгаа}
  \newcommand{\problemname}{Бодлого}
  \newcommand{\definitionname}{Тодорхойлолт}
  \newcommand{\theoremname}{Томьёо}
  \newcommand{\axiomname}{Аксиом}
  \newcommand{\postulatename}{Постулат}
  \newcommand{\lemmaname}{Лемма}
  \newcommand{\propositionname}{Таамаглал}
  \newcommand{\corollaryname}{Үр дүн}
  \newcommand{\examplename}{Жишээ}
  \newcommand{\exercisename}{Дасгал}
  \newcommand{\homeworkname}{作业}
  \newcommand{\answername}{参考答案}
  \newcommand{\remarkname}{Тайлбар}
  \newcommand{\assumptionname}{Урьдчилсан нөхцөл}
  \newcommand{\conclusionname}{Дүгнэлт}
  \newcommand{\solutionname}{Хариулт}
  \newcommand{\propertyname}{Шинж чанар}
  \newcommand{\introductionname}{Удиртгал}
  \newcommand{\homeworkname}{Бодлогууд}
  \newcommand\bioinfo[2]{\gdef@bioinfo{\textbf{#1}: #2}}
  \newcommand{\updatename}{Шинэчлэлтүүд:}
  \newcommand{\ebibname}{Ном зүй}
  \newcommand{\historyname}{Хувилбарын түүх}
}{\relax}


\ifdefstring{\ELEGANT@lang}{pt}{
  \RequirePackage[portuguese]{babel}
  \setlength\parindent{2em}
  \newcommand\figref[1]{\textbf{Figura}~\ref{#1}}
  \newcommand\tabref[1]{\textbf{Tabela}~\ref{#1}}
  \renewcommand{\chaptername}{Capítulo}
  \newcommand{\authorname}{\textbf{Autor: }}
  \newcommand{\institutename}{\textbf{Instituição: }}
  \newcommand{\datename}{\textbf{Data: }}
  \newcommand{\versionname}{\textbf{Versão: }}
  \newcommand{\notename}{Observação}
  \renewcommand{\proofname}{Demostração}
  \newcommand{\problemname}{Problema}
  \newcommand{\definitionname}{Definição}
  \newcommand{\theoremname}{Teorema}
  \newcommand{\axiomname}{Axioma}
  \newcommand{\postulatename}{Postulado}
  \newcommand{\lemmaname}{Lema}
  \newcommand{\propositionname}{Proposição}
  \newcommand{\corollaryname}{Corolário}
  \newcommand{\examplename}{Exemplo}
  \newcommand{\exercisename}{Exercício}
  \newcommand{\homeworkname}{作业}
  \newcommand{\answername}{参考答案}
  \newcommand{\remarkname}{Comentário}
  \newcommand{\assumptionname}{Assunto}
  \newcommand{\conclusionname}{Conclusão}
  \newcommand{\solutionname}{Soluções}
  \newcommand{\propertyname}{Propiedade}
  \newcommand{\introductionname}{Introdução}
  \newcommand{\homeworkname}{Questão}
  \newcommand\bioinfo[2]{\gdef\@bioinfo{\textbf{#1}: #2}}
  \newcommand{\updatename}{Atualização: }
  \newcommand{\ebibname}{Bibliografia}
  \newcommand{\historyname}{Histórico de versões}
}{\relax}


\ifdefstring{\ELEGANT@lang}{jp}{
 \RequirePackage{luatexja}
  \setlength\parindent{2em}
  \renewcommand{\contentsname}{目次}
  \newcommand\figref[1]{\textbf{図}~\ref{#1}}
  \newcommand\tabref[1]{\textbf{表}~\ref{#1}}
  \renewcommand{\partname}{\color{main}}
  \renewcommand{\listfigurename}{イラストカタログ}
  \renewcommand{\listtablename}{表カタログ}
  \renewcommand{\bibname}{参考文献}
  \renewcommand{\appendixname}{付録}
  \renewcommand{\chaptername}{第 \thechapter 章}
  \newcommand{\authorname}{\textbf{著者：}}
  \newcommand{\institutename}{\textbf{組織団体：}}
  \newcommand{\datename}{\textbf{日付：}}
  \newcommand{\versionname}{\textbf{\citshape バージョン：}}
  \newcommand{\notename}{ノート}
  \renewcommand{\proofname}{証明}
  \newcommand{\problemname}{問題}
  \newcommand{\definitionname}{定義}
  \newcommand{\theoremname}{定理}
  \newcommand{\axiomname}{公理}
  \newcommand{\postulatename}{公準}
  \newcommand{\lemmaname}{補題}
  \newcommand{\propositionname}{命題}
  \newcommand{\corollaryname}{系}
  \newcommand{\examplename}{例題}
  \newcommand{\instancename}{例}
  \newcommand{\exercisename}{練習}
  \newcommand{\homeworkname}{作业}
  \newcommand{\answername}{参考答案}
  \newcommand{\remarkname}{注}
  \newcommand{\assumptionname}{仮設}
  \newcommand{\conclusionname}{結論}
  \newcommand{\solutionname}{解答}
  \newcommand{\propertyname}{性質}
  \newcommand{\introductionname}{内容概要}
  \newcommand\bioinfo[2]{\gdef\@bioinfo{\textbf{#1}: #2}}
  \newcommand{\updatename}{更新：}
  \newcommand{\ebibname}{参考文献}
  \newcommand{\historyname}{バージョン更新履歴}
}{\relax}
\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep
    \textbf{\color{third}{#1\@addpunct{:}}}]\ignorespaces\citshape
}{%
  \popQED\endtrivlist\@endpefalse
}

\graphicspath{{./figure/}{./figures/}{./image/}{./images/}{./graphics/}{./graphic/}{./pictures/}{./picture/}}

\RequirePackage{tikz} %% load tikz without tikz
\usetikzlibrary{backgrounds,calc,shadows,positioning,fit}
\newcommand*\circled[1]{\tikz[baseline=(char.base)]{
            \node[shape=circle,draw,inner sep=1pt] (char) {#1};}}
%  https://tex.stackexchange.com/questions/7032/good-way-to-make-textcircled-numbers

\RequirePackage{apptools}

% appendix chapter:

\ifdefstring{\ELEGANT@lang}{cn}{
  \ifdefstring{\ELEGANT@scheme}{chinese}{
    \newcommand{\xchaptertitle}{第\zhnumber{\arabic{chapter}}章} 
    \newcommand{\xsectiontitle}{第\zhnumber{\arabic{section}}节} }{
    \newcommand{\xchaptertitle}{第 \thechapter{} 章}
    \newcommand{\xsectiontitle}{第 \thesection{} 节}}
% Hyperref 2022/05/16's changelog.txt said
% * nameref is loaded always and earlier (issue#235) 
    \AtBeginDocument{
      \ifELEGANT@Hy@later
        \patchcmd{\NR@chapter}%
          {\numberline{\thechapter}}{\numberline{\xchaptertitle}}%
          {}{\fail}
      \else    
        \patchcmd{\Hy@org@chapter}%
          {\numberline{\thechapter}}{\numberline{\xchaptertitle}}%
          {}{\fail}
      \fi
    }
  }
  {\newcommand{\xchaptertitle}{\chaptername~\thechapter~}}

\setcounter{secnumdepth}{5}
\titleformat{\chapter}[\style]{\bfseries}{
  \filcenter\LARGE\enspace\bfseries{\color{main} \IfAppendix{\appendixname\;\thechapter\;}{\xchaptertitle\;}}}{1pt}{
  \LARGE\bfseries\color{main}\filcenter}[]
\titleformat{\section}[hang]{\bfseries}{
  \Large\bfseries{\color{main}\S\thesection}\enspace}{1pt}{%
  \color{main}\Large\bfseries\filright}
\titleformat{\subsection}[hang]{\bfseries}{
  \large\bfseries\color{main}\S\thesubsection\enspace}{1pt}{%
  \color{main}\large\bfseries\filright}
\titleformat{\subsubsection}[hang]{\bfseries}{
  \large\bfseries\color{main}\S\thesubsubsection\enspace}{1pt}{%
  \color{main}\large\bfseries\filright}

\titlespacing{\chapter}{0pt}{-20pt}{1.3\baselineskip}
%\titlespacing{\subsection}{0pt}{0.5\baselineskip}{-\baselineskip}



% \RequirePackage{enumerate}
\RequirePackage[inline]{enumitem}

\setlist[itemize,1]{label={\textcolor{main}{$\bullet$}}}
\setlist[itemize,2]{label={\textcolor{second}{$\bullet$}}}
\setlist[itemize,3]{label={\textcolor{third}{$\bullet$}}}
\setlist[enumerate]{format=\upshape\textcolor{main}}
\setlist[enumerate,1]{label=\color{main}(\arabic*)}
\setlist[enumerate,2]{label=\color{main}(\alph*).}
\setlist[enumerate,3]{label=\color{main}\Roman*.}
\setlist[enumerate,4]{label=\color{main}\Alph*.}
\newlist{homeworklist}{enumerate}{1}
\setlist[homeworklist,1]{label=\color{main}{\zhnum*、\hspace*{-\labelsep}}}
\newlist{exlist}{enumerate}{3}
\setlist[exlist,1]{label=\color{main}{\arabic*.},itemindent=0em}
\setlist[exlist,2]{label=\color{main}{(\arabic*)}}
\setlist[exlist,3]{label=\color{main}{(\roman*)}}
\setlist{nolistsep}

%%define the 
%%definition theorem postulate axiom corollary lemma proposition 
%%and proof environment
\RequirePackage{pifont,manfnt,bbding}
\RequirePackage[many]{tcolorbox}
% \newlength{\normalparindent}
% \setlength{\normalparindent}{\parindent}
\newcommand{\ELEGANT@tmp@tl}{}
\ifELEGANT@usesamecnt
  \newcounter{ELEGANT@samecnt}
  \counterwithin{ELEGANT@samecnt}{\ELEGANT@thmcnt}
  \tcbset{
    new/usesamecnt/.style = {use counter = ELEGANT@samecnt}
  }
\else
  \tcbset{
    new/usesamecnt/.style = {}
  }
\fi

\ifdefstring{\ELEGANT@mode}{fancy}{
  \tcbset{
    common/.style={
      fontupper=\citshape,
      lower separated=false,
      % before upper={\setlength{\parindent}{\normalparindent}},
      coltitle=white,
      colback=white,
      boxrule=0pt,
      fonttitle=\bfseries,
      enhanced,
      breakable,
      top=8pt,
      before skip=8pt,
      attach boxed title to top left={
        yshift=-0.11in,
        xshift=0.15in},
      boxed title style={
        boxrule=0pt,
        % colframe=white,
        arc=0pt,
        outer arc=0pt},
      separator sign={.},},
      mainstyle/.style={
        common,
        borderline={0pt}{0pt}{main,cstdash},
        colbacktitle=main
      },
      secondstyle/.style={
        common,
        borderline={0pt}{0pt}{second,cstdash},
        colbacktitle=second
      },
    thirdstyle/.style={
      common,
      borderline={0pt}{0pt}{third,cstdash},
      colbacktitle=third
    },
    fourthstyle/.style={
      common,
      borderline={0pt}{0pt}{fourth,cstdash},
      colbacktitle=fourth
    },
    ELEGANT@title/.code n args={2}
      {
        \tcbset
          {
            title=
              {
                \csname #1name\endcsname~%
                \ifdef{\thetcbcounter}{\thetcbcounter}{}%
                \ifblank{#2}{}{\ (#2)}
              }
          }
      },
    ELEGANT@label/.code n args={2}
      {
        \ifblank{#2}
          {}{\tcbset{label={#1:#2}}}
      }
    }
  
  % define an internal control sequence \ELEGANT@newtheorem for fancy mode's newtheorem
  % #1 is the environment name, #2 is the prefix of label, #3 is the style
  % style: thmstyle, defstyle, prostyle
  % e.g. \ELEGANT@newtheorem{theorem}{thm}{thmstyle}
  % will define two environments: numbered ``theorem'' and no-numbered ``theorem*''
  % WARNING FOR MULTILINGUAL: this cs will automatically find \theoremname's definition,
  % WARNING FOR MULTILINGUAL: it should be defined in language settings.
  \NewDocumentCommand \ELEGANT@newtheorem { m m m O{} }{
    \ifcsundef{#1name}{%
      \ClassError{elegantbook}{%
        \ #1name undefined, \MessageBreak
        Please check in language setting
      }{}
    }{\relax}
    \expandafter\ifblank\expandafter{#4}{
      \tcbset{
        new/usecnt/.style={}
      }
    }{
      \tcbset{
        new/usecnt/.style= {use counter from = #4}
      }
    }
    \DeclareTColorBox[auto counter,number within=\ELEGANT@thmcnt,usesamecnt,usecnt]{#1}{ g o t\label g }{
        common,#3,
        IfValueTF={##1}
          {ELEGANT@title={#1}{##1}}
          {
            IfValueTF={##2}
            {ELEGANT@title={#1}{##2}}
            {ELEGANT@title={#1}{}}
          },
        IfValueT={##4}
          {
            IfBooleanTF={##3}
              {label={##4}}
              {ELEGANT@label={#2}{##4}}
          }
      }
    \DeclareTColorBox{#1*}{ g o }{
        common,#3,
        IfValueTF={##1}
          {ELEGANT@title={#1}{##1}}
          {
            IfValueTF={##2}
            {ELEGANT@title={#1}{##2}}
            {ELEGANT@title={#1}{}}
          },
      }
  }
  % define several environment 
  % we define headers like \definitionname before
  \ELEGANT@newtheorem{theorem}{thm}{secondstyle}
  \ELEGANT@newtheorem{definition}{def}{thirdstyle}
  \ELEGANT@newtheorem{postulate}{pos}{mainstyle}
  \ELEGANT@newtheorem{axiom}{axi}{secondstyle}
  \ELEGANT@newtheorem{corollary}{cor}{secondstyle}
  \ELEGANT@newtheorem{lemma}{lem}{secondstyle}
  \ELEGANT@newtheorem{proposition}{pro}{secondstyle}
}{\relax}


\ifdefstring{\ELEGANT@mode}{simple}{
  \let\openbox\relax
  \RequirePackage{amsthm}
  \let\proof\relax
  % \let\proofname\relax
  \let\endproof\relax

  % declare new theorem styles: defstyle, thmstyle, prostyle
  \newtheoremstyle{defstyle}{3pt}{3pt}{\citshape}{-3pt}{
    \bfseries\color{second}}{}{0.5em}{\thmname{#1} \thmnumber{#2} \thmnote{(#3)}}
  \newtheoremstyle{thmstyle}{3pt}{3pt}{\citshape}{-3pt}{
    \bfseries\color{third}}{}{0.5em}{\thmname{#1} \thmnumber{#2} \thmnote{(#3)}}
  \newtheoremstyle{prostyle}{3pt}{3pt}{\citshape}{-3pt}{
    \bfseries\color{fourth}}{}{0.5em}{\thmname{#1} \thmnumber{#2} \thmnote{(#3)}}

  % define an internal control sequence \ELEGANT@newtheorem for simple mode's newtheorem
  % #1 is the environment name, #2 is the style
  % style: thmstyle, defstyle, prostyle
  % e.g. \ELEGANT@newtheorem{theorem}{thmstyle}
  % will define two environments: numbered ``theorem'' and no-numbered ``theorem*''
  % WARNING FOR MULTILINGUAL: this cs will automatically find \theoremname's definition,
  % WARNING FOR MULTILINGUAL: it should be defined in language settings.
  \NewDocumentCommand \ELEGANT@newtheorem { m m O{} } {
    \theoremstyle{#2}
    \ifELEGANT@usesamecnt
      \newtheorem{#1}[ELEGANT@samecnt]{\csname #1name\endcsname}
    \else 
      \ifblank{#3}{
        \newtheorem{#1}{\csname #1name\endcsname}[\ELEGANT@thmcnt]
      }{
        \newtheorem{#1}[#3]{\csname #1name\endcsname}
      }
    \fi
    \newtheorem*{#1*}{\csname #1name\endcsname}
  }

  % define several environment 
  % we define headers like \definitionname before
  \ELEGANT@newtheorem{theorem}{thmstyle}
  \ELEGANT@newtheorem{definition}{defstyle}
  \ELEGANT@newtheorem{postulate}{thmstyle}
  \ELEGANT@newtheorem{axiom}{thmstyle}
  \ELEGANT@newtheorem{corollary}{thmstyle}
  \ELEGANT@newtheorem{lemma}{thmstyle}
  \ELEGANT@newtheorem{proposition}{prostyle}
}{\relax}

% define an user control sequence \elegantnewtheorem
% #1 is the evironment, #2 is the theorem header
% #3 is the style       #4 is the prefix for fancy mode
% style: thmstyle, defstyle, prostyle
% if #4 is given in simple mode, an error will be raised
% if #4 isn't given in fancy mode, the prefix will be set equal to #1,
%   and a warning will be raised
\newcommand{\ELEGANT@newtheorem@warning}{}
\newcommand{\ELEGANT@newtheorem@error}{}
\newcommand{\ELEGANT@usesamecnt@warning}{}
\NewDocumentCommand\elegantnewtheorem{ m m m g O{} }
  {
    \renewcommand{\ELEGANT@usesamecnt@warning}{
      \ClassWarning{elegantbook}{%
        [#5] won't make sence with option \MessageBreak
        `usesamecnt'.
      }
    }
    \renewcommand{\ELEGANT@newtheorem@warning}{
      \ClassWarning{elegantbook}{%
        Because you didn't provide a prefix, \MessageBreak
        we use #1 as the default prefix. \MessageBreak
        You have to use \MessageBreak
        \ref{#1:label} to refer a \MessageBreak
        \begin{#1}{name}{label} environment. \MessageBreak
      }
    }
    \renewcommand{\ELEGANT@newtheorem@error}{
      \ClassError{elegantbook}{%
        You can't set a prefix in mode ``simple''.\MessageBreak
        Just use \MessageBreak
        \elegantnewtheorem{#1}{#2}{#3}
      }{%
        We are using ``amsthm'' package to \MessageBreak
        generate theorem-like theorem. \MessageBreak
        The 4th parameter ``prefix'' isn't allowed.
      }
    }
    \ifELEGANT@usesamecnt
      \ifblank{#5}{}{\ELEGANT@usesamecnt@warning}
    \else
      \renewcommand{\ELEGANT@tmp@tl}{#5}
    \fi
    \expandafter\def\csname #1name\endcsname{#2}
    \ifdefstring{\ELEGANT@mode}{simple}{%
        \IfValueTF{#4}
          {\ELEGANT@newtheorem@error}
          {\ELEGANT@newtheorem{#1}{#3}[\ELEGANT@tmp@tl]}
      }{\relax}
    \ifdefstring{\ELEGANT@mode}{fancy}{%
        \IfValueTF{#4}
          {
            \def\ELEGANT@temp@prefix{#4}
            \ifdefempty{\ELEGANT@temp@prefix}
              {
                \ELEGANT@newtheorem{#1}{#1}{#3}[\ELEGANT@tmp@tl]
                \ELEGANT@newtheorem@warning
              }
              {\ELEGANT@newtheorem{#1}{#4}{#3}[\ELEGANT@tmp@tl]}
          }
          {
            \ELEGANT@newtheorem{#1}{#1}{#3}[\ELEGANT@tmp@tl]
            \ELEGANT@newtheorem@warning
          }
      }{\relax}
  }

% second（green-def): example exercise problem solution
% third（orange-thm）: proof note remark  
% fourth（blue-prop):  assumptions property conclusion custom

%% Example with counter
\newcounter{exam}[chapter]
\setcounter{exam}{0}
\renewcommand{\theexam}{\thechapter.\arabic{exam}}
\newenvironment{example}[1][]{
  \refstepcounter{exam}
  \par\noindent\textbf{\color{main}{\examplename} \theexam #1 }\rmfamily}{
  \par\ignorespacesafterend}

%% Exercise with counter
\newcounter{exer}[section]
\setcounter{exer}{0}
\renewcommand{\theexer}{\thesection.\arabic{exer}}
\newenvironment{exercise}[1][]{
  \refstepcounter{exer}
  \par\noindent\makebox[-3pt][r]{
    \scriptsize\color{fifth}\HandPencilLeft\quad}
    \textbf{\color{fifth}{\exercisename} \theexer #1 }\rmfamily}{
    \par\ignorespacesafterend}

%% Problem with counter
\newcounter{prob}[chapter]
\setcounter{prob}{0}
\renewcommand{\theprob}{\thechapter.\arabic{prob}}
\newenvironment{problem}[1][]{
  \refstepcounter{prob}
  \par\noindent\textbf{\color{second}{\problemname} \theprob #1 }\rmfamily}{
  \par\ignorespacesafterend}

\newenvironment{note}{
  \par\noindent\makebox[-3pt][r]{
    \scriptsize\color{red!90}\textdbend\quad}
    \textbf{\color{third}\notename} \citshape}{\par}

% \newenvironment{proof}[1][\proofname]{
%   \par\noindent\textbf{\color{third}#1\;}
%   \color{black!90}\citshape}{
%   \hfill$\Box$\quad
%   \par}


\newenvironment{solution}[1][\solutionname]{\par\noindent\textbf{\color{fourth}#1\@addpunct{:}} \citshape}{\par}
\newenvironment{remark}{\vspace*{5pt}\noindent\textbf{\color{third}\remarkname}}{\vspace*{5pt}\par}
\newenvironment{assumption}{\par\noindent\textbf{\color{fourth}\assumptionname} \citshape}{\par}
\newenvironment{conclusion}{\par\noindent\textbf{\color{fourth}\conclusionname} \citshape}{\par}
\newenvironment{property}{\par\noindent\textbf{\color{fourth}\propertyname} \citshape}{\par}
\newenvironment{custom}[1]{\par\noindent\textbf{\color{fourth} #1} \citshape}{\par}

\RequirePackage{multicol}
\tcbset{
  introductionsty/.style={
    enhanced,
    breakable,
    fonttitle=\bfseries,
    colbacktitle=main,
    fontupper=\citshape,
    attach boxed title to top center={yshift=-3mm,yshifttext=-1mm},
    boxrule=0pt,
    toprule=0.5pt,
    bottomrule=0.5pt,
    top=8pt,
    before skip=8pt,
    sharp corners
  },
}


\newenvironment{introduction}{
  \begin{tcolorbox}[introductionsty,title=\introductionname]
    \begin{multicols}{2}
      \begin{itemize}[label=\textcolor{main}{\upshape\scriptsize\SquareShadowBottomRight}]}{
      \end{itemize}
    \end{multicols}
  \end{tcolorbox}}

\newenvironment{homework}[1][\homeworkname]{
  \newpage
  \begin{center}
    \phantomsection\addcontentsline{toc}{section}{#1}
    \markright{#1}
    \textcolor{main}{\Large\bfseries~#1~}
  \end{center}
  \begin{homeworklist}}{
  \end{homeworklist}}
  
\newcommand{\exerciseanswer}[1][\exercisename~\answername]{
  \newpage
  \begin{center}
    \phantomsection\addcontentsline{toc}{section}{#1}
    \markright{#1}
    \textcolor{main}{\Large\bfseries~#1~}
  \end{center}
}

\newenvironment{answer}[1][\answername]{
  \chapter{#1}
  \begin{homeworklist}}{
  \end{homeworklist}}

% \newenvironment{exerciseset}{
%   \vspace*{10pt}
%   \par\indent\makebox[-3pt][r]{
%   \large\color{fourth}\HandPencilLeft\quad}
%   \textbf{\color{second}{\Large\bfseries\exercisename}}\rmfamily
%   \begin{exenum}}{
%   \end{exenum}}

% \newcommand{\subexs}[1][1]{\vskip1ex\par%
%   \setcounter{subexperiod}{#1}%
%   \noindent{\color{green!60!black}{\kaishu 作业~\theexercise. }}}
% \newcounter{subexnum}[enumii]
% \newcounter{subexcount}[enumii]
% \newcounter{subexperiod}[enumii]
% \newcommand{\setsubex}[1][4]{\setcounter{subexperiod}{#1}}
% \newcommand{\subex}[1]{%
% 	\stepcounter{subexnum}%
% 	\ifnum\value{subexperiod}>4%
% 		\setcounter{subexperiod}{5}
% 	\fi%
% 	\ifnum\value{subexperiod}>1%
% 		\ifnum\value{subexcount}=0\par\fi%
% 		\ifnum\value{subexperiod}=2\makebox[0.44\columnwidth][l]{\textcolor{main}{(\thesubexnum)} #1}\fi%
% 		\ifnum\value{subexperiod}=3\makebox[0.29\columnwidth][l]{\textcolor{main}{(\thesubexnum)} #1}\fi%
% 		\ifnum\value{subexperiod}=4\makebox[0.21\columnwidth][l]{\textcolor{main}{(\thesubexnum)} #1}\fi%
% 		\ifnum\value{subexperiod}>4\makebox[0.16\columnwidth][l]{\textcolor{main}{(\thesubexnum)} #1}\fi%
% 		\stepcounter{subexcount}%
% 		\ifnum\value{subexperiod}=\value{subexcount}\setcounter{subexcount}{0}\fi%
% 	\else%
% 		\ifnum\value{subexperiod}=1%
% 			\par\textcolor{main}{(\thesubexnum)} #1%
% 		\else
% 			\textcolor{main}{(\thesubexnum)} #1\relax%
% 		\fi
% 	\fi%
% }

\def\relsec{\endgroup start}
\def\endrelsec{end\begingroup\def \@currenvir {relsec}}

\ifdefstring{\ELEGANT@result}{noanswer}{
  \AtBeginDocument{
  \excludecomment{solution}
  \excludecomment{proof}
  \excludecomment{inline}
  }
}{\relax}


%页眉页脚
\RequirePackage{fancyhdr}
\fancyhf{}


\fancyfoot[c]{\color{main}\small\thepage}
\if@twoside
  \fancyhead[EL]{\color{main}\cnormal\leftmark}
  \fancyhead[OR]{\color{main}\cnormal\rightmark}
\else
  \fancyhead[R]{\color{main}\cnormal\rightmark}
\fi

\renewcommand{\headrule}{\color{main}\hrule width\textwidth}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{1pt}
% \renewcommand{\headrule}{}
\fancypagestyle{plain}{\renewcommand{\headrulewidth}{0pt}\fancyhf{}\renewcommand{\headrule}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\, #1}{}}
\renewcommand{\chaptermark}[1]{\markboth{\xchaptertitle\, #1}{}}


\renewcommand*{\maketitle}{%
\hypersetup{pageanchor=false}
\pagenumbering{Alph}
\begin{titlepage}
  \newgeometry{margin = 0in}
  \parindent=0pt
  \ifdefstring{\ELEGANT@device}{normal}{
    \ifcsname @cover\endcsname
      \includegraphics[width=\linewidth]{\@cover}
    \else
      \includegraphics[width=\linewidth]{example-image}
    \fi
  }{\relax}
  \ifdefstring{\ELEGANT@device}{pad}{
    \ifcsname @cover\endcsname
      \includegraphics[trim=0 26bp 0 26bp,clip=true, width=\linewidth]{\@cover}
    \else
      \includegraphics[trim=0 26bp 0 26bp,clip=true, width=\linewidth]{example-image}
    \fi
  }{\relax}
  \setlength{\fboxsep}{0pt}
  \colorbox{main}{\makebox[\linewidth][c]{\shortstack[c]{\vspace{0.5in}}}}
  \vfill
  \vskip-2ex
  \hspace{2em}
  \parbox{0.8\textwidth}{
    \bfseries\Huge\color{main}
      \ifcsname @title\endcsname \@title \fi
    \par}
  \vfill
  \vspace{-1.0cm}
  \setstretch{2.5}
  \hspace{2.5em}
  \begin{minipage}[c]{0.67\linewidth}
    {\color{main}\bfseries\Large
      \ifcsname @subtitle\endcsname\@subtitle\\[2ex]\fi}
    \color{main}\normalsize
    {\renewcommand{\arraystretch}{0.618}
    \begin{tabular}{l}
      % \ifcsname @author\endcsname \authorname \@author\\\fi
      \ifx\@author\empty\else\authorname\cnormal\@author\\ \fi\color{second}
      \ifcsname @institute\endcsname \institutename \cnormal\@institute\\ \fi\color{third}
      % \ifcsname @date\endcsname  \@date\\\fi
      \ifx\@date\empty\else\datename\cnormal\@date \\ \fi\color{fourth}
      \ifcsname @version\endcsname \cnormal\versionname\@version\\ \fi
      \ifcsname @bioinfo\endcsname \cnormal\@bioinfo\\ \fi
    \end{tabular}}
  \end{minipage}
  \begin{minipage}[c]{0.27\linewidth}
  \begin{tikzpicture}[remember picture,overlay]
    \begin{pgfonlayer}{background}
      \node[opacity=0.8,
            anchor=south east,
            outer sep=0pt,
            inner sep=0pt] at ($(current page.south east) +(-0.8in,2.5in)$) {
              \ifcsname @logo\endcsname\includegraphics[width=4.2cm]{\@logo}\fi};
    \end{pgfonlayer}
  \end{tikzpicture}
  \end{minipage}
  \vfill
  \begin{center}
    \setstretch{1.3}
    \parbox[t]{0.7\textwidth}{\centering \citshape 
      \ifcsname @extrainfo\endcsname\@extrainfo\fi}
  \end{center}
  \vfill
\end{titlepage}
\restoregeometry
\thispagestyle{empty}}


\newcommand{\dollar}{\mbox{\textdollar}}

\RequirePackage{listings}
\renewcommand{\ttdefault}{cmtt}
\lstdefinestyle{mystyle}{
  basicstyle=%
    \ttfamily
    \lst@ifdisplaystyle\small\fi
}

\lstset{basicstyle=\ttfamily,style=mystyle,breaklines=true}

\definecolor{lightgrey}{rgb}{0.9,0.9,0.9}
\definecolor{frenchplum}{RGB}{190,20,83}
\lstset{language=[LaTeX]TeX,
  texcsstyle=*\color{winered},
  numbers=none,
  mathescape=false,
  breaklines=true,
  keywordstyle=\color{winered},
  commentstyle=\color{gray},
  emph={elegantpaper,fontenc,fontspec,xeCJK,citestyle,FiraMono,xunicode,figure,fig,image,img,table,itemize,enumerate,ctex,microtype,description,times,booktabs,tabular,PDFLaTeX,XeLaTeX,type1cm,BibTeX,device,color,mode,lang,amsthm,tcolorbox,titlestyle,cite,ctex,listings,base,math,scheme,toc,esint,chinesefont,amsmath,bibstyle,natbib,pgfornament,addbibresource,printbibliography},
  emphstyle={\color{frenchplum}},
  morekeywords={DeclareSymbolFont,SetSymbolFont,toprule,midrule,bottomrule,institute,version,includegraphics,setmainfont,setsansfont,setmonofont ,setCJKsecondfont,setCJKsansfont,setCJKmonofont,RequirePackage,figref,tabref,email,maketitle,keywords,definecolor,extrainfo,logo,cover,subtitle,appendix,chapter,section,hypersetup,secondmatter,frontmatter,tableofcontents,elegantpar,heiti,kaishu,lstset,pagecolor,zhnumber,marginpar,part,equote,marginnote,bioinfo,datechange,listofchange,lvert,lastpage,songti,heiti,fangsong,setCJKfamilyfont,textbf,elegantnewtheorem,thmcnt,colorlet,usesamecnt},
  frame=single,
  tabsize=2,
  rulecolor=\color{main},
  framerule=0.2pt,
  columns=flexible,
  % backgroundcolor=\color{lightgrey}
}

\newcommand\bmmax{0}
\RequirePackage{bm}

% add the list of change history
\newcommand{\dateinfoline}[2]{
  \noindent\makebox[0pt][r]{%
  \makebox[-3em][r]{%
    \small
    \textbf{\textcolor{main}{#1}}}\;\;}%
  {\citshape\updatename\ignorespaces#2}}

\newcommand{\datechange}[2]{%
  \noindent{\makebox[\textwidth][r]{\color{main}\rule{1.15\textwidth}{.4pt}}}
  \dateinfoline{#1}{#2}
  \addcontentsline{dates}{section}{#1 -- #2}}

\newcommand{\listofchanges}{%
  \begingroup
    \renewcommand{\contentsname}{\historyname}
    \let\old@starttoc\@starttoc
    \def\@starttoc##1{
      \old@starttoc{dates}}
    \tableofcontents%
  \endgroup}
% https://tex.stackexchange.com/questions/472931/list-of-all-dates-in-a-document

\newenvironment{change}{
  \begin{enumerate}[label=\small\protect\circled{\arabic*}]}{
  \end{enumerate}}

\renewcommand\tableofcontents{%
  \hypersetup{linktoc=all, linkcolor=main}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \ifdefstring{\ELEGANT@toc}{twocol}{
      \setlength{\columnsep}{2em}
      \begin{multicols}{2}%
        \@starttoc{toc}
      \end{multicols}}{
      \@starttoc{toc}}
    \if@restonecol\twocolumn\fi
    \hypersetup{linkcolor=fourth}}


\renewcommand*{\cleardoublepage}{\clearpage\if@twoside \ifodd\c@page\else
\hbox{}%
\thispagestyle{empty}%
\newpage%
\if@twocolumn\hbox{}\newpage\fi\fi\fi}


% https://tex.stackexchange.com/questions/56839/chaptername-is-used-even-for-appendix-chapters-in-toc
\RequirePackage{calc}
\RequirePackage[titles]{tocloft}
\ifdefstring{\ELEGANT@lang}{cn}{
  % \renewcommand{\cftchappresnum}{\beforechap\space}
  % \renewcommand{\cftchapaftersnum}{\space\afterchap}
  % \setlength{\cftchapnumwidth}{\widthof{\textbf{附录~十一}}}
  \renewcommand{\numberline}[1]{%
  \@cftbsnum #1\@cftasnum~\@cftasnumb ~%
  }
  \g@addto@macro\appendix{%
    % recover \thechapter in the \NR@chapter's \numberline
    \ifELEGANT@Hy@later
      \patchcmd{\NR@chapter}%
        {\numberline{\xchaptertitle}}{\numberline{\thechapter}}%
        {}{\fail}      
    \else
      \patchcmd{\Hy@org@chapter}%
        {\numberline{\xchaptertitle}}{\numberline{\thechapter}}%
        {}{\fail}  
    \fi
    \addtocontents{toc}{%
      \protect\renewcommand{\protect\cftchappresnum}{\appendixname\space}%
      \protect\renewcommand{\protect\cftchapaftersnum}{}%
    }%
  }
}{
  \renewcommand{\cftchappresnum}{\chaptername\space}
  \renewcommand{\cftchapaftersnum}{\space}
  \setlength{\cftchapnumwidth}{\widthof{\textbf{Appendix~9}}}
  \g@addto@macro\appendix{%
    \addtocontents{toc}{%
      \protect\renewcommand{\protect\cftchappresnum}{\appendixname\space}%
      \protect\renewcommand{\protect\cftchapaftersnum}{}%
      \setlength{\cftchapnumwidth}{\widthof{\textbf{Appendix~999}}}
    }%
  }
}

% restore the tt default family to lmodern tt family
\renewcommand\ttdefault{lmtt}