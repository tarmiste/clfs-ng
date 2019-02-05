exit=========== ppc32multi/jhalfs/clfs-commands/cross-tools/036-pkg-config-lite
#!/bin/bash
set +h
set -e
cd $PKGDIR
./configure \
    --prefix=/cross-tools \
    --host=${CLFS_TARGET} \
#all multi:
    --with-pc-path=/tools/lib64/pkgconfig:/tools/share/pkgconfig
XXXXXX mips32/jhalfs/clfs-commands/cross-tools
    --with-pc-path=/tools/lib/pkgconfig:/tools/share/pkgconfig
XXXXXX mips64/jhalfs/clfs-commands/cross-tools
    --with-pc-path=/tools/lib/pkgconfig:/tools/share/pkgconfig
XXXXXX mipsmulti/jhalfs/clfs-commands/cross-tools
XXXXXX ppc32/jhalfs/clfs-commands/cross-tools
    --with-pc-path=/tools/lib/pkgconfig:/tools/share/pkgconfig
XXXXXX ppc32multi/jhalfs/clfs-commands/cross-tools
XXXXXX ppc64/jhalfs/clfs-commands/cross-tools
    --with-pc-path=/tools/lib/pkgconfig:/tools/share/pkgconfig
XXXXXX sparc32/jhalfs/clfs-commands/cross-tools
    --with-pc-path=/tools/lib/pkgconfig:/tools/share/pkgconfig
XXXXXX sparc64/jhalfs/clfs-commands/cross-tools
    --with-pc-path=/tools/lib/pkgconfig:/tools/share/pkgconfig
XXXXXX sparcmulti/jhalfs/clfs-commands/cross-tools
XXXXXX x64/jhalfs/clfs-commands/cross-tools
    --with-pc-path=/tools/lib/pkgconfig:/tools/share/pkgconfig
XXXXXX x86/jhalfs/clfs-commands/cross-tools
    --with-pc-path=/tools/lib/pkgconfig:/tools/share/pkgconfig
XXXXXX x86multi/jhalfs/clfs-commands/cross-tools
make
make -j1 install

echo -e "\n\nTotalseconds: $SECONDS\n"
