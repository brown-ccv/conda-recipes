#! /bin/bash

set -e

export CC=gcc
export CXX=g++
export CPATH=$PREFIX/include
export LD_RUN_PATH=$PREFIX/lib
export LD_LIBRARY_PATH=$PREFIX/lib

mkdir build && cd build

cmake -G "$CMAKE_GENERATOR" \
      -D CMAKE_PREFIX_PATH=$PREFIX \
      -D CMAKE_INSTALL_LIBDIR:PATH=$PREFIX/lib \
      -D CMAKE_INSTALL_PREFIX=$PREFIX \
      -D ENABLE_XPDF_HEADERS=True \
      -D ENABLE_LIBCURL=True \
      -D ENABLE_LIBOPENJPEG=openjpeg2 \
       $SRC_DIR

make -j$CPU_COUNT
# ctest  # no tests were found :-/
make install

#pushd ${PREFIX}
#  rm -rf lib/libpoppler*.la lib/libpoppler*.a share/gtk-doc
#popd
