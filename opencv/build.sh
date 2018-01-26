#!/bin/bash

if [ `uname` == Darwin ]; then
    PY_LIB="libpython2.7.dylib"
else
    PY_LIB="libpython2.7.so"
fi

mkdir build
cd build
cmake                                                               \
    -DPYTHON_EXECUTABLE=$PREFIX/bin/python                          \
    -DPYTHON_INCLUDE_DIR=$PREFIX/include/python2.7/                 \
    -DPYTHON_LIBRARY=$PREFIX/lib/$PY_LIB                            \
    -DPYTHON_PACKAGES_PATH=$PREFIX/lib/python2.7/site-packages/     \
    -DCMAKE_INSTALL_PREFIX=$PREFIX                                  \
    -DWITH_1394=OFF                                                 \
    -DWITH_AVFOUNDATION=ON                                          \
    -DWITH_CUDA=OFF                                                 \
    -DWITH_EIGEN=ON                                                 \
    -DWITH_FFMPEG=OFF                                               \
    -DWITH_GPHOTO2=OFF                                              \
    -DWITH_GSTREAMER=OFF                                            \
    -DWITH_JASPER=OFF                                               \
    -DWITH_OPENEXR=OFF                                              \
    -DWITH_OPENGL=OFF                                               \
    -DWITH_QT=OFF                                                   \
    -DWITH_QUICKTIME=OFF                                            \
    -DWITH_TBB=OFF                                                  \
    -DWITH_VTK=OFF                                                  \
    -DBUILD_JPEG=OFF                                                \
    -DBUILD_PNG=OFF                                                 \
    -DBUILD_TIFF=OFF                                                \
    -DBUILD_ZLIB=OFF                                                \
    ..
make
make install
