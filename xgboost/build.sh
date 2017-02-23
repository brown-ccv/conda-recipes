#!/bin/bash
set -e

wget https://github.com/dmlc/dmlc-core/archive/78b78be34ac27d30f2193f3d51848c62887669c4.zip
wget https://github.com/dmlc/rabit/archive/a9a2a69dc1144180a43f7d2d1097264482be7817.zip

unzip 78b78be34ac27d30f2193f3d51848c62887669c4.zip
rm -rf dmlc-core
mv dmlc-core-* dmlc-core

unzip a9a2a69dc1144180a43f7d2d1097264482be7817.zip
rm -rf rabit
mv rabit-* rabit

make

cd python-package
$PYTHON setup.py install
