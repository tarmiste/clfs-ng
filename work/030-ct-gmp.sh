#!/bin/bash
set +h
set -e
cd $PKGDIR
./configure \
    --prefix=/cross-tools \
    --enable-cxx \
    --disable-static
make
make -j1 install
echo -e "\n\nTotalseconds: $SECONDS\n"
