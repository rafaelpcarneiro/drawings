#!/bin/perl

use warnings;
use strict;

open my $fh, '>', "animation_circle_plus_point0.0.tex";
print $fh "
\\documentclass[11pt,border=0.2cm]{standalone}

%|--- Packages and Configs {{{1
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}    
\\usepackage[brazil]{babel}

\\usepackage{tikz}

\\usepackage{xcolor}

\\usepackage{ifthen} %% gives if conditionals when using newcommand

% 1}}}

%|--- Begin Document {{{1
\\begin{document}
\\begin{tikzpicture}[scale=2,rotate=-10]
    %\\draw[thick,->] (0,0,0) -- (0,0,1) node {z};
    %\\draw[thick,->] (0,0,0) -- (0,1,0) node {y};
    %\\draw[thick,->] (0,0,0) -- (1,0,0) node {x};

    \\pgfmathsetmacro{\\dtheta}{1}
    \\pgfmathsetmacro{\\dr}{0.1}
    \\pgfmathsetmacro{\\Max}{0.1}

    %\\foreach \\r in {0,\\dr,...,\\Max}{
    \\foreach \\r in {0.1}{
        \\foreach \\theta in {0, \\dtheta, ..., 360}{
            \\pgfmathsetmacro{\\lighten}{(abs(cos((\\theta+90)/2))+1)*50}
            \\pgfmathsetmacro{\\rr}{-(1-\\r)^2+1}


            \\pgfmathsetmacro{\\x}{\\rr*cos(\\theta)}
            \\pgfmathsetmacro{\\z}{\\rr*sin(\\theta)}
            \\pgfmathsetmacro{\\y}{\\r}

            \\pgfmathsetmacro{\\xN}{\\rr*cos(\\theta+\\dtheta)}
            \\pgfmathsetmacro{\\zN}{\\rr*sin(\\theta+\\dtheta)}

            \\pgfmathsetmacro{\\xNN}{\\rr*cos(\\theta+180)}
            \\pgfmathsetmacro{\\zNN}{\\rr*sin(\\theta+180)}

            \\draw[-, opacity=0.6,color=black!\\lighten] (\\x,\\y,\\z) -- (\\xN,\\y,\\zN);
            \\draw[-, opacity=0.6,color=black!\\lighten] (\\x,\\y,\\z) -- (\\xNN,\\y,\\zNN);
        }
    }

    \\draw[fill,color=black] (0,2,0) circle (0.05cm);
    \\draw[fill,color=white,fill opacity=0] (-1.1,-0.1) rectangle (1.1,2.1);

\\end{tikzpicture}

\\end{document}
% 1}}}
";
close $fh;

open $fh, '>', "animation_circle_plus_point0.1.tex";
print $fh "
\\documentclass[11pt,border=0.2cm]{standalone}

%|--- Packages and Configs {{{1
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}    
\\usepackage[brazil]{babel}

\\usepackage{tikz}

\\usepackage{xcolor}

\\usepackage{ifthen} %% gives if conditionals when using newcommand

% 1}}}

%|--- Begin Document {{{1
\\begin{document}
   
\\begin{tikzpicture}[scale=2,rotate=-10]
    %\\draw[thick,->] (0,0,0) -- (0,0,1) node {z};
    %\\draw[thick,->] (0,0,0) -- (0,1,0) node {y};
    %\\draw[thick,->] (0,0,0) -- (1,0,0) node {x};

    \\pgfmathsetmacro{\\dtheta}{10}
    \\pgfmathsetmacro{\\dr}{0.1}
    \\pgfmathsetmacro{\\Max}{0.1}

    \\foreach \\r in {0,\\dr,...,\\Max}{
        \\foreach \\theta in {0, \\dtheta, ..., 360}{
            \\pgfmathsetmacro{\\lighten}{(abs(cos((\\theta+90)/2))+1)*50}
            \\pgfmathsetmacro{\\rr}{-(1-\\r)^2+1}


            \\pgfmathsetmacro{\\x}{\\rr*cos(\\theta)}
            \\pgfmathsetmacro{\\z}{\\rr*sin(\\theta)}
            \\pgfmathsetmacro{\\y}{\\r}

            \\pgfmathsetmacro{\\xN}{\\rr*cos(\\theta+\\dtheta)}
            \\pgfmathsetmacro{\\zN}{\\rr*sin(\\theta+\\dtheta)}

            \\pgfmathsetmacro{\\yy}{(\\r+\\dr)}

            \\pgfmathsetmacro{\\rr}{-(1-\\r-\\dr)^2+1}

            \\pgfmathsetmacro{\\xx}{(\\rr)*cos(\\theta)}
            \\pgfmathsetmacro{\\zz}{(\\rr)*sin(\\theta)}

            \\pgfmathsetmacro{\\xxN}{(\\rr)*cos(\\theta+\\dtheta)}
            \\pgfmathsetmacro{\\zzN}{(\\rr)*sin(\\theta+\\dtheta)}

            \\draw[-,fill,fill opacity=0.8,color=black!\\lighten] (\\x,\\y,\\z) -- (\\xN,\\y,\\zN) --
                                     (\\xxN,\\yy,\\zzN) -- (\\xx,\\yy,\\zz) -- cycle;
        }
    }

    \\draw[fill,color=black] (0,2,0) circle (0.05cm);
    \\draw[fill,color=white,fill opacity=0] (-1.1,-0.1) rectangle (1.1,2.1);

\\end{tikzpicture}

\\end{document}
% 1}}}
";
close $fh;

for (my $i = 0.2; $i <= 2.1; $i+=0.1){
	open $fh, '>', "animation_circle_plus_point" . "$i" . ".tex";
	print $fh "
	\\documentclass[11pt,border=0.2cm]{standalone}

	%|--- Packages and Configs {{{1
	\\usepackage[utf8]{inputenc}
	\\usepackage[T1]{fontenc}    
	\\usepackage[brazil]{babel}

	\\usepackage{tikz}

	\\usepackage{xcolor}

	\\usepackage{ifthen} %% gives if conditionals when using newcommand

	% 1}}}

	%|--- Begin Document {{{1
	\\begin{document}
	   
	\\begin{tikzpicture}[scale=2,rotate=-10]
	    %\\draw[thick,->] (0,0,0) -- (0,0,1) node {z};
	    %\\draw[thick,->] (0,0,0) -- (0,1,0) node {y};
	    %\\draw[thick,->] (0,0,0) -- (1,0,0) node {x};

	    \\pgfmathsetmacro{\\dtheta}{10}
	    \\pgfmathsetmacro{\\dr}{0.1}
	    \\pgfmathsetmacro{\\Max}{$i}

	    \\foreach \\r in {0,\\dr,...,\\Max}{
		\\foreach \\theta in {0, \\dtheta, ..., 360}{
		    \\pgfmathsetmacro{\\lighten}{(abs(cos((\\theta+90)/2))+1)*50}
		    \\pgfmathsetmacro{\\rr}{-(1-\\r)^2+1}


		    \\pgfmathsetmacro{\\x}{\\rr*cos(\\theta)}
		    \\pgfmathsetmacro{\\z}{\\rr*sin(\\theta)}
		    \\pgfmathsetmacro{\\y}{\\r}

		    \\pgfmathsetmacro{\\xN}{\\rr*cos(\\theta+\\dtheta)}
		    \\pgfmathsetmacro{\\zN}{\\rr*sin(\\theta+\\dtheta)}

		    \\pgfmathsetmacro{\\yy}{(\\r+\\dr)}

		    \\pgfmathsetmacro{\\rr}{-(1-\\r-\\dr)^2+1}

		    \\pgfmathsetmacro{\\xx}{(\\rr)*cos(\\theta)}
		    \\pgfmathsetmacro{\\zz}{(\\rr)*sin(\\theta)}

		    \\pgfmathsetmacro{\\xxN}{(\\rr)*cos(\\theta+\\dtheta)}
		    \\pgfmathsetmacro{\\zzN}{(\\rr)*sin(\\theta+\\dtheta)}

		    \\draw[-,fill,fill opacity=0.8,color=black!\\lighten] (\\x,\\y,\\z) -- (\\xN,\\y,\\zN) --
					     (\\xxN,\\yy,\\zzN) -- (\\xx,\\yy,\\zz) -- cycle;
		}
	    }

	    \\draw[fill,color=black] (0,2,0) circle (0.05cm);
	    \\draw[fill,color=white,fill opacity=0] (-1.1,-0.1) rectangle (1.1,2.1);

	\\end{tikzpicture}

	\\end{document}
	% 1}}}
	";
	close $fh;
}
