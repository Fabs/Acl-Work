all: clean
	pdflatex rapport.tex
	pdflatex rapport.tex
	open -a Preview rapport.pdf

clean:
	rm -f *.log *.aux
