#!/bin/bash

# Download extra sources
CONDA_PYTHON=$(conda info --root)/bin/python
${CONDA_PYTHON} ${RECIPE_DIR}/download-extra-sources.py

ln -s gmp-* gmp
ln -s mpc-* mpc
ln -s mpfr-* mpfr
ln -s isl-* isl

# Install gcc to its very own prefix.
# GCC must not be installed to the same prefix as the environment,
# because $GCC_PREFIX/include is automatically considered to be a
# "system" header path.
# That could cause -I$PREFIX/include to be essentially ignored in users' recipes
# (It would still be on the search path, but it would be in the wrong position in the search order.)

GCC_PREFIX="$PREFIX/gcc"
mkdir "$GCC_PREFIX"

ln -s "$PREFIX/lib" "$PREFIX/lib64"

./configure \
  --prefix="$PREFIX" \
  --with-gxx-include-dir="$GCC_PREFIX/include/c++" \
  --enable-checking=release \
  --enable-languages=c,c++,fortran \
  --disable-multilib

make -j"$CPU_COUNT"
make install-strip
