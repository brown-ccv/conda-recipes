#!/bin/bash

set -e

chmod +x configure

export CC=$PREFIX/bin/gcc

DISABLES="--disable-cairo --disable-opencl --disable-cuda --disable-nvml"
DISABLES="$DISABLES --disable-gl --disable-libnuma --disable-libudev"

./configure --prefix=$PREFIX $DISABLES
make
make install
