#!/bin/bash
mkdir _build && cd _build
meson --prefix=$PREFIX
ninja
ninja install
