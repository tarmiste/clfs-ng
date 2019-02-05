exit=========== ppc32multi/jhalfs/clfs-commands/cross-tools/038-mpfr
#!/bin/bash
#same
set +h
set -e
cd $PKGDIR
patch -Np1 -i ../mpfr-3.1.5-fixes-1.patch
LDFLAGS="-Wl,-rpath,/cross-tools/lib" \
./configure \
    --prefix=/cross-tools \
    --disable-static \
    --with-gmp=/cross-tools
make
make -j1 install
echo -e "\n\nTotalseconds: $SECONDS\n"
