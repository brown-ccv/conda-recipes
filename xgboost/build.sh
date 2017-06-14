#!/bin/bash
set -e

DMLC_CORE_HASH=78b78be34ac27d30f2193f3d51848c62887669c4
RABIT_HASH=a9a2a69dc1144180a43f7d2d1097264482be7817

curl -L https://github.com/dmlc/dmlc-core/archive/${DMLC_CORE_HASH}.zip -o dmlc-core.zip
curl -L https://github.com/dmlc/rabit/archive/${RABIT_HASH}.zip -o rabit.zip

unzip dmlc-core.zip
rm -rf dmlc-core
mv dmlc-core-* dmlc-core

unzip rabit.zip
rm -rf rabit
mv rabit-* rabit

export CC=gcc
export CXX=g++

make

cd python-package
$PYTHON setup.py install
