#!/bin/perl
# vim: set foldmethod=marker ts=4 expandtab sw=4:

#|--- Modules {{{1
use warnings;
use strict;

use Math::Trig;

#1}}}

sub printFractal {
    my $theLIMIT = 8;
    my $radius;
    my $posX, my $posY;
    my $counter;


    $radius = $_[0];
    $posX   = $_[1];
    $posY   = $_[2];
    $counter = $_[3];

    my $pointA_X = $posX - cos(60 * pi() / 180) * $radius;
    my $pointA_Y = $posY - sin(60 * pi() / 180) * $radius;

    my $pointB_X = $posX + cos(60 * pi() / 180) * $radius;
    my $pointB_Y = $posY - sin(60 * pi() / 180) * $radius;

    if ($counter < $theLIMIT) {
            print "\t\t \\draw ($posX, $posY) -- +(-60:$radius)
                               -- +(-120:$radius) --cycle;\n";

            print "\t\t \\draw ($pointA_X, $pointA_Y) -- +(-60:$radius)
                               -- +(-120:$radius) --cycle;\n";

            print "\t\t \\draw ($pointB_X, $pointB_Y) -- +(-60:$radius)
                               -- +(-120:$radius) --cycle;\n";

        printFractal ($radius / 2, $posX, $posY, $counter + 1);

        printFractal ($radius / 2, $pointA_X, $pointA_Y, $counter + 1 );

        printFractal ($radius / 2, $pointB_X, $pointB_Y, $counter + 1 );

    }

    return 0;
}

print  "\\documentclass[11pt]{standalone}\n";
           
print  "\\usepackage[utf8]{inputenc}\n";
print  "\\usepackage[T1]{fontenc}    \n";
print  "\\usepackage[brazil]{babel}\n";
           
           
print  "\\usepackage{tikz}\n";
print  "\\usetikzlibrary{snakes} %% produces curly arrows on tikz\n";
print  "\\usetikzlibrary{matrix} %% for commutative diagrams\n";
print  "\\usetikzlibrary{arrows}\n";
           
print  "\\begin{document}\n";
              
print  "    \\begin{tikzpicture}\n";

printFractal (8, 0, 0, 1);

             
print  "    \\end{tikzpicture}\n";
print  "\\end{document}\n";

