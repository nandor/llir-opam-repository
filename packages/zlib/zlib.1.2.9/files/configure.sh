#!/bin/sh



prefix=/usr
host=none

while : ; do
  case "$1" in
    "") break;;
    --prefix)
      prefix=$2; shift;;
    --host)
      host=$2; shift;;
    *)
      >&2 echo "Unknown option \"$1\".";;
  esac
  shift
done

llir=`cat $prefix/lib/ocaml/Makefile.config | grep LLIR | sed -e s/LLIR=//g`

if test x"$llir" = xtrue; then
  host="llir_$host"
else
  host=""
fi

CHOST=$host ./configure --prefix $prefix
