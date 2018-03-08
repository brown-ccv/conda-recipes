#!/usr/bin/env bash

set -x -e

pushd $SRC_DIR

binaries="\
convert-sam-for-rsem \
rsem-bam2readdepth \
rsem-bam2wig \
rsem-build-read-index \
rsem-calculate-credibility-intervals \
rsem-calculate-expression \
rsem-control-fdr \
rsem-extract-reference-transcripts \
rsem-gen-transcript-plots \
rsem-generate-data-matrix \
rsem-generate-ngvector \
rsem-get-unique \
rsem-gff3-to-gtf \
rsem-parse-alignments \
rsem-plot-model \
rsem-plot-transcript-wiggles \
rsem-prepare-reference \
rsem-preref \
rsem-refseq-extract-primary-assembly \
rsem-run-ebseq \
rsem-run-em \
rsem-run-gibbs \
rsem-sam-validator \
rsem-scan-for-paired-end-reads \
rsem-simulate-reads \
rsem-synthesis-reference-transcripts \
rsem-tbam2gbam \
rsem_perl_utils.pm \
"

export INCLUDE_PATH="${PREFIX}/include"
export LIBRARY_PATH="${PREFIX}/lib"
export LD_LIBRARY_PATH="${PREFIX}/lib"

export LDFLAGS="-L${PREFIX}/lib"
export CPPFLAGS="-I${PREFIX}/include"
export CFLAGS="-I${PREFIX}/include"

########################################################
### Prepare Samtools/Htslib 
########################################################

sed -i.bak 's/^CPPFLAGS =$//g' samtools-1.3/Makefile
sed -i.bak 's/^LDFLAGS  =$//g' samtools-1.3/Makefile

sed -i.bak 's/^CPPFLAGS =$//g' samtools-1.3/htslib-1.3/Makefile
sed -i.bak 's/^LDFLAGS  =$//g' samtools-1.3/htslib-1.3/Makefile

# varfilter.py in install fails because we don't install Python
sed -i.bak 's#misc/varfilter.py##g' samtools-1.3/Makefile

# Remove rdynamic which can cause build issues on OSX
# https://sourceforge.net/p/samtools/mailman/message/34699333/
sed -i.bak 's/ -rdynamic//g' samtools-1.3/Makefile
sed -i.bak 's/ -rdynamic//g' samtools-1.3/htslib-1.3/configure

#########################################################
#### Build htslib 
#########################################################
cd samtools-1.3/htslib-1.3
./configure --prefix=$PREFIX CFLAGS="-I$PREFIX/include" LDFLAGS="-L$PREFIX/lib"
make

########################################################
### Build samtools 
########################################################

cd ..
# Problem with ncurses from default channel we now get in bioconda so skip tview
# https://github.com/samtools/samtools/issues/577
# I get weird errors when trying to enable libcurl
./configure --prefix=$PREFIX  --without-curses
make
#make install prefix=$PREFIX


########################################################
### Build rsem
########################################################

cd ..

BINDIR=$PREFIX/bin
mkdir -p $BINDIR

make

for i in $binaries; do cp $i $BINDIR/ && chmod a+x $BINDIR/$(basename $i); done
