#!/bin/bash

export USER=conda

make all

mkdir -p $PREFIX/include/tao

cp -R include/tao/* $PREFIX/include/tao

mkdir -p $PREFIX/lib

cp -R build/lib/* $PREFIX/lib/
