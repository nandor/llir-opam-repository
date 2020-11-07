#!/bin/sh

host=`cat $prefix/lib/ocaml/Makefile.config | grep '^ARCH' | sed -e s/ARCH=//g`

CHOST=$host-pc-linux-musl ./configure $@
