SHELL:=/bin/bash

all: 
	bundle exec jekyll serve --config _config.yml,_config_dev.yml

bib:
	cat "`kpsewhich 'Leon Moonen Publications.bib'`" \
		| perl -pe 's|file = {:Users/leon/Documents/Mendeley/(.*)\.pdf:pdf}|url_Paper = {publications/\1.pdf}|' \
		| bibclean -no-fix-names -max-width 5000 \
		> assets/publications_leon_moonen.bib 
	grep "url_paper" assets/publications_leon_moonen.bib | perl -p -e 's|\s*url_paper\s*=\s*"publications/(.*)\.pdf",|cp "/Users/leon/Documents/Mendeley/\1.pdf" "assets/publications/\1.pdf"|' > /tmp/script
	mkdir -p assets/publications
	source /tmp/script
	git add assets/publications/*.pdf
	rm /tmp/script