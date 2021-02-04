# OCR-D/assets

> Test data for testing specs and software in @OCR-D

[![CircleCI](https://circleci.com/gh/OCR-D/assets.svg?style=svg)](https://circleci.com/gh/OCR-D/assets)

* [SBB0000F29300010000](./data/SBB0000F29300010000/): Pages 1-5 of [http://resolver.staatsbibliothek-berlin.de/SBB0000F29300010000](http://resolver.staatsbibliothek-berlin.de/SBB0000F29300010000)
* [kant_aufklaerung_1784](./data/kant_aufklaerung_1784): [https://www.deutschestextarchiv.de/book/show/kant_aufklaerung_1784](https://www.deutschestextarchiv.de/book/show/kant_aufklaerung_1784), with TIFF compressed with JPEG + METS for second page
* [kant_aufklaerung_1784-binarized](./data/kant_aufklaerung_1784-binarized): [https://www.deutschestextarchiv.de/book/show/kant_aufklaerung_1784](https://www.deutschestextarchiv.de/book/show/kant_aufklaerung_1784), with binarized/gray produced by ocropus-nlbin + METS for all
* [kant_aufklaerung_1784-complex](./data/kant_aufklaerung_1784-complex): Result of running https://github.com/bertsky/workflow-configuration/blob/master/crop-anyocr-binarize-page-olena-sauvola-denoise-ocropy-deskew-page-ocropy-segment-tesseract-ocropy-dewarp-ocr-ocropy-tesseract.mk on kant_aufklaerung_1784
* [kant_aufklaerung_1784-page-block-line-word_glyph](./data/kant_aufklaerung_1784-page-block-line-word_glyph): Sample Page file with region, word and glyphs.
* [test.ocrd.zip](./data/test.ocrd.zip): OCRD-ZIP of `kant_aufklaerung_1784`.
* [param-binarize.json](./data/param-binarize.json): Sample parameter JSON file
* [sample_bagit-with-fetch](./data/sample_bagit-with-fetch): OCRD-ZIP of `PPN595930174` (simplified to file group GDZOCR and PRESENTATION).
* [dfki-testdata](./data/sample_bagit-with-fetch/dfki-testdata): Test assets from https://github.com/syedsaqibbukhari/docanalysis
* [pembroke_werke_1766](./data/pembroke_werke_1766): Page 10 of [http://resolver.staatsbibliothek-berlin.de/SBB0001CA7900000000](http://resolver.staatsbibliothek-berlin.de/SBB0001CA7900000000)
* [column-samples](./data/column-samples/): Samples for column detection
* [DIBCO11-machine_printed](./data/DIBCO11-machine_printed): Test set for the [DIBCO11 challenge](http://utopia.duth.gr/~ipratika/DIBCO2011/benchmark/)
* [page_dewarp](./data/page_dewarp/): Dewarping samples [by @mzucker](https://github.com/mzucker/page_dewarp)
* [leptonica_samples](./data/leptonica_samples/): Sample facsimile from the [leptonica computer vision library](https://github.com/DanBloomberg/leptonica)

