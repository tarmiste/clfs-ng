exit=========== ppc32multi/jhalfs/clfs-commands/cross-tools/043-glibc
#!/bin/bash
#all multi are same
set +h
set -e
cd $PKGDIR
mkdir -v ../glibc-build
cd ../glibc-build

#
# easy to get wrong...  Double check this.
#
case `echo $CLFS_LIB` in
    32)
        BUILD_CC="gcc" CC="${CLFS_TARGET}-gcc" \
        AR="${CLFS_TARGET}-ar" RANLIB="${CLFS_TARGET}-ranlib" \
        ../glibc-2.25/configure \
            --prefix=/tools \
            --host=${CLFS_TARGET} \
            --build=${CLFS_HOST} \
            --enable-kernel=3.12.0 \
            --with-binutils=/cross-tools/bin \
            --with-headers=/tools/include \
            --enable-obsolete-rpc
    ;;
    64)
        BUILD_CC="gcc" CC="${CLFS_TARGET}-gcc ${BUILD64}" \
        AR="${CLFS_TARGET}-ar" RANLIB="${CLFS_TARGET}-ranlib" \
        ../glibc-2.25/configure \
            --prefix=/tools \
            --host=${CLFS_TARGET} \
            --build=${CLFS_HOST} \
            --enable-kernel=3.12.0 \
            --with-binutils=/cross-tools/bin \
            --with-headers=/tools/include \
            --enable-obsolete-rpc
    ;;
    MULTI)
        BUILD_CC="gcc" CC="${CLFS_TARGET}-gcc ${BUILD32}" \
        AR="${CLFS_TARGET}-ar" RANLIB="${CLFS_TARGET}-ranlib" \
        ../glibc-2.25/configure \
            --prefix=/tools \
            --host=${CLFS_TARGET32} \
            --build=${CLFS_HOST} \
            --enable-kernel=3.12.0 \
            --with-binutils=/cross-tools/bin \
            --with-headers=/tools/include \
            --enable-obsolete-rpc
    ;;
esac

make
make -j1 install

echo -e "\n\nTotalseconds: $SECONDS\n"
