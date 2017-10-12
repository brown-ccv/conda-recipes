#!/bin/bash
set -e

export CC=gcc
export CXX=g++

make

cd python-package
pip install --no-deps .
