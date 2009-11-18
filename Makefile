all: clean
	cat draft-header rapport.tex > rapport-draft.tex
	cat header rapport.tex > rapport-original.tex
	pdflatex rapport-original.tex
	pdflatex rapport-original.tex
	pdflatex rapport-draft.tex
	pdflatex rapport-draft.tex
	rm -f rapport-draft.tex rapport-original.tex
	mv rapport-original.pdf rapport.pdf
	xpdf rapport-draft.pdf

clean:
	rm -f *.log *.aux rapport-draft.pdf

count:
	cat rapport.tex | grep -v "%" | grep -v '\\' | wc 

ilfaut:
	grep -H -n "@@" *.tex