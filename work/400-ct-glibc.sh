exit=========== ppc32multi/jhalfs/clfs-commands/cross-tools/043-glibc
#!/bin/bash
#all multi are same
set +h
set -e
cd $PKGDIR
mkdir -v ../glibc-build
cd ../glibc-build
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
make
make -j1 install
XXXXXX mips32/jhalfs/clfs-commands/cross-tools
7,8c7,10
< BUILD_CC="gcc" CC="${CLFS_TARGET}-gcc ${BUILD32}" \
< AR="${CLFS_TARGET}-ar" RANLIB="${CLFS_TARGET}-ranlib" \
---
> BUILD_CC="gcc" \
> CC="${CLFS_TARGET}-gcc" \
> AR="${CLFS_TARGET}-ar" \
> RANLIB="${CLFS_TARGET}-ranlib" \
11c13
<     --host=${CLFS_TARGET32} \
---
>     --host=${CLFS_TARGET} \
XXXXXX mips64/jhalfs/clfs-commands/cross-tools
7,8c7,10
< BUILD_CC="gcc" CC="${CLFS_TARGET}-gcc ${BUILD32}" \
< AR="${CLFS_TARGET}-ar" RANLIB="${CLFS_TARGET}-ranlib" \
---
> BUILD_CC="gcc" \
> CC="${CLFS_TARGET}-gcc ${BUILD64}" \
> AR="${CLFS_TARGET}-ar" \
> RANLIB="${CLFS_TARGET}-ranlib" \
11c13
<     --host=${CLFS_TARGET32} \
---
>     --host=${CLFS_TARGET} \
XXXXXX mipsmulti/jhalfs/clfs-commands/cross-tools
XXXXXX ppc32/jhalfs/clfs-commands/cross-tools
7,8c7,10
< BUILD_CC="gcc" CC="${CLFS_TARGET}-gcc ${BUILD32}" \
< AR="${CLFS_TARGET}-ar" RANLIB="${CLFS_TARGET}-ranlib" \
---
> BUILD_CC="gcc" \
> CC="${CLFS_TARGET}-gcc" \
> AR="${CLFS_TARGET}-ar" \
> RANLIB="${CLFS_TARGET}-ranlib" \
11c13
<     --host=${CLFS_TARGET32} \
---
>     --host=${CLFS_TARGET} \
XXXXXX ppc32multi/jhalfs/clfs-commands/cross-tools
XXXXXX ppc64/jhalfs/clfs-commands/cross-tools
7,8c7,10
< BUILD_CC="gcc" CC="${CLFS_TARGET}-gcc ${BUILD32}" \
< AR="${CLFS_TARGET}-ar" RANLIB="${CLFS_TARGET}-ranlib" \
---
> BUILD_CC="gcc" \
> CC="${CLFS_TARGET}-gcc ${BUILD64}" \
> AR="${CLFS_TARGET}-ar" \
> RANLIB="${CLFS_TARGET}-ranlib" \
11c13
<     --host=${CLFS_TARGET32} \
---
>     --host=${CLFS_TARGET} \
XXXXXX sparc32/jhalfs/clfs-commands/cross-tools
7,8c7,10
< BUILD_CC="gcc" CC="${CLFS_TARGET}-gcc ${BUILD32}" \
< AR="${CLFS_TARGET}-ar" RANLIB="${CLFS_TARGET}-ranlib" \
---
> BUILD_CC="gcc" \
> CC="${CLFS_TARGET}-gcc" \
> AR="${CLFS_TARGET}-ar" \
> RANLIB="${CLFS_TARGET}-ranlib" \
11c13
<     --host=${CLFS_TARGET32} \
---
>     --host=${CLFS_TARGET} \
XXXXXX sparc64/jhalfs/clfs-commands/cross-tools
7,8c7,10
< BUILD_CC="gcc" CC="${CLFS_TARGET}-gcc ${BUILD32}" \
< AR="${CLFS_TARGET}-ar" RANLIB="${CLFS_TARGET}-ranlib" \
---
> BUILD_CC="gcc" \
> CC="${CLFS_TARGET}-gcc ${BUILD64}" \
> AR="${CLFS_TARGET}-ar" \
> RANLIB="${CLFS_TARGET}-ranlib" \
11c13
<     --host=${CLFS_TARGET32} \
---
>     --host=${CLFS_TARGET} \
XXXXXX sparcmulti/jhalfs/clfs-commands/cross-tools
XXXXXX x64/jhalfs/clfs-commands/cross-tools
7,8c7,10
< BUILD_CC="gcc" CC="${CLFS_TARGET}-gcc ${BUILD32}" \
< AR="${CLFS_TARGET}-ar" RANLIB="${CLFS_TARGET}-ranlib" \
---
> BUILD_CC="gcc" \
> CC="${CLFS_TARGET}-gcc ${BUILD64}" \
> AR="${CLFS_TARGET}-ar" \
> RANLIB="${CLFS_TARGET}-ranlib" \
11c13
<     --host=${CLFS_TARGET32} \
---
>     --host=${CLFS_TARGET} \
XXXXXX x86/jhalfs/clfs-commands/cross-tools
7,8c7,10
< BUILD_CC="gcc" CC="${CLFS_TARGET}-gcc ${BUILD32}" \
< AR="${CLFS_TARGET}-ar" RANLIB="${CLFS_TARGET}-ranlib" \
---
> BUILD_CC="gcc" \
> CC="${CLFS_TARGET}-gcc" \
> AR="${CLFS_TARGET}-ar" \
> RANLIB="${CLFS_TARGET}-ranlib" \
11c13
<     --host=${CLFS_TARGET32} \
---
>     --host=${CLFS_TARGET} \
XXXXXX x86multi/jhalfs/clfs-commands/cross-tools
echo -e "\n\nTotalseconds: $SECONDS\n"
