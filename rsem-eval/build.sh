#!/bin/sh
set -x -e

export INCLUDE_PATH="${PREFIX}/include"
export LIBRARY_PATH="${PREFIX}/lib"
export LD_LIBRARY_PATH="${PREFIX}/lib"

export LDFLAGS="-L${PREFIX}/lib "
export CPPFLAGS="-I${PREFIX}/include"
export CFLAGS="$CPPFLAGS"

export CFLAGS_EXTRA="${LDFLAGS} ${CPPFLAGS}"

RSEM_EVAL_HOME=$PREFIX/opt/rsem-eval-$PKG_VERSION

# fix local bam
sed -i.bak 's|D_CURSES_LIB=1|D_CURSES_LIB=0|' rsem-eval/sam/Makefile
sed -i.bak 's|^LIBCURSES|#LIBCURSES|' rsem-eval/sam/Makefile

# disable ref-eval
touch ref-eval/finished
make

mkdir -p $PREFIX/bin
mkdir -p $RSEM_EVAL_HOME/bin

# disable ref-eval
#cp -rf ref-eval/ref-eval $PREFIX/bin/
#cp -rf ref-eval/ref-eval-estimate-true-assembly $PREFIX/bin/

cp -rf rsem-eval/rsem-build-read-index $RSEM_EVAL_HOME/bin/
cp -rf rsem-eval/rsem-eval-calculate-score $RSEM_EVAL_HOME/bin/
cp -rf rsem-eval/rsem-eval-estimate-transcript-length-distribution $RSEM_EVAL_HOME/bin/
cp -rf rsem-eval/rsem-eval-run-em $RSEM_EVAL_HOME/bin/
cp -rf rsem-eval/rsem-extract-reference-transcripts $RSEM_EVAL_HOME/bin/
cp -rf rsem-eval/rsem-parse-alignments $RSEM_EVAL_HOME/bin/
cp -rf rsem-eval/rsem_perl_utils.pm $RSEM_EVAL_HOME/bin/
cp -rf rsem-eval/rsem-plot-model $RSEM_EVAL_HOME/bin/
cp -rf rsem-eval/rsem-preref $RSEM_EVAL_HOME/bin/
cp -rf rsem-eval/rsem-sam-validator $RSEM_EVAL_HOME/bin/
cp -rf rsem-eval/rsem-scan-for-paired-end-reads $RSEM_EVAL_HOME/bin/
cp -rf rsem-eval/rsem-simulate-reads $RSEM_EVAL_HOME/bin/
cp -rf rsem-eval/rsem-synthesis-reference-transcripts $RSEM_EVAL_HOME/bin/

cd $PREFIX/bin && ln -s $RSEM_EVAL_HOME/bin/rsem-eval-calculate-score .
