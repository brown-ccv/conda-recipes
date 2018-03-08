#!/bin/bash
FASTQC=$PREFIX/opt/$PKG_NAME-$PKG_VERSION
mkdir -p $FASTQC
cp -R $SRC_DIR/* $FASTQC/
chmod a+x $FASTQC/fastqc
sed -i.bak '1 s|perl|env perl|' $FASTQC/fastqc
rm $FASTQC/fastqc.bak
mkdir -p $PREFIX/bin
ln -s $FASTQC/fastqc $PREFIX/bin/fastqc 
