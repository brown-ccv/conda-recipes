#!/bin/bash
make -j"${CPU_COUNT}" prefix="${PREFIX}" install
mkdir -p ${PREFIX}/lib
cp libbam.a ${PREFIX}/lib/
mkdir -p ${PREFIX}/include/bam
cp *.h ${PREFIX}/include/bam/
