#!/bin/bash

export LD_LIBRARY_PATH=$(pwd)

# world-writable files are not allowed
chmod -R o-w $SRC_DIR

# Give install_name_tool enough room to work its magic
if [ `uname -s` == "Darwin" ]; then
    export LDFLAGS="${LDFLAGS} -Wl,-headerpad_max_install_names"
fi

sh Configure -Dusethreads -Duserelocatableinc -Dprefix=$PREFIX -de -Aldflags="$LDFLAGS"
make
make test
# change permissions again after building
chmod -R o-w $SRC_DIR
#mypath="/conda/bin:/usr/bin:/bin:/usr/local/bin/:/usr/local/sbin:/sbin"
#(
#PATH=$mypath
#make test
#)
make install
