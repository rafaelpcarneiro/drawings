# vim: set foldmethod=marker ts=4 expandtab sw=4:

use warnings;
use strict;


my $i;
my @cantor_points = (0);
my @cantor_points_add;
my $lenght =1/3.0;

my $point0, my $pointF;

print "\\documentclass[11pt]{standalone}\n";
       
print "\\usepackage[utf8]{inputenc}\n";
print "\\usepackage[T1]{fontenc}\n";    
print "\\usepackage{tikz}\n";

print "\\begin{document}\n";
print "\\begin{tikzpicture}[scale=20]\n";
print "\t\\fill[white] (0,0) rectangle (1,0.5);\n";

for ($i = 0; $i <= 10; ++$i) {
    @cantor_points_add = ();

    foreach (@cantor_points) {
        $point0 = $_ + $lenght;
        $pointF = $point0 + $lenght;

        print "\t\\fill[black] ($point0,0) rectangle ($pointF,0.5);\n";
        push (@cantor_points_add, $pointF);
    }
    push (@cantor_points, @cantor_points_add);
    $lenght *= (1/3.0); 
}
print "\\end{tikzpicture}\n";
print "\\end{document}\n";
