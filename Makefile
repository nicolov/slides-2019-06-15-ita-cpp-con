PANDOC_OPTS=-t beamer --pdf-engine=xelatex
THEME_OPTS=-V theme:metropolis -V themeoptions:subsectionpage=progressbar -V fontsize=12pt

slides.pdf: SLIDES.md
	pandoc $(PANDOC_OPTS) $(THEME_OPTS) $< -o $@

.PHONY: web
web: SLIDES.md
	# history=true keeps the current page when refreshing with BrowserSync
	pandoc -t revealjs -s -V revealjs-url=https://revealjs.com -V theme=solarized -V history=true -V transition=none $< -o index.html

.PHONY: devserve
devserve:
	browser-sync . --files index.html

.PHONY: clean
clean:
	rm slides.pdf
