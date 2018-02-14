#!/bin/bash
set -e
./configure \
    --enable-shared \
    --enable-netcdf-4 \
    --disable-dap \
    --prefix=$PREFIX
make
make install
