#!/bin/bash

SPARK_HOME=$PREFIX/opt/spark-$PKG_VERSION

mkdir -p $PREFIX/bin
mkdir -p $SPARK_HOME

cp -R * $SPARK_HOME/

cd $PREFIX/bin
ln -s $SPARK_HOME/bin/beeline .
ln -s $SPARK_HOME/bin/find-spark-home .
ln -s $SPARK_HOME/bin/load-spark-env.sh .
ln -s $SPARK_HOME/bin/pyspark .
ln -s $SPARK_HOME/bin/sparkR .
ln -s $SPARK_HOME/bin/spark-class .
ln -s $SPARK_HOME/bin/spark-shell .
ln -s $SPARK_HOME/bin/spark-sql .
ln -s $SPARK_HOME/bin/spark-submit .
