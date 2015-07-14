all: STA261.pdf clean_useless

pdf: STA261.pdf

STA261.pdf: *.tex
	pdflatex STA261.tex
	# texindy STA261.idx
	# note, run twice to ensure indexing is correct
	pdflatex STA261.tex

clean_useless:
	rm -f *.{aux,toc,out,idx,log,backup,gls,glo,glsdefs,xdy,ilg,ind,ist,acn,glg} *~

clean: clean_useless
	rm -f *.pdf

commit: STA261.pdf clean_useless
	git commit -a -m "update at `date --rfc-2822`" && git pull && git push

.PHONY: pdf clean commit clean_useless
