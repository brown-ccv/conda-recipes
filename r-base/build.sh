#!/bin/bash

#aclocal -I m4
#autoconf

# Without setting these, R goes off and tries to find things on its own, which
# we don't want (we only want it to find stuff in the build environment).

export CFLAGS="-I$PREFIX/include"
export CPPFLAGS="-I$PREFIX/include"
export FFLAGS="-I$PREFIX/include -L$PREFIX/lib"
export FCFLAGS="-I$PREFIX/include -L$PREFIX/lib"
export OBJCFLAGS="-I$PREFIX/include"
export CXXFLAGS="-I$PREFIX/include"
export LDFLAGS="$LDFLAGS -L$PREFIX/lib"
export LAPACK_LDFLAGS="-L$PREFIX/lib"
export PKG_CPPFLAGS="-I$PREFIX/include"
export PKG_LDFLAGS="-L$PREFIX/lib"
export TCL_CONFIG=$PREFIX/lib/tclConfig.sh
export TK_CONFIG=$PREFIX/lib/tkConfig.sh
export TCL_LIBRARY=$PREFIX/lib/tcl8.5
export TK_LIBRARY=$PREFIX/lib/tk8.5
#export MKL="-L$PREFIX/lib -lmkl_rt -liomp5 -lpthread"
export LD_RUN_PATH=$PREFIX/lib
export MKL="-Wl,--no-as-needed -lmkl_gf_lp64 -Wl,--start-group -lmkl_gnu_thread  -lmkl_core  -Wl,--end-group -fopenmp  -ldl -lpthread -lm"

# If lib/R/etc/javaconf ends up with anything other than ~autodetect~
# for any value (except JAVA_HOME) then 'R CMD javareconf' will never
# change it, so we prevent configure from finding Java.  post-install
# and activate scripts now call 'R CMD javareconf'.
unset JAVA_HOME

# This is needed to force pkg-config to *also* search for system libraries.
# We cannot use cairo without this since it depends on a good few X11 things.
export PKG_CONFIG_PATH=/usr/lib/pkgconfig

mkdir -p $PREFIX/lib

./configure --prefix=${PREFIX}              \
            --enable-shared                 \
            --enable-R-shlib                \
            --enable-BLAS-shlib             \
            --disable-prebuilt-html         \
            --enable-memory-profiling       \
            --with-tk-config=${TK_CONFIG}   \
            --with-tcl-config=${TCL_CONFIG} \
            --with-x                        \
            --with-pic                      \
            --with-cairo                    \
            --with-curses                   \
            --with-readline                 \
            --with-tcltk                    \
            --with-recommended-packages=no  \
            --with-blas="$MKL"              \
            --with-lapack                   \
            LIBnn=lib

if cat src/include/config.h | grep "undef HAVE_PANGOCAIRO"; then
    echo "Did not find pangocairo, refusing to continue"
    cat config.log | grep pango
    exit 1
fi

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
