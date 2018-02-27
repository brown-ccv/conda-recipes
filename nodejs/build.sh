#!/bin/bash
set -e
./configure --prefix=$PREFIX
make -j${CPU_COUNT}
make install
