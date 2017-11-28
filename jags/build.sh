#!/bin/bash

export MKL="-L$PREFIX/lib -lmkl_rt -liomp5 -lpthread"

./configure --prefix=$PREFIX --with-blas="$MKL"
make
make install
