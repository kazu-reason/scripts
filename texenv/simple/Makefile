.SUFFIXES: .tex .dvi .aux .log .toc .lof .lot .pdf .ps .bbl .bib .blg
FILE=report

TEX=platex
BIBTEX=pbibtex
TEX2PDF=ptex2pdf

all: $(FILE).pdf

pdf: $(FILE).pdf
ps:  $(FILE).ps
dvi: $(FILE).dvi
aux: $(FILE).aux
bbl: $(FILE).bbl

$(FILE).pdf: $(FILE).tex
$(FILE).dvi: $(FILE).tex
$(FILE).ps:  $(FILE).dvi
$(FILE).bbl: $(FILE).tex

TEX2PDFFLAG = -e -l   ## platex
TEX2PDFFLAG += -od '-f ptex-ipaex.map -f otf-ipaex.map'  # using IPA font
#TEX2PDFFLAG += -od '-f ptex-noEmbed-04.map -f otf-noEmbed.map'  # font not embeded

BIBFLAG = -kanji=utf8

.tex.pdf:
	$(TEX) $<
	$(TEX2PDF) $(TEX2PDFFLAG) $<

.tex.dvi:
	$(TEX) $<
	$(TEX) $<

.dvi.ps:
	dvips -Ppdf -ta4 -o $@ $<

.aux.bbl:
	$(BIBTEX) $(BIBFLAG) $(FILE)
	$(TEX) $(FILE)
	$(TEX2PDF) $(TEX2PDFFLAG) $(FILE)

.tex.aux:
	$(TEX) $<

clean:
	rm -f *~ $(FILE).dvi $(FILE).aux $(FILE).toc $(FILE).out \
	$(FILE).log $(FILE).pdf $(FILE).ps $(FILE).blg
