#!/bin/bash
if [ $(uname) == "Darwin" ]; then
  export LDFLAGS="$LDFLAGS -Wl,-rpath,$PREFIX/lib"
  export CFLAGS=$CFLAGS" -I${PREFIX}/include"
  ./configure --prefix=$PREFIX
else
  ./configure --prefix=$PREFIX
fi
make
make install
