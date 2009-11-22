all: clean
	pdflatex rapport.tex
	pdflatex rapport.tex
	pdflatex rapport.tex
	xpdf rapport.pdf

clean:
	rm -f *.log *.aux *.idx *.ilg *.ind *.toc
	
count:
	cat rapport.tex | grep -v "%" | grep -c -v '\\'  

ilfaut:
	grep -H -n "@@" *.tex
