exit=========== ppc32multi/jhalfs/clfs-commands/cross-tools/039-mpc
#!/bin/bash
#same
set +h
set -e
cd $PKGDIR
LDFLAGS="-Wl,-rpath,/cross-tools/lib" \
./configure \
    --prefix=/cross-tools \
    --disable-static \
    --with-gmp=/cross-tools \
    --with-mpfr=/cross-tools
make
make -j1 install
echo -e "\n\nTotalseconds: $SECONDS\n"
