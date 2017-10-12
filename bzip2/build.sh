#!/bin/sh

# toolchain flags + bzip flags + fpic
export CFLAGS="${CFLAGS} -Wall -Winline -O2 -g -D_FILE_OFFSET_BITS=64 -fPIC"

make install PREFIX=${PREFIX} CFLAGS="$CFLAGS"

# build shared library
if test `uname` = "Linux"
then
  make -f Makefile-libbz2_so CFLAGS="$CFLAGS"
  ln -s libbz2.so.${PKG_VERSION} libbz2.so
  cp -d libbz2.so* $PREFIX/lib/
else  # macOS
  $CC -shared -Wl,-install_name -Wl,libbz2.dylib -o libbz2.${PKG_VERSION}.dylib blocksort.o huffman.o crctable.o randtable.o compress.o decompress.o bzlib.o
  cp libbz2.${PKG_VERSION}.dylib $PREFIX/lib/
  ln -s libbz2.${PKG_VERSION}.dylib $PREFIX/lib/libbz2.dylib
fi
