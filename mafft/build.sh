#!/bin/bash
set -e
cd core
make install CC="$CC" CFLAGS="$CFLAGS" PREFIX="$PREFIX"
