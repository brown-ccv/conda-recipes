#!/bin/bash
set -e
export CC=$PREFIX/bin/gcc
./configure --prefix=$PREFIX
make
make install
