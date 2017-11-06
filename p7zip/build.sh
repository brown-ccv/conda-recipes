#!/bin/bash
sed -i.bak "s|DEST_HOME=.*|DEST_HOME=$PREFIX|" makefile.common

make 7za
make install
