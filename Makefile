TOPLEVEL    = ESPT18-Parlot.tex
TARGET      = ESPT18-Parlot.pdf

DEPFILES   += $(wildcard *.tex)
DEPFILES   += $(wildcard *.bib)
DEPFILES   += $(wildcard figs.*/*.*)
DEPFILES   += $(wildcard tabs.*/*.*)
DEPFILES   += $(TOPLEVEL)

GARBAGE    += $(TOPLEVEL:%.tex=%.log)
GARBAGE    += $(TOPLEVEL:%.tex=%.out)
GARBAGE    += $(TOPLEVEL:%.tex=%.aux)
GARBAGE    += $(TOPLEVEL:%.tex=%.dvi)
GARBAGE    += $(TOPLEVEL:%.tex=%.cb)
GARBAGE    += $(TOPLEVEL:%.tex=%.cb2)
GARBAGE    += $(TOPLEVEL:%.tex=%.bbl)
GARBAGE    += $(TOPLEVEL:%.tex=%.blg)
GARBAGE    += $(wildcard figures/*-eps-converted-to.pdf)

# To use custom fonts, build with xelatex instead
LATEX       = pdflatex
#LATEX       = xelatex

.PHONY: all
all: $(TARGET)

$(TARGET): Makefile $(DEPFILES)

%.pdf: %.tex
	$(LATEX) $<
	bibtex $*
	$(LATEX) $<
	$(LATEX) $<

.PHONY: clean
clean:
	rm -f $(GARBAGE)

.PHONY: veryclean
veryclean: clean
	rm -f $(TARGET)

.PHONY: distclean
distclean: veryclean
