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

# Port to run the asset server on
PORT=5001

# Copy test fixtures to another dir and replace URL
dist:
	mkdir -p $@
	cp -r data/* $@
	sed -i 's,https://github.com/OCR-D/spec/raw/master/io/example/,http://localhost:$(PORT)/,' $@/*.xml

# Start the asset server
start:
	find $(PWD)/dist -name '*.xml'
	cd dist && python2 -m SimpleHTTPServer $(PORT)
