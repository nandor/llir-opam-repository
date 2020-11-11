#!/bin/bash

cmake compiler-rt \
      -B Release \
      -DCMAKE_BUILD_TYPE=Release \
      -DLLVM_CONFIG_PATH=$2/bin/llvm-config \
      -DCMAKE_C_COMPILER=$2/bin/$1-unknown-linux-gcc \
      -DCMAKE_CXX_COMPILER=$2/bin/$1-unknown-linux-g++ \
      -DCMAKE_ASM_COMPILER=$2/bin/$1-unknown-linux-gcc \
      -DCMAKE_AR=$(which $1-unknown-linux-gnu-ar) \
      -DCMAKE_NM=$(which $1-unknown-linux-gnu-nm) \
      -DCMAKE_RANLIB=$(which $1-unknown-linux-gnu-ranlib) \
      -DCMAKE_C_COMPILER_TARGET=$1-linux \
      -DCMAKE_ASM_COMPILER_TARGET=$1-linux \
      -DCMAKE_C_FLAGS="-nostdlib -nostdinc -O2 -I$2/llvm/lib/clang/12.0.0/include" \
      -DCMAKE_CXX_FLAGS="-nostdlib -nostdinc -O2 -I$2/llvm/lib/clang/12.0.0/include" \
      -DCMAKE_ASM_FLAGS="-nostdlib -nostdinc" \
      -DCMAKE_EXE_LINKER_FLAGS="-fuse-ld=lld" \
      -DCMAKE_INSTALL_PREFIX=$2/llvm/lib/clang/12.0.0 \
      -DCOMPILER_RT_DEFAULT_TARGET_ONLY=ON \
      -DCOMPILER_RT_BUILD_BUILTINS=ON \
      -DCOMPILER_RT_BUILD_CRT=OFF \
      -DCOMPILER_RT_CRT_USE_EH_FRAME_REGISTRY=OFF \
      -DCOMPILER_RT_BUILD_SANITIZERS=OFF \
      -DCOMPILER_RT_BUILD_XRAY=OFF \
      -DCOMPILER_RT_BUILD_LIBFUZZER=OFF \
      -DCOMPILER_RT_BUILD_PROFILE=OFF \
      -DCOMPILER_RT_BUILD_MEMPROF=OFF \
      -DCOMPILER_RT_BUILD_XRAY_NO_PREINIT=OFF \
      -DCOMPILER_RT_BAREMETAL_BUILD=ON
