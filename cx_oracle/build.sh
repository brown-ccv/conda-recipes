#!/bin/bash

export ORACLE_HOME=/opt/instantclient_12_2
echo $ORACLE_HOME

$PYTHON setup.py install

# Add more build steps here, if they are necessary.

# See
# http://docs.continuum.io/conda/build.html
# for a list of environment variables that are set during the build process.
