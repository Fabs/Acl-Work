all: clean article twocolumn draft
	rm -f rapport-draft.tex rapport-original.tex rapport-two.tex
	mv rapport-original.pdf rapport.pdf
	xpdf rapport-draft.pdf

article:
	cat header rapport.tex > rapport-original.tex
	pdflatex rapport-original.tex
	pdflatex rapport-original.tex

draft:
	cat draft-header rapport.tex > rapport-draft.tex
	pdflatex rapport-draft.tex
	pdflatex rapport-draft.tex


twocolumn:
	cat header-two rapport.tex > rapport-two.tex	
	pdflatex rapport-two.tex
	pdflatex rapport-two.tex

clean:
	rm -f *.log *.aux rapport-draft.pdf rapport-two.pdf

count:
	cat rapport.tex | grep -v "%" | grep -c -v '\\'  

ilfaut:
	grep -H -n "@@" *.tex