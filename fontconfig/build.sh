#!/bin/bash

if [[ `uname` == 'Darwin' ]];
then
    export LIBRARY_SEARCH_VAR=DYLD_FALLBACK_LIBRARY_PATH
elif [[ `uname` == 'Linux' ]];
then
    export LIBRARY_SEARCH_VAR=LD_LIBRARY_PATH
fi

sed -i.orig s:'@PREFIX@':"${PREFIX}":g src/fccfg.c

chmod +x configure

./configure --prefix "${PREFIX}" \
	    --enable-libxml2 \
	    --disable-docs \
            --with-default-fonts="${PREFIX}/share/fonts"

make
eval ${LIBRARY_SEARCH_VAR}="${PREFIX}/lib" make check
eval ${LIBRARY_SEARCH_VAR}="${PREFIX}/lib" make install

# Remove computed cache with local fonts
rm -Rf "${PREFIX}/var/cache/fontconfig"

# Leave cache directory, in case it's needed
#mkdir -p "${PREFIX}/var/cache/fontconfig"
#touch "${PREFIX}/var/cache/fontconfig/.leave"

# add minimal fonts
mkdir -p $PREFIX/share/fonts
cd $PREFIX/share/fonts
curl -L -O -C - http://sourceforge.net/projects/dejavu/files/dejavu/2.36/dejavu-fonts-ttf-2.36.tar.bz2
tar -xjvpf dejavu-fonts-ttf-2.36.tar.bz2
mv dejavu-fonts-ttf-*/ttf/* .
rm -rf dejavu-fonts-ttf-*
$PREFIX/bin/fc-cache $PREFIX/share/fonts
