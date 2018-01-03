mkdir -p $HOME/R_libs
export R_LIBS=$HOME/R_libs
export PROJ_LIB=${CONDA_PREFIX}/share/proj
export CPATH=${CONDA_PREFIX}/include
export LD_RUN_PATH=${CONDA_PREFIX}/lib

sudo yum install mesa-libGL-devel mesa-libGLU-devel
sudo yum install tigervnc-server.x86_64
vncpasswd
vncserver &>~/vnc.log &
export DISPLAY=":1"
