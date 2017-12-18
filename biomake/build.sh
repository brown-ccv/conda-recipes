#!/bin/bash
INSTALL=$PREFIX/opt/$PKG_NAME-$PKG_VERSION
mkdir -p $INSTALL
cp -R $SRC_DIR/* $INSTALL/
chmod a+x $INSTALL/bin/*
mkdir -p $PREFIX/bin
cd $INSTALL/bin
for f in *
do
  ln -s $INSTALL/bin/$f $PREFIX/bin/$f
done
