#!/bin/bash
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_SKIP_RPATH=TRUE
make
make install
