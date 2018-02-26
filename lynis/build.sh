#!/bin/bash

set -e

LYNIS_HOME=$PREFIX/opt/lynis-$PKG_VERSION

mkdir -p $PREFIX/bin
mkdir -p $PREFIX/etc/lynis
mkdir -p $PREFIX/share/man/man8
mkdir -p $PREFIX/share/lynis

# copy source
cd $SRC_DIR
sed -i~ -e "s|/usr/local|$PREFIX|g" -e "s|/usr|$PREFIX|g" lynis
sed -i~ -e "s|tPROFILE_TARGETS=\"/usr/local/etc/lynis /etc/lynis /usr/local/lynis .\"|tPROFILE_TARGETS=\"$PREFIX/etc/lynis\"|" include/functions
chmod a+x lynis
cp -R lynis $PREFIX/bin/
cp -R lynis.8 $PREFIX/share/man/man8/
cp -R db include plugins $PREFIX/share/lynis/
cp -R *.prf $PREFIX/etc/lynis/
