exit=========== ppc32multi/jhalfs/clfs-commands/cross-tools/044-glibc-64
#!/bin/bash
set +h
set -e
cd $PKGDIR
mkdir -v ../glibc-build
cd ../glibc-build
echo "libc_cv_slibdir=/tools/lib64" >> config.cache
#all same except for:
XXXXXX sparcmulti/jhalfs/clfs-commands/cross-tools
6a7,12
> cat > config.cache << "EOF"
> libc_cv_forced_unwind=yes
> libc_cv_c_cleanup=yes
> libc_cv_sparc64_tls=yes
> libc_cv_gnu89_inline=yes
> EOF
BUILD_CC="gcc" CC="${CLFS_TARGET}-gcc ${BUILD64}" \
AR="${CLFS_TARGET}-ar" RANLIB="${CLFS_TARGET}-ranlib" \
../glibc-2.25/configure \
    --prefix=/tools \
    --host=${CLFS_TARGET} \
    --build=${CLFS_HOST} \
    --libdir=/tools/lib64 \
    --enable-kernel=3.12.0 \
    --with-binutils=/cross-tools/bin \
    --with-headers=/tools/include \
    --enable-obsolete-rpc \
    --cache-file=config.cache
make
make -j1 install
echo -e "\n\nTotalseconds: $SECONDS\n"
