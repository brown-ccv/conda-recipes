#!/bin/bash

if [ $(uname) == "Darwin" ]; then
    export LDFLAGS=$LDFLAGS" -L$PREFIX/lib -Wl,-rpath,$PREFIX/lib"
    export CFLAGS=$CFLAGS" -I${PREFIX}/include"
    ./configure --prefix=$PREFIX \
                --with-quartz \
                --disable-debug \
                --disable-java \
                --disable-php \
                --disable-perl \
                --disable-tcl \
                --without-x \
                --without-qt \
                --without-gtk
else
    ./configure --prefix=$PREFIX \
                --disable-debug \
                --disable-java \
                --disable-php \
                --disable-perl \
                --disable-tcl \
                --without-x \
                --without-qt \
                --without-gtk
fi

make
# This is failing for rtest.
# Doesn't do anything for the rest
# make check
make install

dot -c
