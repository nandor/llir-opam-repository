#!/bin/sh

cmake . \
  -DCMAKE_INSTALL_PREFIX=$1\
  -DCMAKE_C_COMPILER=$ARCH-unknown-linux-musl-gcc\
  -DCMAKE_CXX_COMPILER=$ARCH-unknown-linux-musl-g++\
  -DCMAKE_BUILD_TYPE=Release\
  -DMI_INSTALL_TOPLEVEL=ON
