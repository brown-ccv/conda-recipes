#!/bin/bash
cd $PREFIX/lib/R/library/
tar --strip-components=3 -xf $HOME/cran.tar home/conda/R_libs
