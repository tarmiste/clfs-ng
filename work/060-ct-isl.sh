#!/bin/bash
set +h
set -e
cd $PKGDIR
LDFLAGS="-Wl,-rpath,/cross-tools/lib" \
./configure \
    --prefix=/cross-tools \
    --disable-static \
    --with-gmp-prefix=/cross-tools
make
make -j1 install
echo -e "\n\nTotalseconds: $SECONDS\n"
