#!/bin/bash
./autobuild
LDFLAGS="-Wl,-rpath -Wl,$PREFIX/lib" CFLAGS="-I$PREFIX/include" sh ./configure --prefix=$PREFIX
make
make install
