SHELL = /bin/bash

# BEGIN-EVAL makefile-parser --make-help Makefile

help:
	@echo ""
	@echo "  Targets"
	@echo ""
	@echo "    dist                Copy test fixtures to another dir and replace URL"
	@echo "    start               Start the asset server"
	@echo "    validate-workspace  Validate all assets as workspaces"
	@echo "    validate-ocrdzip    Validate all assets as workspaces"
	@echo ""
	@echo "  Variables"
	@echo ""
	@echo "    PORT  Port to run the asset server on"

# END-EVAL

REPO_URL = https://github.com/OCR-D/assets/raw/master/data/

# Strictness for page consistency checks
PAGE_STRICTNESS = lax

# Port to run the asset server on
PORT=5001

# BagIt update script
SCRIPT_UPDATE_BAGIT = $(PWD)/scripts/update-bagit.sh

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

# Validate all
validate: validate-ocrdzip validate-workspace

WORKSPACE_VALIDATE_FILE = /tmp/ocrd-assets-failed-workspace

# Validate all assets as workspaces
validate-workspace:
	@rm -f $(WORKSPACE_VALIDATE_FILE)
	@find $(PWD)/data -mindepth 1 -maxdepth 1 -type d \
			-not -name '.data' \
			-not -name 'kant_aufklaerung_1784-complex' \
			-not -name 'glyph-consistency' \
			-not -name 'sample_bagit-with-fetch' \
		|while read dataset;do \
		echo -n "Validating workspace $$(basename $$dataset) ... "; \
		report=$$(cd $$dataset/data && \
			ocrd workspace validate \
				--skip pixel_density \
				--skip page \
				--page-coordinate-consistency off \
				--skip url \
				--skip imagefilename \
				--page-strictness $(PAGE_STRICTNESS) \
				mets.xml 2>&1;); \
		if [[ "$$?" == 0 ]];then echo "OK";else echo "FAIL"|tee $(WORKSPACE_VALIDATE_FILE);fi;\
	done
	@if [[ -s $(WORKSPACE_VALIDATE_FILE) ]];then exit 128;fi
	@rm -f $(WORKSPACE_VALIDATE_FILE)

OCRDZIP_VALIDATE_FILE = /tmp/ocrd-assets-failed-ocrdzip

# Validate all assets as workspaces
validate-ocrdzip:
	@rm -f $(OCRDZIP_VALIDATE_FILE)
	@find $(PWD)/data -mindepth 1 -maxdepth 1 -type d \
			-not -name '.data' \
			-not -name 'schema' \
			-not -name 'glyph-consistency' \
			-not -name 'sample_bagit-with-fetch' \
		|while read dataset;do \
		echo -n "Validating ocrdzip $$(basename $$dataset) ... "; \
		report=$$(ocrd zip validate -Z "$$dataset" 2>&1); \
		if [[ "$$?" == 0 ]];then echo "OK";else echo "FAIL"|tee $(OCRDZIP_VALIDATE_FILE);fi;\
	done
	@if [[ -s $(OCRDZIP_VALIDATE_FILE) ]];then exit 128;fi
	@rm -f $(OCRDZIP_VALIDATE_FILE)

# Update those pesky checksums
update-bagit:
	find $(PWD)/data -mindepth 1 -maxdepth 1 -type d \
			-not -name 'BAK' \
			-not -name 'dta19*' \
			-not -name '.*' \
			-not -name 'sample_bagit-with-fetch' \
		|while read dataset;do ( \
			set -x ; \
			cd $$dataset; \
				bash $(SCRIPT_UPDATE_BAGIT); \
				bash $(SCRIPT_UPDATE_BAGIT); \
				echo "Updated $$dataset"; \
		); done


