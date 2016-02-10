include ./makefile_colors
target :=	week1.pdf

%.pdf: %.tex %.blg
	@echo -e '$(Font_Bold)$(Font_Yellow)Generating pdf file $@ from $<$(Font_Reset)'
	pdflatex $<
	@echo -e '$(Font_Bold)$(Font_Green)Finished building target $@'

%.blg: %.bib
	@echo -e '$(Font_Bold)$(Font_Yellow)Generating bib file$(Font_Reset)'
	bibtex week1
	@echo -e '$(Font_Bold)$(Font_Green)Bibfile generated$(Font_Reset)'

all: $(target)

view:
	@if which mupdf > /dev/null; then\
        mupdf week1.pdf &\
    else\
        evince week1.pdf &\
    fi

clean:
	rm -rf *.aux *.log *.pdf 
