#!/bin/bash

set -x -e

export CC=${PREFIX}/bin/gcc
export CXX=${PREFIX}/bin/g++
export INCLUDE_PATH="${PREFIX}/include"
export LIBRARY_PATH="${PREFIX}/lib"
export LD_LIBRARY_PATH="${PREFIX}/lib"

export LDFLAGS="-L${PREFIX}/lib"
export CPPFLAGS="-I${PREFIX}/include"

BINARY=Trinity
BINARY_HOME=$PREFIX/bin
TRINITY_HOME=$PREFIX/opt/trinity-$PKG_VERSION

cd $SRC_DIR

make CXXFLAGS=-fopenmp

# remove the sample data
rm -rf $SRC_DIR/sample_data

# remove .git directory
rm -rf $SRC_DIR/trinity-plugins/htslib/.git

# copy source to bin
mkdir -p $PREFIX/bin
mkdir -p $TRINITY_HOME
cp -R $SRC_DIR/* $TRINITY_HOME/
cd $TRINITY_HOME && chmod +x Trinity
cd $BINARY_HOME && ln -s $TRINITY_HOME/Trinity $BINARY
ln -s $TRINITY_HOME/util/* .
ln -s $TRINITY_HOME/Analysis/DifferentialExpression/PtR
ln -s $TRINITY_HOME/Analysis/DifferentialExpression/run_DE_analysis.pl
ln -s $TRINITY_HOME/Analysis/DifferentialExpression/analyze_diff_expr.pl
ln -s $TRINITY_HOME/Analysis/DifferentialExpression/define_clusters_by_cutting_tree.pl
ln -s $TRINITY_HOME/util/support_scripts/get_Trinity_gene_to_trans_map.pl
