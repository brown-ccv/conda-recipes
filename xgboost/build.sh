#!/bin/bash
set -e

export CC=gcc
export CXX=g++

make

cd python-package
$PYTHON setup.py install
