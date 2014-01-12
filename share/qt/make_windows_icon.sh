#!/bin/bash
# create multiresolution windows icon
ICON_SRC=../../src/qt/res/icons/storecoin.png
ICON_DST=../../src/qt/res/icons/storecoin.ico
convert ${ICON_SRC} -resize 16x16 storecoin-16.png
convert ${ICON_SRC} -resize 32x32 storecoin-32.png
convert ${ICON_SRC} -resize 48x48 storecoin-48.png
convert storecoin-16.png storecoin-32.png storecoin-48.png ${ICON_DST}

