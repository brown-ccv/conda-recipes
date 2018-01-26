#!/bin/bash
set -e
export LD_LIBRARY_PATH=$HOME/miniconda2/lib
./autogen.sh
./configure --prefix=$PREFIX
make
make install
