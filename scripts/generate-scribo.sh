#!/usr/bin/env bash

set -ex

cd data/scribo-test/data
rm mets.xml
rm -rf OCR-D-IMG-*
ocrd workspace init .
ocrd workspace set-id 'urn:ocr-d/scribo'
ocrd workspace add -g page -m image/tiff -G OCR-D-IMG -i OCR-D-IMG-orig_tiff OCR-D-IMG/OCR-D-IMG-orig_tiff.tif
ocrd-olena-binarize -l DEBUG -I OCR-D-IMG -O OCR-D-IMG-BIN-SAUVOLA-PAGE,OCR-D-IMG-BIN-SAUVOLA                   -g page -p '{"impl": "sauvola"}'          mets.xml
ocrd-olena-binarize -l DEBUG -I OCR-D-IMG -O OCR-D-IMG-BIN-SAUVOLA-MS-PAGE,OCR-D-IMG-BIN-SAUVOLA-MS             -g page -p '{"impl": "sauvola-ms"}'       mets.xml
ocrd-olena-binarize -l DEBUG -I OCR-D-IMG -O OCR-D-IMG-BIN-SAUVOLA-MS-FG-PAGE,OCR-D-IMG-BIN-SAUVOLA-MS-FG       -g page -p '{"impl": "sauvola-ms-fg"}'    mets.xml
ocrd-olena-binarize -l DEBUG -I OCR-D-IMG -O OCR-D-IMG-BIN-SAUVOLA-MS-SPLIT-PAGE,OCR-D-IMG-BIN-SAUVOLA-MS-SPLIT -g page -p '{"impl": "sauvola-ms-split"}' mets.xml
ocrd-olena-binarize -l DEBUG -I OCR-D-IMG -O OCR-D-IMG-BIN-WOLF-PAGE,OCR-D-IMG-BIN-WOLF                         -g page -p '{"impl": "wolf"}'             mets.xml
ocrd-olena-binarize -l DEBUG -I OCR-D-IMG -O OCR-D-IMG-BIN-NIBLACK-PAGE,OCR-D-IMG-BIN-NIBLACK                   -g page -p '{"impl": "niblack"}'          mets.xml
ocrd-olena-binarize -l DEBUG -I OCR-D-IMG -O OCR-D-IMG-BIN-KIM-PAGE,OCR-D-IMG-BIN-KIM                           -g page -p '{"impl": "kim"}'              mets.xml
ocrd-olena-binarize -l DEBUG -I OCR-D-IMG -O OCR-D-IMG-BIN-SINGH-PAGE,OCR-D-IMG-BIN-SINGH                       -g page -p '{"impl": "singh"}'            mets.xml
ocrd-olena-binarize -l DEBUG -I OCR-D-IMG -O OCR-D-IMG-BIN-OTSU-PAGE,OCR-D-IMG-BIN-OTSU                         -g page -p '{"impl": "otsu"}'             mets.xml

