%
% LaTeX class written in the Saint-Venant Laboratory for Hydraulics
% Original author  : Antoine Joly
% Adapted by : Yoann Dufresne and Pierre Marijon
%

\ProvidesClass{thesis}[2014/03/18]

%---------------------------------------------------------------------------
%Options that need to be passed
%---------------------------------------------------------------------------
% pass options to the book class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax

\LoadClass[a4paper,twoside]{book}

%---------------------------------------------------------------------------
%Packages that are used
%---------------------------------------------------------------------------
%Couleurs
\RequirePackage[dvipsnames]{xcolor}

%Mise en page
\RequirePackage{setspace}

% Nomenclature
\RequirePackage{ifthen}
\RequirePackage{nomencl}

% En-têtes, etc
\RequirePackage{fancyhdr}
\RequirePackage{lastpage} %pour avoir dernière page

% Equations
\RequirePackage{amsfonts}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{mathtools}
\RequirePackage{bm} %pour avoir des symboles en gras quand ils ne sont pas défini dans mathbf
\RequirePackage{amsbsy}
\RequirePackage{xargs}

% Figures
\RequirePackage{float}
\RequirePackage{rotating}
\RequirePackage[format=hang]{subfig,caption}

% Tableaux
\RequirePackage{booktabs,multirow}
\RequirePackage{lscape}
\RequirePackage{longtable}

% Pour les références
\RequirePackage[sort&compress,numbers,square]{natbib}

% Pour les liens hypertext
\RequirePackage{hyperref}
\RequirePackage{hypernat}

%---------------------------------------------------------------------------
%Graphical options
%---------------------------------------------------------------------------
\definecolor{LHSVLightBlue}{cmyk}{0.99,0.29,0.00,0.12}
\definecolor{LHSVDarkBlue}{cmyk}{1.00,0.35,0.00,0.20}
\definecolor{EdfOrange}{cmyk}{0.00,0.65,0.92,0.01}
\definecolor{EdfLightOrange}{rgb}{0.95,0.61,0}
\definecolor{EdfGreen}{rgb}{0.29,0.66,0.24}

\captionsetup{lofdepth=1}

%---------------------------------------------------------------------------
%Equations
%---------------------------------------------------------------------------
\renewcommand{\vec}[1]{\bm{#1}}
\newcommand{\ra}[1]{\renewcommand{\arraystretch}{#1}}
% You can define your own commands like this one for the average flow velocity notation:
\newcommand{\afv}[1]{\mathcal{h}#1\mathcal{i}}
% or to have sums in dispaystyle:
\newcommand{\dsum} {\displaystyle\sum}
\setcounter{MaxMatrixCols}{10}
% New math alphabet
\DeclareMathAlphabet{\mathpzc}{OT1}{pzc}{m}{it}

%---------------------------------------------------------------------------
%Page layout
%---------------------------------------------------------------------------
\setlength{\parindent}{1cm}
\setlength{\hoffset}{-0.6cm}
\setlength{\oddsidemargin}{1cm}
\setlength{\evensidemargin}{0cm}
\setlength{\marginparwidth}{10pt}
\setlength{\textwidth}{15.5cm}
\setlength{\voffset}{0pt}
\setlength{\marginparsep}{7pt}
\setlength{\topmargin}{7pt}
\setlength{\headheight}{10pt}
\setlength{\headsep}{20pt}
\setlength{\footskip}{15pt}
\setlength{\textheight}{650pt}
\setlength{\parskip}{4pt}

\onehalfspacing

%---------------------------------------------------------------------------
%Title Page
%---------------------------------------------------------------------------
%New commands
\newcommand{\spectitle}{...}
\newcommand{\speciality}[1]{\renewcommand{\spectitle}{#1}}

\newcommand{\jury}{}
\newcommand{\AddJuryMember}[3]{
	\expandafter\def\expandafter\jury\expandafter{\jury{}
		#1 & \textbf{#2} & (#3)\\
	}
}

\newboolean{normalnumbering}
\setboolean{normalnumbering}{false}
\newboolean{numberingstartright}
\setboolean{numberingstartright}{true}

%Page de Titre
\def\s@btitle{\relax}
\def\subtitle#1{\gdef\s@btitle{#1}} 
\renewcommand{\maketitle}{
  \thispagestyle{empty}
  % Numérotation
  \pagenumbering{roman} \setcounter{page}{1}

  % Texte
  \begin{center}
    \begin{spacing}{1.3}
      ~\vspace{-1.4cm}\\
      \includegraphics[width=0.4\textwidth]{assets/images/logo_UL}
      \includegraphics[width=0.4\textwidth]{assets/images/logo_INRIA} \vspace{-0.4cm}
     \\
      {\fontsize{22}{24}\bfseries\MakeUppercase\selectfont
        \'{E}cole Doctorale SPI \\
      }
      {\fontsize{14}{16}\bfseries\selectfont
        UMR 9189 - CRIStAL\\
      }
    \end{spacing}
    \vspace*{0.5cm plus 0cm minus 0.1cm}
    {\fontsize{18}{20}\bfseries\MakeUppercase\selectfont
      Th\`ese\par
    }
    {\rmfamily\fontsize{14}{16}\selectfont
      Pr\'esent\'ee pour l'obtention du grade de DOCTEUR \par DE L'UNIVERSITE DE LILLE\par
      par\\
    }
    \vspace*{0.3cm plus 0.1cm minus 0.1cm}
    {\fontsize{18}{20}\bfseries\MakeUppercase\selectfont
      \@author \par
    }
    \rule{\textwidth}{1pt}
    {\fontsize{24}{28}\bfseries\MakeUppercase\selectfont
      \@title\par
    }
    \rule{\textwidth}{1pt}
    
    {\rmfamily\fontsize{14}{16}\selectfont
      % Indiquez votre spécialité
      Sp\'ecialit\'e : \spectitle \par
    }
    \vfill
  \end{center}
  {\rmfamily\fontsize{14}{16}\selectfont
    Soutenue le \@date~ devant un jury compos\'e de~:\par
    \rule{\textwidth}{1pt}
    \begin{table}[H]
      \small
      \rmfamily\fontsize{12}{14}\selectfont
      % Indiquez les membres de votre jury
      \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} l l l}
      	\jury
      \end{tabular*}
    \end{table}
  }
}


%---------------------------------------------------------------------------
%Numerotation
%---------------------------------------------------------------------------
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}

\renewcommand{\thechapter}{\arabic{chapter}}
\renewcommand{\thesection}{\arabic{chapter}.\arabic{section}}
\renewcommand{\thesubsection}{\arabic{chapter}.\arabic{section}.\arabic{subsection}}

%---------------------------------------------------------------------------
% Créer un environement pour les résumés de chaques chapitres
%---------------------------------------------------------------------------
\newenvironment{chapresume}{%
	\vspace*{2cm plus1.5cm minus3.5cm}
	\leftskip1cm
	\rightskip\leftskip
	%
	\begin{itshape}
	\setlength{\parindent}{0.7cm}
} %début de l'environment
{%
	\end{itshape}
	%
	\clearpage
} %fin de l'environment

%---------------------------------------------------------------------------
%Nomenclature
%---------------------------------------------------------------------------
% Creating Nomenclature with Sections
% To be able to generate the nomenclature you have to run the following in the terminal: 
% makeindex <path to your tex file>\yourtexfile.nlo -s nomencl.ist -o <path to your tex file>\yourtexfile.nls. 
% Run pdflatex then above command and then pdflatex

\makenomenclature
\renewcommand{\nompreamble}{\markboth{%
                            \MakeUppercase\nomname}{\MakeUppercase\nomname}%
                           }

\renewcommand{\nomgroup}[1]{
\ifthenelse{\equal{#1}{A}}{\item[\textbf{Abbreviations}]}{
\ifthenelse{\equal{#1}{C}}{\item[\textbf{Roman symbols}]}{
\ifthenelse{\equal{#1}{G}}{\item[\textbf{Greek symbols}]}{
\ifthenelse{\equal{#1}{S}}{\item[\textbf{Subscripts}]}{%
\ifthenelse{\equal{#1}{Z}}{\item[\textbf{Mathematical Symbols}]}{%
{}
}% matches mathematical symbols
}% matches Subscripts
}% matches Roman Symbols
}% matches Greek Symbols
}% matches Abbreviations
}


%---------------------------------------------------------------------------
%Header and Footer
%---------------------------------------------------------------------------
\pagestyle{fancy}\fancyhf{}

% enregistrer les titres des sections/ chapitres pour les en-têtes et mettre à jour la numérotation des pages après les pages limaires
\newcommand{\partmark}[1]{
	\ifthenelse{\boolean{normalnumbering}}{
	}{
		\ifthenelse{\isodd{\arabic{page}}}
		{
  			\setboolean{numberingstartright}{true}
  		}
  		{
  			\setboolean{numberingstartright}{false}
  		}
		\pagenumbering{arabic} %\setcounter{page}{1}
		\setboolean{normalnumbering}{true}
		\hypersetup{colorlinks,
			breaklinks,
			citecolor=LHSVDarkBlue,
			filecolor=LHSVDarkBlue,
			linkcolor=LHSVDarkBlue,
			urlcolor=blue
		}
	}
	\markboth{\partname~\thepart: #1}{\partname~\thepart: #1}
}
\renewcommand{\chaptermark}[1]{
	\ifthenelse{\boolean{normalnumbering}}{
	}{%
		\ifthenelse{\isodd{\arabic{page}}}
		{
 			\setboolean{numberingstartright}{true}
  		}
  		{
  			\setboolean{numberingstartright}{false}
  		}
		\pagenumbering{arabic} %\setcounter{page}{1}
		\setboolean{normalnumbering}{true}
		\hypersetup{breaklinks,
			citecolor=LHSVDarkBlue,
			filecolor=LHSVDarkBlue,
			linkcolor=LHSVDarkBlue,
			urlcolor=blue
		}
	}
	\markboth{\chaptername~\thechapter: #1}{\chaptername~\thechapter: #1}
}
\newcommand{\unnumberedchaptermark}[1]{
	\ifthenelse{\boolean{normalnumbering}}{
	}{
		\ifthenelse{\isodd{\arabic{page}}}
		{
  			\setboolean{numberingstartright}{true}
  		}
  		{
  			\setboolean{numberingstartright}{false}
  		}
		\pagenumbering{arabic} %\setcounter{page}{1}
		\setboolean{normalnumbering}{true}
		\hypersetup{breaklinks,
			citecolor=LHSVDarkBlue,
			filecolor=LHSVDarkBlue,
			linkcolor=LHSVDarkBlue,
			urlcolor=blue
		}
	}
	\markboth{#1}{ #1}
}
\renewcommand{\sectionmark}[1]{\markright{\thesection~#1}}

\renewcommand{\headrulewidth}{0.5pt}% filet en haut de page
\setlength{\headheight}{14.2pt}
\renewcommand{\footrulewidth}{0pt} % pas de filet en bas

\fancyhead[LE]{
	\ifthenelse{\boolean{numberingstartright}}
	{
		\bfseries{\thepage}
	}
	{
		\bfseries\MakeUppercase{\leftmark}
	}
}
\fancyhead[RE]{
	\ifthenelse{\boolean{numberingstartright}}
	{
		\bfseries\MakeUppercase{\leftmark}
	}
	{
		\bfseries{\thepage}
	}
}
\fancyhead[RO]{
	\ifthenelse{\boolean{numberingstartright}}
	{
		\bfseries{\thepage}
	}
	{
		\bfseries\MakeUppercase{\rightmark}
	}
}
\fancyhead[LO]{
	\ifthenelse{\boolean{numberingstartright}}
	{
		\bfseries\MakeUppercase{\rightmark}
	}
	{
		\bfseries{\thepage}
	}
}

\fancypagestyle{plain}{ % pages de tetes de chapitre
  \fancyhead{} % supprime l'entete
  \renewcommand{\headrulewidth}{0pt} % et le filet
}

%---------------------------------------------------------------------------
%Tableau
%---------------------------------------------------------------------------
\newcommand{\minitab}[2][1]{\begin{tabular}{#1}#2\end{tabular}}

%---------------------------------------------------------------------------
%l'Annexe
%---------------------------------------------------------------------------
\renewcommand\appendix{\par
	\setcounter{chapter}{0}%
	\setcounter{section}{0}%
	\gdef\@chapapp{\appendixname}%
	\gdef\thechapter{\@Alph\c@chapter}
	\renewcommand*{\chaptername}{\appendixname}
	%
	\renewcommand{\thechapter}{\Alph{chapter}}
	\renewcommand{\thesection}{\Alph{chapter}.\arabic{section}}
	\renewcommand{\thesubsection}{\Alph{chapter}.\arabic{section}.\arabic{subsection}}
	%
}

%---------------------------------------------------------------------------
%Liens hyppertext
%---------------------------------------------------------------------------
% L'aspect des hyperliens change pour le corps du document
\hypersetup{colorlinks,
            breaklinks,
            citecolor=black,
            filecolor=black,
            linkcolor=black,
            urlcolor=black
            }
