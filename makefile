include ~/makefile_colors
target :=	template.pdf

%.pdf: %.tex 
	@echo -e '$(Font_Bold)$(Font_Yellow)Generating pdf file $@ from $<$(Font_Reset)'
	pdflatex $<
	@echo -e '$(Font_Bold)$(Font_Green)Finished building target $@'

all: $(target)

view:
	evince $(target) &

clean:
	rm -rf *.aux *.log *.pdf 
