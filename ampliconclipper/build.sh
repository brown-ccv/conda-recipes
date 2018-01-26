#!/bin/bash
set -e
CXX=$PREFIX/bin/g++
make
mkdir -p $PREFIX/bin
cp AmpliconClipper $PREFIX/bin/
