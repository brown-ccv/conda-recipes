#!/bin/bash

OPT=$PREFIX/opt/trimmomatic-$PKG_VERSION

mkdir -p $PREFIX/bin
mkdir -p $PREFIX/opt

cp -R $SRC_DIR $OPT

# create helper script in bin
echo "#!/bin/sh
java -jar $OPT/trimmomatic-${PKG_VERSION}.jar \"\$@\"" >$PREFIX/bin/trimmomatic

chmod 755 $PREFIX/bin/trimmomatic
