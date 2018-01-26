#!/bin/bash
set -e
./autogen.sh
./configure --prefix=$PREFIX
make
make install
