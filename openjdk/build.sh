#!/bin/bash

bash ./configure \
	--with-update-version=121 \
	--with-build-number=b13 \
	--with-milestone=conda \
	--with-freetype=$PREFIX \
	--with-freetype-include=$PREFIX/include/freetype2 \
  --disable-freetype-bundling \
	--with-zlib=system \
	--prefix=$SRC_DIR/stage \
	--with-extra-ldflags="-liconv"
make install

# clean up and copy only jre
find $SRC_DIR/stage/jvm/openjdk-*/jre -iname \*.diz -delete
mv $SRC_DIR/stage/jvm/openjdk-*/jre $PREFIX/
mkdir -p $PREFIX/bin
cd $PREFIX/bin && ln -s ../jre/bin/* .

# ensure that JAVA_HOME is set correctly
mkdir -p $PREFIX/etc/conda/activate.d
echo 'export JAVA_HOME_CONDA_BACKUP=$JAVA_HOME' > "$PREFIX/etc/conda/activate.d/java_home.sh"
echo 'export JAVA_HOME=$CONDA_PREFIX/jre' >> "$PREFIX/etc/conda/activate.d/java_home.sh"
mkdir -p $PREFIX/etc/conda/deactivate.d
echo 'export JAVA_HOME=$JAVA_HOME_CONDA_BACKUP' > "$PREFIX/etc/conda/deactivate.d/java_home.sh"

# add minimal fonts
mkdir -p $PREFIX/jre/lib/fonts
cd $PREFIX/jre/lib/fonts
curl -L -O -C - http://sourceforge.net/projects/dejavu/files/dejavu/2.36/dejavu-fonts-ttf-2.36.tar.bz2
tar -xjvpf dejavu-fonts-ttf-2.36.tar.bz2
mv dejavu-fonts-ttf-*/ttf/* .
rm -rf dejavu-fonts-ttf-*
