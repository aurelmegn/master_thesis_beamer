.EXPORT_ALL_VARIABLES:
openout_any = a # for makeindex or bib2gls to write into dir not belonging to the project
TARGET = tmp/main.pdf
ENTRY = beamer.tex
COMPILER = latexmk
ABSDIR = $(shell pwd)
FLAGS = -f -synctex=1  -cd -pdflatex=lualatex -pdf -shell-escape $(SILENT) -outdir=$(ABSDIR)/tmp
LATEXMK_WATCH_FLAG = -pvc

.PHONY: default all clean $(TARGET)

SOURCES = $(wildcard *.tex)
default: $(TARGET)
all: default

$(TARGET): $(SOURCES)
	$(COMPILER) $(FLAGS) beamer
	biber -output-directory tmp beamer
	$(COMPILER) $(FLAGS) beamer
	$(COMPILER) $(FLAGS) beamer

clean:
	rm -rf tmp/*

watch: $(SOURCES)
	$(COMPILER) $(FLAGS) $(LATEXMK_WATCH_FLAG) $(ENTRY)
