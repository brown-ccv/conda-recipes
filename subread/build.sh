#!/bin/bash

TGT="$PREFIX/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM"
mkdir -p "$TGT"
mkdir -p "${PREFIX}/bin"

cd src ; make -f Makefile.Linux
cd ..

cp -r *  $TGT/
ln -s $TGT/bin/* $PREFIX/bin
#chmod 0755 "${PREFIX}/bin/"
ls -l $TGT/

