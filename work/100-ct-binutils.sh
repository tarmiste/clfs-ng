exit=========== ppc32multi/jhalfs/clfs-commands/cross-tools/041-binutils
#!/bin/bash
set +h
set -e
cd $PKGDIR
mkdir -v ../binutils-build
cd ../binutils-build

case `echo $CLFS_LIB` in
    32)
        MULTILIB="--disable-multilib"
        LIBPATH="--with-lib-path=/tools/lib"
        BFD="--disable-64-bit-bfd"
    ;;
    64)
        MULTILIB="--disable-multilib"
        LIBPATH="--with-lib-path=/tools/lib"
        BFD="--enable-64-bit-bfd"
    ;;
    MULTI)
        MULTILIB="--enable-multilib"
        LIBPATH="--with-lib-path=/tools/lib:/tools/lib64"
        BFD="--enable-64-bit-bfd"
    ;;
esac
AR=ar AS=as \
../binutils-2.28/configure \
    --prefix=/cross-tools \
    --host=${CLFS_HOST} \
    --target=${CLFS_TARGET} \
    --with-sysroot=${CLFS} \
    ${MULTILIB} \
    ${LIBPATH} } \
    ${BFD} \
    --disable-nls \
    --disable-static \
    --enable-plugins \
    --enable-threads \
    --disable-werror
make
make -j1 install
echo -e "\n\nTotalseconds: $SECONDS\n"
