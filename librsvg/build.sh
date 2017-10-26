#!/bin/bash
if [ $(uname) == "Darwin" ]; then
  export LDFLAGS=$LDFLAGS" -L$PREFIX/lib -Wl,-rpath,$PREFIX/lib"
  export CFLAGS=$CFLAGS" -I${PREFIX}/include"
  ./configure \
      --prefix=$PREFIX \
      --disable-Bsymbolic \
      --enable-tools=yes \
      --enable-pixbuf-loader=yes \
      --enable-introspection=yes
else
  ./configure \
      --prefix=$PREFIX \
      --enable-tools=yes \
      --enable-pixbuf-loader=yes \
      --enable-introspection=yes
fi
make
make install
