PANDOC = pandoc

HTMLS = index.html \
	post1.html \

STYLESHEET = style.css
TEMPLATE = template.html
FAVICON = favicon.ico

TARGET_DIR ?= public

all: ${HTMLS}

install: ${TARGET_DIR} ${HTMLS}
	cp ${STYLESHEET} ${TARGET_DIR}
	cp ${TEMPLATE} ${TARGET_DIR}
	cp ${FAVICON} ${TARGET_DIR}
	cp *.html ${TARGET_DIR}

${TARGET_DIR}:
	mkdir -p $@

%.html: %.md
	${PANDOC} -t html -o $@ $^ --css=${STYLESHEET} --toc --template=${TEMPLATE}

.PHONY: clean
clean:
	${RM} ${HTMLS}
