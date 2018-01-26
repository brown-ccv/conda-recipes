#!/bin/bash
set -e
export CC=$PREFIX/bin/gcc
export CPATH=$PREFIX/include
export LD_RUN_PATH=$PREFIX/lib
./configure --prefix=$PREFIX
make
make install
