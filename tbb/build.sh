#!/bin/bash
set -e

CXXFLAGS=$(echo $CXXFLAGS | sed 's/-std=c++17/-std=c++11/')

make -j${CPU_COUNT} CXX="$CXX" CXXFLAGS="$CXXFLAGS" LDFLAGS="$LDFLAGS"

install -d ${PREFIX}/lib

cp `find . -name "libtbb*${SHLIB_EXT}*" | grep release` ${PREFIX}/lib

cd ${PREFIX}/lib
ln -sf libtbb.so.2 libtbb.so
ln -sf libtbbmalloc.so.2 libtbbmalloc.so
ln -sf libtbbmalloc_proxy.so.2 libtbbmalloc_proxy.so
cd -

install -d ${PREFIX}/include
cp -r ./include/tbb ${PREFIX}/include

