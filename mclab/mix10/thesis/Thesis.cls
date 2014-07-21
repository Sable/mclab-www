\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{Thesis}
  [2002/05/16 McGill University Master's and Ph.D. thesis format]


% == M.Sc. Thesis options ======================================================

\DeclareOption{MSc}{\AtEndOfClass{\RequirePackage{MSc}}}


% == Ph.D. Thesis options ======================================================

\DeclareOption{PhD}{\AtEndOfClass{\RequirePackage{PhD}}}


% == Other Global Options ======================================================

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

\ExecuteOptions{} % no default options
\ProcessOptions


% == Load the base class and packages ==========================================

\LoadClass[12pt]{report}

\RequirePackage[french,english]{babel}


% -- Page Layout ---------------------------------------------------------------

% 1" margins except on the binding edge, where it is 1 1/2"

\setlength{\topmargin}{0pt}    % => top = 1"
\setlength{\headheight}{15pt}  
\setlength{\headsep}{25pt}
\setlength{\footskip}{30pt}
\setlength{\textheight}{580pt} % => bottom = 1"

\setlength{\oddsidemargin}{0.5in} % => left  = 1.5"
\setlength{\textwidth}{6in}
\setlength{\evensidemargin}{0in}  % => right = 1"

\setlength{\marginparsep}{6pt}
\setlength{\marginparwidth}{60pt} % => margin = 1"


% -- Global Settings -----------------------------------------------------------

% Use 1.3 times the normal baseline-to-baseline skip
\renewcommand{\baselinestretch}{1.3}

% Format footnotes as single space
\newcommand{\footnotespacing}%
{
  \let\CS=\@currsize\renewcommand{\baselinestretch}{1}\small\CS
}
\renewcommand{\@makefntext}[1]%
{
  \footnotespacing
  \makebox[1.8em][r]{\@makefnmark}#1
}

% Figures and tables are to be numbered sequentially throughout the
% thesis, rather than within chapters; for style consistency, do
% equations the same.  The following \def of \cl@chapter is a kludge:
% really there should be a \removefromreset, to stop figure numbers, etc.,
% from being reset at chapter beginnings
\def\cl@chapter{\@elt{section}\@elt{footnote}\@elt{figure}\@elt{table}\@elt{equation}}


% == Common Commands/Environments ==============================================

\newcommand{\@CopyrightMessage}{Copyright \copyright\ \the\year by \@author}
\newcommand{\CopyrightMessage}[1]{\renewcommand{\@CopyrightMessage}{#1}}

\newcommand{\@SubmitDate}{\the\month \the\year}
\newcommand{\SubmitDate}[1]{\renewcommand{\@SubmitDate}{#1}}

\newcommand{\Department}[1]{\def\@Department{#1}}

\newcommand{\Institution}[1]{\def\@Institution{#1}}

\newcommand{\Location}[1]{\def\@Location{#1}}

\newcommand{\ChapterTitleFont}{\LARGE \sffamily \bfseries}
\newcommand{\SectionTitleFont}{\Large \sffamily \bfseries}
\newcommand{\SubSectionTitleFont}{\large \sffamily \bfseries}
\newcommand{\SubSubSectionTitleFont}{\sffamily \bfseries}
\newcommand{\ParagraphTitleFont}{\large \sffamily \bfseries}
\newcommand{\SubParagraphTitleFont}{\sffamily \bfseries}

\newcommand{\PrefaceChapter}[2][?]
{
  \refstepcounter{chapter}
  \typeout{#1}
  \addcontentsline{toc}{chapter}{\protect#1}
  \markboth{#1}{}
  \MakePrefaceHead{#2}
}
\newcommand{\sPrefaceChapter}[1]
{
  \PrefaceChapter[#1]{#1}
}
\newcommand{\MakePrefaceHead}[1]
{
  \vspace*{50\p@}
  {
    \centering \normalfont \ChapterTitleFont
    \interlinepenalty \@M
    #1 \par \nobreak
    \vskip 40\p@
  }
}

\newenvironment{Abstract}
{
  \selectlanguage{english}
  \chapter*{\abstractname}
}
{}
\newenvironment{Resume}
{
  \selectlanguage{french}
  \chapter*{\abstractname}
}
{}
\newenvironment{Dedication}
{
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \thispagestyle{empty}
  \vspace*{3in}
  \centering
  \it
}
{
  \vfill
}

\newcommand{\StartChapter}
{
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \thispagestyle{plain}
  \global\@topnum\z@
  \@afterindentfalse
}
\newcommand{\Chapter}[2][?]
{
  \refstepcounter{chapter}
  \typeout{\chaptername\space\thechapter.}
  \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}#1}
  \markboth{#1}{}
  \addtocontents{lof}{\protect\addvspace{10\p@}}
  \addtocontents{lot}{\protect\addvspace{10\p@}}
  \MakeChapterHead{#2}
}
\newcommand{\MakeChapterHead}[1]
{
  \vspace*{40\p@}
  {
    {
      \flushright \normalfont \ChapterTitleFont
      \interlinepenalty\@M
      \chaptername \nobreakspace \thechapter \par
      #1 \par
      \hrulefill \par
    }
    \vskip 40\p@
  }
}
\newcommand{\sChapter}[1]
{
  \refstepcounter{chapter}
  \typeout{#1}
  \addcontentsline{toc}{chapter}{\protect#1}
  \markboth{#1}{}
  \addtocontents{lof}{\protect\addvspace{10\p@}}
  \addtocontents{lot}{\protect\addvspace{10\p@}}
  \MakesChapterHead{#1}
}
\newcommand{\MakesChapterHead}[1]
{
  \vspace*{40\p@}
  {
    {
      \flushright \normalfont \ChapterTitleFont
      \interlinepenalty\@M
      #1 \par
      \hrulefill \par
    }
    \vskip 40\p@
  }
}
\newcommand{\noVSpaceChapterHead}
{
  \renewcommand{\MakeChapterHead}[1]
  {
    \flushright \normalfont \ChapterTitleFont
    \interlinepenalty\@M
    \chaptername \nobreakspace \thechapter \par
    ##1 \par
    \hrulefill \par
  }
  \renewcommand{\MakesChapterHead}[1]
  {
    \flushright \normalfont \ChapterTitleFont
    \interlinepenalty\@M
    ##1 \par
    \hrulefill \par
  }
}

\newcommand{\preface}
{
  \pagestyle{plain}
  \pagenumbering{roman}

  \setcounter{chapter}{0}
  \renewcommand{\chapter}
  {
    \StartChapter
    \secdef \PrefaceChapter \sPrefaceChapter
  }
  \renewcommand{\thechapter}{\Roman{chapter}}
  \renewcommand{\theHchapter}{\Roman{chapter}} % hyperref
}
\newcommand{\maintext}
{
  \clearpage
  \pagenumbering{arabic}

  \setcounter{chapter}{0}
  \renewcommand{\chapter}
  {
    \StartChapter
    \secdef \Chapter \sChapter
  }
  \renewcommand{\thechapter}{\arabic{chapter}}
  \renewcommand{\theHchapter}{\arabic{chapter}} % hyperref
}
\renewcommand{\appendix}
{
  \setcounter{chapter}{0}
  \renewcommand{\thechapter}{\Alph{chapter}}
  \renewcommand{\theHchapter}{\Alph{chapter}} % hyperref
  \renewcommand{\chaptername}{\appendixname}
}

\renewcommand{\section}{\@startsection {section}{1}{\z@}%
             {-3.5ex \@plus -1ex \@minus -.2ex}%
             {2.3ex \@plus.2ex}%
             {\SectionTitleFont}}

\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
             {-3.25ex\@plus -1ex \@minus -.2ex}%
             {1.5ex \@plus .2ex}%
             {\SubSectionTitleFont}}

\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}%
             {-3.25ex\@plus -1ex \@minus -.2ex}%
             {1.5ex \@plus .2ex}%
             {\SubSubSectionTitleFont}}

\renewcommand{\paragraph}{\@startsection{paragraph}{4}{\z@}%
             {3.25ex \@plus1ex \@minus.2ex}%
             {-1em}%
             {\ParagraphTitleFont}}

\renewcommand{\subparagraph}{\@startsection{subparagraph}{5}{\parindent}%
             {3.25ex \@plus1ex \@minus .2ex}%
             {-1em}%
             {\SubParagraphTitleFont}}
