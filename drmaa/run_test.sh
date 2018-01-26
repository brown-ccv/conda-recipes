#!/bin/bash
set -e
export LD_LIBRARY_PATH=$HOME/miniconda2/lib
python -c "import drmaa"
