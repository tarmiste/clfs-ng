#!/bin/bash
set +h
set -e
cd $PKGDIR
AWK=gawk ./configure \
    --prefix=/cross-tools \
    --without-debug
make -C include
make -C progs tic
install -v -m755 progs/tic /cross-tools/bin
echo -e "\n\nTotalseconds: $SECONDS\n"
