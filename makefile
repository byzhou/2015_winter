include ./makefile_colors
target := week1.pdf

UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S),Darwin)
	view_target 	:= mac_view
else
	view_target 	:= linux_view
endif

%.pdf: %.tex %.blg %.bib
	@echo '$(Font_Bold)$(Font_Yellow)Generating pdf file $@ from $<$(Font_Reset)'
	pdflatex $<
	@echo -e '$(Font_Bold)$(Font_Yellow)Generating bib file$(Font_Reset)'
	bibtex week1
	@echo -e '$(Font_Bold)$(Font_Green)Bibfile generated$(Font_Reset)'
	pdflatex $<
	@echo -e '$(Font_Bold)$(Font_Green)Finished building target $@'

all: $(target)
view:$(view_target)
		
linux_view:
	@if which mupdf > /dev/null; then\
        mupdf week1.pdf &\
    else\
        evince week1.pdf &\
    fi
mac_view:
	open -a Preview week1.pdf &
clean:
	rm -rf *.aux *.log *.pdf *.log *.out


# @echo -e '$(Font_Bold)$(Font_Yellow)Generating pdf file $@ from $<$(Font_Reset)'
# pdflatex $<
# @echo -e '$(Font_Bold)$(Font_Yellow)Generating bib file$(Font_Reset)'
# bibtex week1
# @echo -e '$(Font_Bold)$(Font_Green)Bibfile generated$(Font_Reset)'
# pdflatex $<
# @echo -e '$(Font_Bold)$(Font_Green)Finished building target $@'
