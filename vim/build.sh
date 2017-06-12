#!/bin/sh

export CFLAGS=-I${PREFIX}/include
export LDFLAGS=-L${PREFIX}/lib

./configure --prefix=${PREFIX}       \
            --without-x              \
            --without-gnome          \
            --without-tclsh          \
            --without-local-dir      \
            --enable-gui=no          \
            --enable-cscope          \
            --enable-pythoninterp=yes

make
make install

