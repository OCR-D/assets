#!/usr/bin/env bash

set -ex

cd data/scribo-test/data
rm mets.xml
rm -rf OCR-D-IMG-*
ocrd workspace init .
ocrd workspace set-id 'urn:ocr-d/scribo'
ocrd workspace add -g page -m image/tiff -G OCR-D-IMG -i OCR-D-IMG-orig_tiff OCR-D-IMG/OCR-D-IMG-orig_tiff.tif

# from ocrd_olena/test/test.sh
declare -a algos=(sauvola sauvola-ms-fg sauvola-ms sauvola-ms-split wolf niblack kim singh otsu)
for algo in "${algos[@]}";do
    echo >&2 "# Generating $algo"
    ocrd-olena-binarize \
        -m mets.xml \
        -I OCR-D-IMG \
        -O "OCR-D-SEG-PAGE-${algo^^},OCR-D-IMG-BIN-${algo^^}" \
        -p <(echo '{"impl": "'$algo'"}')
done
