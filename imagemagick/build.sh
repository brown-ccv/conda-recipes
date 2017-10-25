#!/bin/bash

./configure --prefix=${PREFIX} \
  --with-bzlib=${PREFIX} \
  --with-fontconfig=${PREFIX} \
  --with-freetype=${PREFIX} \
  --with-jpeg=${PREFIX} \
  --with-pango=${PREFIX} \
  --with-png=${PREFIX} \
  --with-tiff=${PREFIX} \
  --with-zlib=${PREFIX}
make
make install
