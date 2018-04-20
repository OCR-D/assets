# BEGIN-EVAL makefile-parser --make-help Makefile

help:
	@echo ""
	@echo "  Targets"
	@echo ""
	@echo "    dist   Copy test fixtures to another dir and replace URL"
	@echo "    start  Start the asset server"
	@echo ""
	@echo "  Variables"
	@echo ""
	@echo "    PORT  Port to run the asset server on"

# END-EVAL

REPO_URL = https://github.com/OCR-D/assets/raw/master/data/

# Port to run the asset server on
PORT=5001

# Copy test fixtures to another dir and replace URL
.PHONY: dist
dist:
	mkdir -p $@
	cp -r data/* $@
	sed -i 's,$(REPO_URL),http://localhost:$(PORT)/,' $@/**/*.xml

# Start the asset server
start: dist
	find $(PWD)/dist -name '*.xml'
	cd dist && python2 -m SimpleHTTPServer $(PORT)
