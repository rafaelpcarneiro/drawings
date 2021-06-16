TEX=pdflatex

all_src     =  $(wildcard tex/*.tex)
all_files   =  $(all_src:%.tex=%.pdf)

all: $(all_files)
	@echo "Compiling all files"

%.pdf: %.tex
	$(TEX) -output-directory tex/ $<

.PHONY = clean
clean:
	@echo "Cleaning up all the mess..."
	rm tex/*.aux  tex/*.log 
