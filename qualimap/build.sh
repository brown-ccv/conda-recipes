#!/bin/bash

TGT="$PREFIX/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM"
mkdir -p "$TGT"
mkdir -p "${PREFIX}/bin"

cd "${SRC_DIR}" 
#cp -rvp scripts $TGT
#cp -rvp species $TGT
#cp -rvp lib/*.jar $TGT
#cp *.jar $TGT
cp -rvp * $TGT

cp $RECIPE_DIR/qualimap.py $TGT/qualimap

ln -s $TGT/qualimap $PREFIX/bin
chmod 0755 "${PREFIX}/bin/qualimap"

ls -l $TGT/
