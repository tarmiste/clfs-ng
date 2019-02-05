exit=========== ppc32multi/jhalfs/clfs-commands/cross-tools/041-binutils
#!/bin/bash
set +h
set -e
cd $PKGDIR
mkdir -v ../binutils-build
cd ../binutils-build
AR=ar AS=as \
#all multi same as original
#all non-multi add: >     --disable-multilib \
#all non-multi chg: >     --with-lib-path=/tools/lib \
#all 32bit builds remove: <     --enable-64-bit-bfd \
../binutils-2.28/configure \
    --prefix=/cross-tools \
    --host=${CLFS_HOST} \
    --target=${CLFS_TARGET} \
    --with-sysroot=${CLFS} \
    --with-lib-path=/tools/lib:/tools/lib64 \
    --disable-nls \
    --disable-static \
    --enable-64-bit-bfd \
    --enable-gold=yes \
    --enable-plugins \
    --enable-threads \
    --disable-werror
make
make -j1 install
XXXXXX mips32/jhalfs/clfs-commands/cross-tools
<     --enable-64-bit-bfd \
XXXXXX mips64/jhalfs/clfs-commands/cross-tools
XXXXXX mipsmulti/jhalfs/clfs-commands/cross-tools
XXXXXX ppc32/jhalfs/clfs-commands/cross-tools
<     --enable-64-bit-bfd \
XXXXXX ppc64/jhalfs/clfs-commands/cross-tools
XXXXXX sparc32/jhalfs/clfs-commands/cross-tools
<     --enable-64-bit-bfd \
XXXXXX sparc64/jhalfs/clfs-commands/cross-tools
---
XXXXXX sparcmulti/jhalfs/clfs-commands/cross-tools
XXXXXX x64/jhalfs/clfs-commands/cross-tools
XXXXXX x86/jhalfs/clfs-commands/cross-tools
<     --enable-64-bit-bfd \
XXXXXX x86multi/jhalfs/clfs-commands/cross-tools
echo -e "\n\nTotalseconds: $SECONDS\n"
