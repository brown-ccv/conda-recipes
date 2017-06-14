#!/bin/bash
mkdir build
cd build
export CC=gcc
export CXX=g++
cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX
make
make install
