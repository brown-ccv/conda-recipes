#!/bin/bash
./configure --enable-sse3 --enable-avx --prefix=$PREFIX
make
make install
