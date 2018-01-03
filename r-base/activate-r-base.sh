#!/usr/bin/env sh
R CMD javareconf > /dev/null 2>&1 || true
if [[ -z "$TCL_LIBRARY" ]]; then
  export TCL_LIBRARY=$CONDA_PREFIX/lib/tcl8.5
  export _CONDA_SET_TCL_LIBRARY=1
fi
