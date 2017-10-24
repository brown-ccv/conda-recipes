#!/bin/bash
if [ $(uname) == "Darwin" ]
then
  ./configure --prefix=$PREFIX --disable-Bsymbolic
else
  ./configure --prefix=$PREFIX
fi
make
make install
