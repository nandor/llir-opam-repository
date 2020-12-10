#!/bin/sh -ex
if [ -z "$PREFIX" ]; then
	PREFIX="`opam config var prefix`/lib/gmp-freestanding"
fi

PKG_CONFIG_DEPS="ocaml-freestanding"
check_deps () {
  pkg-config --print-errors --exists ${PKG_CONFIG_DEPS}
}

if ! check_deps 2>/dev/null; then
  # rely on `opam` if deps are unavailable
  export PKG_CONFIG_PATH="`opam config var prefix`/lib/pkgconfig"
fi
check_deps || exit 1

#
# ocaml-freestanding does not provide a real cross compiler, so we fake it:
#
# - set CC to stop configure trying to find a host compiler
# - set CPPFLAGS to ocaml-freestanding CFLAGS, this prevents inclusion of
#   system headers
# - manually override tests for missing functions
# - manually trim the components (SUBDIRS) of libgmp we build to the subset
#   actually used by zarith-freestanding (our sole dependency)
# - set -Werror=implicit-function-declaration at *build* time to catch any
#   undefined symbols
#
# Further, with the introduction of -fstack-protector-strong in Solo5, override
# this during './configure' to prevent it complaining that the compiler does not
# work, and reinstate it again during 'make'.
#
export CFLAGS="$(pkg-config --cflags ${PKG_CONFIG_DEPS}) ${CFLAGS}"
export CC=$ARCH-unknown-none-gcc
export HOST_CC=$ARCH-unknown-linux-musl-gcc
export AR=$ARCH-unknown-none-ar
export RANLIB=$ARCH-unknown-none-ranlib
export DIRECTORIES="mpn mpz mpq mpf"

./configure --prefix `opam config var prefix`

echo "#undef HAVE_NL_LANGINFO" >> config.h
echo "#undef HAVE_LANGINFO_H" >> config.h
echo "#undef HAVE_LOCALE_H" >> config.h
echo "#undef HAVE_LOCALECONV" >> config.h
echo "#undef HAVE_QUAD_T" >> config.h

make libgmp.a
