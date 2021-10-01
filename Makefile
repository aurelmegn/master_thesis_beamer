TARGET = tmp/memoire.pdf
COMPILER = pdflatex
FLAGS = --shell-escape -output-directory tmp

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
