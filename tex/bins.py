#!/usr/bin/env python3
# vim: set ts=4 foldmethod=marker:

from scipy.stats import bernoulli, uniform, multinomial
import numpy as np

texContent = """\documentclass[10pt,margin=0cm]{standalone}
\\usepackage[utf8]{inputenc}

\\usepackage[T1]{fontenc}    
\\usepackage[brazil]{babel}
\\usepackage{amsmath}
\\usepackage{amsfonts}
\\usepackage{amssymb}
\\usepackage{amsthm}
\\usepackage{mathrsfs}
\\usepackage{tikz}
\\usetikzlibrary{backgrounds}
\\begin{document}
%\sffamily
\\tiny
\\begin{tikzpicture}[background rectangle/.style={fill=black}, show background rectangle]
	%\draw[fill=black] (0,0) rectangle (15.1,4);
"""

X_STEP = 0.12
Y_STEP = 0.2
#              0.2  0.4  0.6  0.8  1.0
p = np.array( [0.1, 0.1, 0.1, 0.3, 0.4] ) 

#dist_colour = uniform  (0.7,0.3)
dist_colour = multinomial(1, p)
dist_number = bernoulli(0.8)


dist_colour.random_state = 222
dist_number.random_state = 333
py = 0
px = 0
for y in np.arange(20):
	for x in np.arange(140):
		number = dist_number.rvs()
		#colour = int(dist_colour.rvs() * 100)
		colour = (dist_colour.rvs().argmax() + 1) * 20

		texContent += f"\t\\draw[black!{colour}] ({px:2.4f}, {py:2.4f}) node {{ \\tt {number} }};\n"

		px += X_STEP;
	py += Y_STEP
	px  = 0

texContent += """
\end{tikzpicture}
\end{document}
print(texContent) 
"""

print(texContent)
