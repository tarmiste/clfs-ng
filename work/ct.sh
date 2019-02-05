=========== ppc32multi/jhalfs/clfs-commands/cross-tools/032-file
#same
#!/bin/bash
set +h
set -e
cd $PKGDIR
./configure \
    --prefix=/cross-tools
make
make -j1 install
echo -e "\n\nTotalseconds: $SECONDS\n"
exit=========== ppc32multi/jhalfs/clfs-commands/cross-tools/033-linux-headers
#!/bin/bash
set +h
set -e
cd $PKGDIR
xzcat ../patch-4.9.21.xz | patch -Np1 -i -
make -j1 mrproper
make ARCH=powerpc headers_check
make ARCH=powerpc INSTALL_HDR_PATH=/tools headers_install
echo -e "\n\nTotalseconds: $SECONDS\n"
XXXXXX mips32/jhalfs/clfs-commands/cross-tools
7,8c7,8
> make ARCH=mips headers_check
> make ARCH=mips INSTALL_HDR_PATH=/tools headers_install
XXXXXX mips64/jhalfs/clfs-commands/cross-tools
7,8c7,8
> make ARCH=mips headers_check
> make ARCH=mips INSTALL_HDR_PATH=/tools headers_install
XXXXXX mipsmulti/jhalfs/clfs-commands/cross-tools
7,8c7,8
> make ARCH=mips headers_check
> make ARCH=mips INSTALL_HDR_PATH=/tools headers_install
XXXXXX sparc32/jhalfs/clfs-commands/cross-tools
7,8c7,8
> make ARCH=sparc headers_check
> make ARCH=sparc INSTALL_HDR_PATH=/tools headers_install
XXXXXX sparc64/jhalfs/clfs-commands/cross-tools
7,8c7,8
> make ARCH=sparc64 headers_check
> make ARCH=sparc64 INSTALL_HDR_PATH=/tools headers_install
XXXXXX sparcmulti/jhalfs/clfs-commands/cross-tools
7,8c7,8
> make ARCH=sparc64 headers_check
> make ARCH=sparc64 INSTALL_HDR_PATH=/tools headers_install
XXXXXX x64/jhalfs/clfs-commands/cross-tools
7,8c7,8
> make ARCH=x86_64 headers_check
> make ARCH=x86_64 INSTALL_HDR_PATH=/tools headers_install
XXXXXX x86/jhalfs/clfs-commands/cross-tools
7,8c7,8
> make ARCH=i386 headers_check
> make ARCH=i386 INSTALL_HDR_PATH=/tools headers_install
XXXXXX x86multi/jhalfs/clfs-commands/cross-tools
> make ARCH=x86_64 headers_check
> make ARCH=x86_64 INSTALL_HDR_PATH=/tools headers_install
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
exit=========== ppc32multi/jhalfs/clfs-commands/cross-tools/035-ncurses
#!/bin/bash
#same
set +h
set -e
cd $PKGDIR
AWK=gawk ./configure \
    --prefix=/cross-tools \
    --without-debug
make -C include
make -C progs tic
install -v -m755 progs/tic /cross-tools/bin
echo -e "\n\nTotalseconds: $SECONDS\n"
exit=========== ppc32multi/jhalfs/clfs-commands/cross-tools/036-pkg-config-lite
#!/bin/bash
set +h
set -e
cd $PKGDIR
./configure \
    --prefix=/cross-tools \
    --host=${CLFS_TARGET} \
    --with-pc-path=/tools/lib64/pkgconfig:/tools/share/pkgconfig
make
make -j1 install

XXXXXX mips32/jhalfs/clfs-commands/cross-tools
8c8
<     --with-pc-path=/tools/lib64/pkgconfig:/tools/share/pkgconfig
---
>     --with-pc-path=/tools/lib/pkgconfig:/tools/share/pkgconfig
XXXXXX mips64/jhalfs/clfs-commands/cross-tools
8c8
<     --with-pc-path=/tools/lib64/pkgconfig:/tools/share/pkgconfig
---
>     --with-pc-path=/tools/lib/pkgconfig:/tools/share/pkgconfig
XXXXXX mipsmulti/jhalfs/clfs-commands/cross-tools
XXXXXX ppc32/jhalfs/clfs-commands/cross-tools
8c8
<     --with-pc-path=/tools/lib64/pkgconfig:/tools/share/pkgconfig
---
>     --with-pc-path=/tools/lib/pkgconfig:/tools/share/pkgconfig
XXXXXX ppc32multi/jhalfs/clfs-commands/cross-tools
XXXXXX ppc64/jhalfs/clfs-commands/cross-tools
8c8
<     --with-pc-path=/tools/lib64/pkgconfig:/tools/share/pkgconfig
---
>     --with-pc-path=/tools/lib/pkgconfig:/tools/share/pkgconfig
XXXXXX sparc32/jhalfs/clfs-commands/cross-tools
8c8
<     --with-pc-path=/tools/lib64/pkgconfig:/tools/share/pkgconfig
---
>     --with-pc-path=/tools/lib/pkgconfig:/tools/share/pkgconfig
XXXXXX sparc64/jhalfs/clfs-commands/cross-tools
8c8
<     --with-pc-path=/tools/lib64/pkgconfig:/tools/share/pkgconfig
---
>     --with-pc-path=/tools/lib/pkgconfig:/tools/share/pkgconfig
XXXXXX sparcmulti/jhalfs/clfs-commands/cross-tools
XXXXXX x64/jhalfs/clfs-commands/cross-tools
8c8
<     --with-pc-path=/tools/lib64/pkgconfig:/tools/share/pkgconfig
---
>     --with-pc-path=/tools/lib/pkgconfig:/tools/share/pkgconfig
XXXXXX x86/jhalfs/clfs-commands/cross-tools
8c8
<     --with-pc-path=/tools/lib64/pkgconfig:/tools/share/pkgconfig
---
>     --with-pc-path=/tools/lib/pkgconfig:/tools/share/pkgconfig
XXXXXX x86multi/jhalfs/clfs-commands/cross-tools
echo -e "\n\nTotalseconds: $SECONDS\n"
exit=========== ppc32multi/jhalfs/clfs-commands/cross-tools/037-gmp
#!/bin/bash
#same
set +h
set -e
cd $PKGDIR
./configure \
    --prefix=/cross-tools \
    --enable-cxx \
    --disable-static
make
make -j1 install
echo -e "\n\nTotalseconds: $SECONDS\n"
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
exit=========== ppc32multi/jhalfs/clfs-commands/cross-tools/040-isl
#!/bin/bash
#same
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
exit=========== ppc32multi/jhalfs/clfs-commands/cross-tools/041-binutils
#!/bin/bash
set +h
set -e
cd $PKGDIR
mkdir -v ../binutils-build
cd ../binutils-build
AR=ar AS=as \
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
---
>     --with-lib-path=/tools/lib \
16c16
<     --enable-64-bit-bfd \
---
>     --disable-multilib \
XXXXXX mips64/jhalfs/clfs-commands/cross-tools
---
>     --with-lib-path=/tools/lib \
16a17
>     --disable-multilib \
XXXXXX mipsmulti/jhalfs/clfs-commands/cross-tools
XXXXXX ppc32/jhalfs/clfs-commands/cross-tools
---
>     --with-lib-path=/tools/lib \
16c16
<     --enable-64-bit-bfd \
---
>     --disable-multilib \
XXXXXX ppc32multi/jhalfs/clfs-commands/cross-tools
XXXXXX ppc64/jhalfs/clfs-commands/cross-tools
---
>     --with-lib-path=/tools/lib \
16a17
>     --disable-multilib \
XXXXXX sparc32/jhalfs/clfs-commands/cross-tools
---
>     --with-lib-path=/tools/lib \
16c16
<     --enable-64-bit-bfd \
---
>     --disable-multilib \
XXXXXX sparc64/jhalfs/clfs-commands/cross-tools
---
>     --with-lib-path=/tools/lib \
16a17
>     --disable-multilib \
XXXXXX sparcmulti/jhalfs/clfs-commands/cross-tools
XXXXXX x64/jhalfs/clfs-commands/cross-tools
---
>     --with-lib-path=/tools/lib \
16a17
>     --disable-multilib \
XXXXXX x86/jhalfs/clfs-commands/cross-tools
---
>     --with-lib-path=/tools/lib \
16c16
<     --enable-64-bit-bfd \
---
>     --disable-multilib \
XXXXXX x86multi/jhalfs/clfs-commands/cross-tools
echo -e "\n\nTotalseconds: $SECONDS\n"
exit=========== ppc32multi/jhalfs/clfs-commands/cross-tools/042-gcc-static
#!/bin/bash
set +h
set -e
cd $PKGDIR
patch -Np1 -i ../gcc-7.1.0-specs-1.patch
echo -en '\n#undef STANDARD_STARTFILE_PREFIX_1\n#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"\n' >> gcc/config/linux.h
echo -en '\n#undef STANDARD_STARTFILE_PREFIX_2\n#define STANDARD_STARTFILE_PREFIX_2 ""\n' >> gcc/config/linux.h
touch /tools/include/limits.h
mkdir -v ../gcc-build
cd ../gcc-build
AR=ar \
LDFLAGS="-Wl,-rpath,/cross-tools/lib" \
../gcc-7.1.0/configure \
    --prefix=/cross-tools \
    --build=${CLFS_HOST} \
    --host=${CLFS_HOST} \
    --target=${CLFS_TARGET} \
    --with-sysroot=${CLFS} \
    --with-local-prefix=/tools \
    --with-native-system-header-dir=/tools/include \
    --disable-shared \
    --with-mpfr=/cross-tools \
    --with-gmp=/cross-tools \
    --with-mpc=/cross-tools \
    --without-headers \
    --with-newlib \
    --disable-decimal-float \
    --disable-libgomp \
    --disable-libssp \
    --disable-libatomic \
    --disable-libitm \
    --disable-libsanitizer \
    --disable-libquadmath \
    --disable-libvtv \
    --disable-libcilkrts \
    --disable-libstdc++-v3 \
    --disable-threads \
    --with-isl=/cross-tools \
    --enable-languages=c \
    --with-glibc-version=2.25
make all-gcc all-target-libgcc
make -j1 install-gcc install-target-libgcc
XXXXXX mips32/jhalfs/clfs-commands/cross-tools
23a24
>     --with-isl=/cross-tools \
38c39
<     --with-isl=/cross-tools \
---
>     --disable-multilib \
XXXXXX mips64/jhalfs/clfs-commands/cross-tools
5c5
< patch -Np1 -i ../gcc-7.1.0-specs-1.patch
---
> patch -Np1 -i ../gcc-7.1.0-pure64_specs-1.patch
23a24
>     --with-isl=/cross-tools \
36c37
<     --disable-libstdc++-v3 \
---
>     --disable-libcilkrts \
38c39
<     --with-isl=/cross-tools \
---
>     --disable-multilib \
39a41
>     --with-abi=64 \
XXXXXX mipsmulti/jhalfs/clfs-commands/cross-tools
XXXXXX ppc32/jhalfs/clfs-commands/cross-tools
6,7c6,7
< echo -en '\n#undef STANDARD_STARTFILE_PREFIX_1\n#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"\n' >> gcc/config/linux.h
< echo -en '\n#undef STANDARD_STARTFILE_PREFIX_2\n#define STANDARD_STARTFILE_PREFIX_2 ""\n' >> gcc/config/linux.h
---
> echo -en '\n#undef STANDARD_STARTFILE_PREFIX_1\n#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"\n' >> gcc/config/rs6000/sysv4.h
> echo -en '\n#undef STANDARD_STARTFILE_PREFIX_2\n#define STANDARD_STARTFILE_PREFIX_2 ""\n' >> gcc/config/rs6000/sysv4.h
23a24
>     --with-isl=/cross-tools \
38c39
<     --with-isl=/cross-tools \
---
>     --disable-multilib \
XXXXXX ppc32multi/jhalfs/clfs-commands/cross-tools
XXXXXX ppc64/jhalfs/clfs-commands/cross-tools
5,7c5,7
< patch -Np1 -i ../gcc-7.1.0-specs-1.patch
< echo -en '\n#undef STANDARD_STARTFILE_PREFIX_1\n#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"\n' >> gcc/config/linux.h
< echo -en '\n#undef STANDARD_STARTFILE_PREFIX_2\n#define STANDARD_STARTFILE_PREFIX_2 ""\n' >> gcc/config/linux.h
---
> patch -Np1 -i ../gcc-7.1.0-pure64_specs-1.patch
> echo -en '\n#undef STANDARD_STARTFILE_PREFIX_1\n#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"\n' >> gcc/config/rs6000/sysv4.h
> echo -en '\n#undef STANDARD_STARTFILE_PREFIX_2\n#define STANDARD_STARTFILE_PREFIX_2 ""\n' >> gcc/config/rs6000/sysv4.h
23a24
>     --with-isl=/cross-tools \
38c39
<     --with-isl=/cross-tools \
---
>     --disable-multilib \
XXXXXX sparc32/jhalfs/clfs-commands/cross-tools
23a24
>     --with-isl=/cross-tools \
38c39
<     --with-isl=/cross-tools \
---
>     --disable-multilib \
XXXXXX sparc64/jhalfs/clfs-commands/cross-tools
5c5
< patch -Np1 -i ../gcc-7.1.0-specs-1.patch
---
> patch -Np1 -i ../gcc-7.1.0-pure64_specs-1.patch
23a24
>     --with-isl=/cross-tools \
38c39
<     --with-isl=/cross-tools \
---
>     --disable-multilib \
XXXXXX sparcmulti/jhalfs/clfs-commands/cross-tools
XXXXXX x64/jhalfs/clfs-commands/cross-tools
5c5
< patch -Np1 -i ../gcc-7.1.0-specs-1.patch
---
> patch -Np1 -i ../gcc-7.1.0-pure64_specs-1.patch
23a24
>     --with-isl=/cross-tools \
38c39
<     --with-isl=/cross-tools \
---
>     --disable-multilib \
XXXXXX x86/jhalfs/clfs-commands/cross-tools
23a24
>     --with-isl=/cross-tools \
38c39
<     --with-isl=/cross-tools \
---
>     --disable-multilib \
XXXXXX x86multi/jhalfs/clfs-commands/cross-tools
echo -e "\n\nTotalseconds: $SECONDS\n"
exit=========== ppc32multi/jhalfs/clfs-commands/cross-tools/043-glibc
#!/bin/bash
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
exit=========== ppc32multi/jhalfs/clfs-commands/cross-tools/044-glibc-64
#!/bin/bash
set +h
set -e
cd $PKGDIR
mkdir -v ../glibc-build
cd ../glibc-build
echo "libc_cv_slibdir=/tools/lib64" >> config.cache
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
XXXXXX mips32/jhalfs/clfs-commands/cross-tools
diff: mips32/jhalfs/clfs-commands/cross-tools/*glibc-64: No such file or directory
XXXXXX mips64/jhalfs/clfs-commands/cross-tools
diff: mips64/jhalfs/clfs-commands/cross-tools/*glibc-64: No such file or directory
XXXXXX mipsmulti/jhalfs/clfs-commands/cross-tools
XXXXXX ppc32/jhalfs/clfs-commands/cross-tools
diff: ppc32/jhalfs/clfs-commands/cross-tools/*glibc-64: No such file or directory
XXXXXX ppc32multi/jhalfs/clfs-commands/cross-tools
XXXXXX ppc64/jhalfs/clfs-commands/cross-tools
diff: ppc64/jhalfs/clfs-commands/cross-tools/*glibc-64: No such file or directory
XXXXXX sparc32/jhalfs/clfs-commands/cross-tools
diff: sparc32/jhalfs/clfs-commands/cross-tools/*glibc-64: No such file or directory
XXXXXX sparc64/jhalfs/clfs-commands/cross-tools
diff: sparc64/jhalfs/clfs-commands/cross-tools/*glibc-64: No such file or directory
XXXXXX sparcmulti/jhalfs/clfs-commands/cross-tools
6a7,12
> cat > config.cache << "EOF"
> libc_cv_forced_unwind=yes
> libc_cv_c_cleanup=yes
> libc_cv_sparc64_tls=yes
> libc_cv_gnu89_inline=yes
> EOF
XXXXXX x64/jhalfs/clfs-commands/cross-tools
diff: x64/jhalfs/clfs-commands/cross-tools/*glibc-64: No such file or directory
XXXXXX x86/jhalfs/clfs-commands/cross-tools
diff: x86/jhalfs/clfs-commands/cross-tools/*glibc-64: No such file or directory
XXXXXX x86multi/jhalfs/clfs-commands/cross-tools
echo -e "\n\nTotalseconds: $SECONDS\n"
exit=========== ppc32multi/jhalfs/clfs-commands/cross-tools/045-gcc-final
#!/bin/bash
set +h
set -e
cd $PKGDIR
patch -Np1 -i ../gcc-7.1.0-specs-1.patch
echo -en '\n#undef STANDARD_STARTFILE_PREFIX_1\n#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"\n' >> gcc/config/linux.h
echo -en '\n#undef STANDARD_STARTFILE_PREFIX_2\n#define STANDARD_STARTFILE_PREFIX_2 ""\n' >> gcc/config/linux.h
mkdir -v ../gcc-build
cd ../gcc-build
AR=ar \
LDFLAGS="-Wl,-rpath,/cross-tools/lib" \
../gcc-7.1.0/configure \
    --prefix=/cross-tools \
    --build=${CLFS_HOST} \
    --target=${CLFS_TARGET} \
    --host=${CLFS_HOST} \
    --with-sysroot=${CLFS} \
    --with-local-prefix=/tools \
    --with-native-system-header-dir=/tools/include \
    --disable-static \
    --enable-languages=c,c++ \
    --with-mpc=/cross-tools \
    --with-mpfr=/cross-tools \
    --with-gmp=/cross-tools \
    --with-isl=/cross-tools
make AS_FOR_TARGET="${CLFS_TARGET}-as" \
    LD_FOR_TARGET="${CLFS_TARGET}-ld"
make -j1 install
XXXXXX mips32/jhalfs/clfs-commands/cross-tools
19a20
>     --disable-nls \
21a23
>     --disable-multilib \
XXXXXX mips64/jhalfs/clfs-commands/cross-tools
5c5
< patch -Np1 -i ../gcc-7.1.0-specs-1.patch
---
> patch -Np1 -i ../gcc-7.1.0-pure64_specs-1.patch
21a22
>     --disable-multilib \
25c26,27
<     --with-isl=/cross-tools
---
>     --with-isl=/cross-tools \
>     --with-abi=64
XXXXXX mipsmulti/jhalfs/clfs-commands/cross-tools
XXXXXX ppc32/jhalfs/clfs-commands/cross-tools
6,7c6,7
< echo -en '\n#undef STANDARD_STARTFILE_PREFIX_1\n#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"\n' >> gcc/config/linux.h
< echo -en '\n#undef STANDARD_STARTFILE_PREFIX_2\n#define STANDARD_STARTFILE_PREFIX_2 ""\n' >> gcc/config/linux.h
---
> echo -en '\n#undef STANDARD_STARTFILE_PREFIX_1\n#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"\n' >> gcc/config/rs6000/sysv4.h
> echo -en '\n#undef STANDARD_STARTFILE_PREFIX_2\n#define STANDARD_STARTFILE_PREFIX_2 ""\n' >> gcc/config/rs6000/sysv4.h
19a20
>     --disable-nls \
21a23
>     --disable-multilib \
XXXXXX ppc32multi/jhalfs/clfs-commands/cross-tools
XXXXXX ppc64/jhalfs/clfs-commands/cross-tools
5,7c5,7
< patch -Np1 -i ../gcc-7.1.0-specs-1.patch
< echo -en '\n#undef STANDARD_STARTFILE_PREFIX_1\n#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"\n' >> gcc/config/linux.h
< echo -en '\n#undef STANDARD_STARTFILE_PREFIX_2\n#define STANDARD_STARTFILE_PREFIX_2 ""\n' >> gcc/config/linux.h
---
> patch -Np1 -i ../gcc-7.1.0-pure64_specs-1.patch
> echo -en '\n#undef STANDARD_STARTFILE_PREFIX_1\n#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"\n' >> gcc/config/rs6000/sysv4.h
> echo -en '\n#undef STANDARD_STARTFILE_PREFIX_2\n#define STANDARD_STARTFILE_PREFIX_2 ""\n' >> gcc/config/rs6000/sysv4.h
19a20
>     --disable-nls \
21a23
>     --disable-multilib \
XXXXXX sparc32/jhalfs/clfs-commands/cross-tools
19a20
>     --disable-nls \
21a23
>     --disable-multilib \
XXXXXX sparc64/jhalfs/clfs-commands/cross-tools
5c5
< patch -Np1 -i ../gcc-7.1.0-specs-1.patch
---
> patch -Np1 -i ../gcc-7.1.0-pure64_specs-1.patch
19a20
>     --disable-nls \
21a23
>     --disable-multilib \
XXXXXX sparcmulti/jhalfs/clfs-commands/cross-tools
XXXXXX x64/jhalfs/clfs-commands/cross-tools
5c5
< patch -Np1 -i ../gcc-7.1.0-specs-1.patch
---
> patch -Np1 -i ../gcc-7.1.0-pure64_specs-1.patch
19a20
>     --disable-nls \
21a23
>     --disable-multilib \
XXXXXX x86/jhalfs/clfs-commands/cross-tools
19a20
>     --disable-nls \
21a23
>     --disable-multilib \
XXXXXX x86multi/jhalfs/clfs-commands/cross-tools
echo -e "\n\nTotalseconds: $SECONDS\n"
exit
