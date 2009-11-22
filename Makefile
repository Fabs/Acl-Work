all: clean
	latex rapport.tex
	makeindex rapport.tex
	latex rapport.tex
	latex rapport.tex
	xpdf rapport.pdf

clean:
	rm -f *.log *.aux rapport-draft.pdf rapport-two.pdf

count:
	cat rapport.tex | grep -v "%" | grep -c -v '\\'  

ilfaut:
	grep -H -n "@@" *.tex
