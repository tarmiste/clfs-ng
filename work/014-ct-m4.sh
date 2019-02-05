exit=========== ppc32multi/jhalfs/clfs-commands/cross-tools/034-m4
#!/bin/bash
#same
set +h
set -e
cd $PKGDIR
./configure \
    --prefix=/cross-tools
make
make -j1 install
echo -e "\n\nTotalseconds: $SECONDS\n"
