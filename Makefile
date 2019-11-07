THEME = marpit-inuits/inuits.css
BUILD_OPTS = --allow-local-files --html --theme $(THEME)
DOCKER_IMAGE = marpteam/marp-cli
MARPIT_COMMAND = docker run -u $(shell echo $$UID) -ti --rm -v ${PWD}:${PWD} --workdir ${PWD} $(DOCKER_IMAGE)

%.pdf: %.md
	$(MARPIT_COMMAND) $(BUILD_OPTS) --pdf $(shell basename $@ .pdf).md

%.html: %.md
	$(MARPIT_COMMAND) $(BUILD_OPTS) $(shell basename $@ .html).md

clean:
	touch *.md || true
