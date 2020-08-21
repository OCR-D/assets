# BEGIN-EVAL makefile-parser --make-help Makefile

help:
	@echo ""
	@echo "  Targets"
	@echo ""
	@echo "    migrate-2020-08-21  Add PAGE-XML files"
	@echo ""
	@echo "  Variables"
	@echo ""

# END-EVAL

# Add PAGE-XML files
migrate-2020-08-21: CAT_PARAM := -P command 'cat @INFILE > @OUTFILE'
migrate-2020-08-21: FEAT_PARAM := -P output_feature_added
migrate-2020-08-21:
	cd data; ocrd-preprocess-image $(CAT_PARAM) -I OCR-D-IMG            -O MAX     $(FEAT_PARAM) ''
	cd data; ocrd-preprocess-image $(CAT_PARAM) -I OCR-D-IMG-BIN        -O BIN     $(FEAT_PARAM) 'binarized'
	cd data; ocrd-preprocess-image $(CAT_PARAM) -I OCR-D-IMG-BIN-NRM    -O BIN-NRM $(FEAT_PARAM) 'grayscale_normalized'
	cd data; ocrd-preprocess-image $(CAT_PARAM) -I OCR-D-IMG-DESKEW     -O DESKEW  $(FEAT_PARAM) 'binarized,deskewed'
	cd data; ocrd-preprocess-image $(CAT_PARAM) -I OCR-D-IMG-CROP       -O CROP    $(FEAT_PARAM) 'binarized,deskewed,cropped'
	cd data; ocrd-preprocess-image $(CAT_PARAM) -I OCR-D-IMG-DEWARP     -O DEWARP  $(FEAT_PARAM) 'binarized,deskewed,cropped,dewarped'
	cd data; ocrd workspace remove \
		becker_quaestio_1586_00013.tiff \
		becker_quaestio_1586_00013.bin \
		becker_quaestio_1586_00013.ds \
		becker_quaestio_1586_00013.dw \
		becker_quaestio_1586_00013.nrm \
		becker_quaestio_1586_00013.pf


