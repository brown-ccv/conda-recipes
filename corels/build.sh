#!/bin/bash
cd src
make CFLAGS="-I${PREFIX}/include -I. -DGMP" LIBS="-L${PREFIX}/lib -lgmpxx -lgmp"
cp corels $PREFIX/bin
