#!/bin/bash
set -e

export CPATH=$PREFIX/include
export LD_RUN_PATH=$PREFIX/lib
export LD_LIBRARY_PATH=$PREFIX/lib
export MKL="-Wl,--no-as-needed -lmkl_intel_lp64 -lmkl_gnu_thread -lmkl_core -lgomp -lpthread -lm -ldl"

export CXXFLAGS=$(echo $CXXFLAGS | sed 's/ -std=c++17//')

# If lib/R/etc/javaconf ends up with anything other than ~autodetect~
# for any value (except JAVA_HOME) then 'R CMD javareconf' will never
# change it, so we prevent configure from finding Java.  post-install
# and activate scripts now call 'R CMD javareconf'.
unset JAVA_HOME

# This is needed to force pkg-config to *also* search for system libraries.
# We cannot use cairo without this since it depends on a good few X11 things.
# export PKG_CONFIG_PATH=/usr/lib/pkgconfig

mkdir -p $PREFIX/lib

./configure --prefix=${PREFIX}              \
            --enable-shared                 \
            --enable-R-shlib                \
            --enable-BLAS-shlib             \
            --disable-prebuilt-html         \
            --enable-memory-profiling       \
            --with-pic                      \
            --without-x                     \
            --without-cairo                 \
            --without-tcltk                 \
            --with-blas="$MKL"              \
            --with-lapack                   \
            LIBnn=lib

make -j${CPU_COUNT}
# echo "Running make check-all, this will take some time ..."
# make check-all -j1 V=1 > $(uname)-make-check.log 2>&1 || make check-all -j1 V=1 > $(uname)-make-check.2.log 2>&1

make install

ACTIVATE_DIR=$PREFIX/etc/conda/activate.d
DEACTIVATE_DIR=$PREFIX/etc/conda/deactivate.d
mkdir -p $ACTIVATE_DIR
mkdir -p $DEACTIVATE_DIR

cp "${RECIPE_DIR}"/activate-${PKG_NAME}.sh ${PREFIX}/etc/conda/activate.d/activate-${PKG_NAME}.sh
cp "${RECIPE_DIR}"/deactivate-${PKG_NAME}.sh ${PREFIX}/etc/conda/deactivate.d/deactivate-${PKG_NAME}.sh
