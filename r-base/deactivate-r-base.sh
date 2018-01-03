#!/bin/bash
if [[ -n "$_CONDA_SET_TCL_LIBRARY" ]]; then
  unset TCL_LIBRARY
  unset _CONDA_SET_TCL_LIBRARY
fi
