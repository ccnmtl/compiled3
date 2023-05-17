STAGING_URL=https://compiled3.stage.ccnmtl.columbia.edu/
PROD_URL=https://compiled.ctl.columbia.edu/
STAGING_BUCKET=compiled3.stage.ccnmtl.columbia.edu
PROD_BUCKET=compiled.ctl.columbia.edu
INTERMEDIATE_STEPS ?= echo nothing
HUGO=/usr/local/bin/hugo-0.93.3

JS_FILES=themes/ctl-compiled/static/js/src

all: eslint

include *.mk

clean:
	rm -rf $(PUBLIC)/*

$(PUBLIC)/js/all.json: $(PUBLIC)/json/all/index.html
	mkdir $(PUBLIC)/js/ || true
	mv $< $@ && ./checkjson.py

.PHONY: clean
