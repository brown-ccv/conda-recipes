#!/bin/bash
set -e
conda install -y mercurial
cd $HOME
hg clone http://hg.openjdk.java.net/jdk8u/jdk8u
cd jdk8u
hg up jdk8u121-b13
bash get_source.sh
