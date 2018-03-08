#!/bin/bash
cd $SRC_DIR/c++
./configure --prefix=$PREFIX --without-debug --with-mt --without-boost
make -j"${CPU_COUNT}"
mv $SRC_DIR/c++/ReleaseMT/bin/* $PREFIX/bin/
