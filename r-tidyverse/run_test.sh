#!/bin/bash
set -e
PACKAGES=`R -q -e 'installed.packages()[,0]' | grep -v '^>'`
echo $PACKAGES
for package in $PACKAGES
do
  if [ "$package" != "tcltk" ]
  then
    R -e "library('$package')"
  fi
done
