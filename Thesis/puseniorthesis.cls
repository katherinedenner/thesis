%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{puseniorthesis}
         [2008/05/02 v1.4.1 Princeton University Thesis class]
         
\RequirePackage{setspace}
\RequirePackage{zref-totpages}

%report type option
\newif\if@progress
\@progressfalse
\DeclareOption{progress}{\@progresstrue}



%copy type option
\newif\if@filecopy
\@filecopyfalse
\DeclareOption{filecopy}{\@filecopytrue}
\newif\if@advisercopy
\@advisercopyfalse
\DeclareOption{advisercopy}{\@advisercopytrue}
\newif\if@readercopy
\@readercopyfalse
\DeclareOption{readercopy}{\@readercopytrue}

%abstract
\long\def\@abstract{\@latex@error{No \noexpand\abstract given}\@ehc}

%frontmatter numbered with roman numerals, mainmatter with arabic
\newcommand*{\frontmatter}{
  \pagenumbering{roman}
 }
\newcommand*{\mainmatter}{\pagenumbering{arabic}}
\newcommand*{\backmatter}{\pagenumbering{Roman}}
\newcommand*{\makelot}{}
\newcommand*{\makelof}{}
\newcommand*{\makelos}{}
\newcommand*{\begincmd}{
\onehalfspacing
\frontmatter\maketitlepage\makecopyrightpage\makeabstract
\makeacknowledgements\makededication\tableofcontents\clearpage
\makelot\clearpage\makelof\clearpage\makelos
\clearpage\mainmatter
\renewcommand{\baselinestretch}{1.5}
}

%define required vars
\def\@deptpref{Department of}
\def\departmentprefix#1{\gdef\@deptpref{#1}}
\def\classyear#1{\gdef\@classyear{#1}}
\def\adviser#1{\gdef\@adviser{#1}}
\def\reader#1{\gdef\@reader{#1}}
\def\dept#1{\gdef\@dept{#1}}
\def\submitdate#1{\gdef\@submitdate{#1}}
\long\def\acknowledgements#1{\gdef\@acknowledgements{#1}}
\def\course#1{\gdef\@course{#1}}

%define optional vars
\def\dedication#1{\gdef\@dedication{#1}}
\def\extranotes#1{\gdef\@extranotes{#1}}
\extranotes{}


%title page
\newcommand{\maketitlepage}{{
  \thispagestyle{empty}
  \sc
  \vspace*{0in}
  \begin{center}
    \LARGE \@title
  \end{center}
  \vspace{.1in}
  \begin{center}
   \large \@author,~\@classyear
  \end{center}
  \vspace{.3in}
  \begin{center}
   Submitted to the\\
    \@deptpref~\@dept\\
     Princeton University \\
   in partial fulfillment of the requirements of\\
   Undergraduate Independent Work.\\ 
   \vspace{.3in}
   \if@progress
   Progress Report\\
   \else
   Final Report\\
   \fi
  \vspace{.3in}
    \@submitdate
  \end{center}
  
  \vfill
  
 % \begin{flushright}
 \hangindent=11.5cm\hangafter=0
  \noindent\@adviser\\
  \@reader\\
  \@course\\
  \ztotpages \,  pages\\
  \if@filecopy
   File Copy
  \fi
  \if@advisercopy
   Adviser Copy
  \fi
   \if@readercopy
   reader Copy
  \fi
  \ifx\@extranotes\@empty
    \relax
  \else
     \\ \@extranotes\\
  \fi
 % \end{flushright}
  
  \clearpage
  }}
  
 %copyright page
\newcommand*{\makecopyrightpage}{
  \thispagestyle{empty}
  \vspace*{0in}
  \begin{center}
    \copyright\ Copyright by \@author, \number\year. \\
    All Rights Reserved
  \end{center}
  
  This  \if@progress progress report
  \else
  thesis
   \fi
   represents my own work in accordance with University regulations.
   
   

%  \vspace{1in}
%  \@author \hspace{0.5cm} \makebox[2in]{\hrulefill}

  \clearpage}
\newcommand*{\makeabstract}{
  \newpage
  \addcontentsline{toc}{section}{Abstract}
  \begin{center}
  \Large \textbf{Abstract}
  \end{center}
  \@abstract
  \clearpage
  }
  
  %acknowledgements
\def\makeacknowledgements{
  \ifx\@acknowledgements\undefined
  \else
    \addcontentsline{toc}{section}{Acknowledgements}
    \begin{center}
      \Large \textbf{Acknowledgements}
    \end{center}
    \@acknowledgements
    \clearpage
  \fi
  }
  
  %dedication page
\def\makededication{
  \ifx\@dedication\undefined
  \else
    \vspace*{1.5in}
    \begin{flushright}
      \@dedication
    \end{flushright}
    \clearpage
  \fi
  }
  
 %various optional lists 
\DeclareOption{myorder}{
  \renewcommand*{\begincmd}{
  \onehalfspacing
  }}
\DeclareOption{lot}{\renewcommand*{\makelot}{
  \addcontentsline{toc}{section}{List of Tables}\listoftables}}
\DeclareOption{lof}{\renewcommand*{\makelof}{
  \addcontentsline{toc}{section}{List of Figures}\listoffigures}}
\DeclareOption{los}{
  \renewcommand*{\makelos}{
    \newcommand*\l@symbol{\@dottedtocline{1}{1.5em}{3.5em}}
    \addtocontents{los}{\protect\addvspace{10\p@}}%
    \chapter*{List of Symbols\@mkboth {LIST OF SYMBOLS}{LIST OF SYMBOLS}}
    \@starttoc{los}
    \addcontentsline{toc}{section}{List of Symbols}
  }
}
\def\addsymbol#1#2{%
	\addtocontents{los}{\protect \contentsline {symbol}{\protect \numberline {#1}{\ignorespaces #2}}{\thepage}}
}

%inherits report class and associated options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions
%% Not necessary to specify the point size - we inherit it from above
%% \LoadClass[12pt]{report}
\LoadClass{report}
\setlength{\oddsidemargin}{.5in}   %{.4375in}
\setlength{\evensidemargin}{.5in} %{.4375in}
\setlength{\topmargin}{-.5in}  %{-.5625in}
\setlength{\textheight}{9in}
\setlength{\textwidth}{6in}
\long\def\abstract#1{\gdef\@abstract{#1}}
% fix problem with xcolor
\RequirePackage{etoolbox}
\AfterEndPreamble{\begincmd}
%\AtBeginDocument{\begincmd}
\endinput
%% 
%% End of file `puthesis.cls'.
