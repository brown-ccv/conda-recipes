#!/bin/bash
./autogen.sh
LIBLEPT_HEADERSDIR=$PREFIX/include ./configure --prefix=$PREFIX --with-extra-libraries=$PREFIX/lib
LDFLAGS="-L$PREFIX/lib" CFLAGS="-I$PREFIX/include" make
make install

# download language data
curl -L https://github.com/tesseract-ocr/tessdata/raw/4592b8d453889181e01982d22328b5846765eaad/eng.traineddata >$PREFIX/share/tessdata/eng.traineddata

# set TESSDATA_PREFIX

ACTIVATE_DIR=$PREFIX/etc/conda/activate.d
DEACTIVATE_DIR=$PREFIX/etc/conda/deactivate.d
mkdir -p $ACTIVATE_DIR
mkdir -p $DEACTIVATE_DIR

echo 'if [[ -z "$TESSDATA_PREFIX" ]]; then
  export TESSDATA_PREFIX=$CONDA_PREFIX/share
  export _CONDA_SET_TESSDATA_PREFIX=1
fi' >"$ACTIVATE_DIR/tessdata.sh"

echo 'if [[ -n "$_CONDA_SET_TESSDATA_PREFIX" ]]; then
  unset TESSDATA_PREFIX
  unset _CONDA_SET_TESSDATA_PREFIX
fi' >"$DEACTIVATE_DIR/tessdata.sh"
