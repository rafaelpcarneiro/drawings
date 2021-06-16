#!/bin/bash

perl animation.pl
for file in `ls -1 *tex`
do 
	pdflatex $file
done
    
rm *.aux  *.log  *tex
mv animation_circle_plus_point1.pdf animation_circle_plus_point1.0.pdf
mv animation_circle_plus_point2.pdf animation_circle_plus_point2.0.pdf
    
for file in `ls -1 *pdf`
do
	pdftoppm -jpeg $file ${file/pdf/jpg}
done

rm *pdf
convert -delay 20 -loop 0 *jpg animation.gif
rm *jpg
