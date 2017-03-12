#!/bin/bash
./autogen.sh
LIBLEPT_HEADERSDIR=$PREFIX/include ./configure --prefix=$PREFIX --with-extra-libraries=$PREFIX/lib
#mkdir build
#cd build
#cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_SKIP_RPATH=TRUE
#make
LDFLAGS="-L$PREFIX/lib" CFLAGS="-I$PREFIX/include" make
make install
