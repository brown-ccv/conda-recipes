#!/bin/bash

export PYTHON=$(which python2.7)
npm config set python $PYTHON -g

CPATH=$PREFIX/include \
LD_RUN_PATH=$PREFIX/lib \
LD_LIBRARY_PATH=$PREFIX/lib \
  script/build --install=$PREFIX

