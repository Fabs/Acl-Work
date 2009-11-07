all: clean
	pdflatex rapport.tex
	pdflatex rapport.tex
	xpdf rapport.pdf

clean:
	rm -f *.log *.aux
