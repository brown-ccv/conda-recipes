#!/bin/bash
set -e

# addded options
# - fts5
# - json
# - soundex
# Options from: http://charlesleifer.com/blog/using-the-sqlite-json1-and-fts5-extensions-with-python/
export CFLAGS="-DSQLITE_ENABLE_FTS5 \
-DSQLITE_ENABLE_JSON1 \
-DSQLITE_SOUNDEX \
"
LIBS="-lm" ./configure --prefix=$PREFIX --enable-static --enable-shared
make
make install
