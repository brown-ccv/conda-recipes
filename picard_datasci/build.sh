#!/bin/bash

OPT=$PREFIX/opt/picard-$PKG_VERSION

mkdir -p $PREFIX/bin
mkdir -p $OPT

cp picard.jar $OPT/picard-${PKG_VERSION}.jar

# create helper script in bin
echo "#!/bin/sh
java -jar $OPT/picard-${PKG_VERSION}.jar \"\$@\"" >$PREFIX/bin/picard

chmod 755 $PREFIX/bin/picard
