#!/bin/bash
./configure --prefix=$PREFIX --disable-manpages --enable-introspection=yes
make -j${CPU_COUNT}
make install
