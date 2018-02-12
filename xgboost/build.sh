#!/bin/bash
set -e
make -j${CPU_COUNT}
cd python-package
python setup.py install --single-version-externally-managed --record=record.txt
