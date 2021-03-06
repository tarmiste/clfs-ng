#!/bin/bash
set +h
set -e
cd $PKGDIR
case `echo $CLFS_LIB` in
    32)
        patch -Np1 -i ../gcc-7.1.0-specs-1.patch
        MULTILIB="--disable-multilib"
    ;;
    64
        patch -Np1 -i ../gcc-7.1.0-pure64_specs-1.patch
        MULTILIB="--disable-multilib"
    ;;
    MULTI)
        patch -Np1 -i ../gcc-7.1.0-specs-1.patch
        MULTILIB="--enable-multilib"
    ;;
esac

# not for ppc but benign.
echo -en '\n#undef STANDARD_STARTFILE_PREFIX_1\n#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"\n' >> gcc/config/linux.h
echo -en '\n#undef STANDARD_STARTFILE_PREFIX_2\n#define STANDARD_STARTFILE_PREFIX_2 ""\n' >> gcc/config/linux.h
# for ppc but benign.
echo -en '\n#undef STANDARD_STARTFILE_PREFIX_1\n#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"\n' >> gcc/config/rs6000/sysv4.h
echo -en '\n#undef STANDARD_STARTFILE_PREFIX_2\n#define STANDARD_STARTFILE_PREFIX_2 ""\n' >> gcc/config/rs6000/sysv4.h

touch /tools/include/limits.h
mkdir -v ../gcc-build
cd ../gcc-build


##
#XXXXXX mips64/jhalfs/clfs-commands/cross-tools
#<     --disable-libstdc++-v3 \
#---
#>     --disable-libcilkrts \
#39a41
#>     --with-abi=64 \
##

AR=ar \
LDFLAGS="-Wl,-rpath,/cross-tools/lib" \
../gcc-7.1.0/configure \
    --prefix=/cross-tools \
    --build=${CLFS_HOST} \
    --host=${CLFS_HOST} \
    --target=${CLFS_TARGET} \
    --with-sysroot=${CLFS} \
    ${MULTILIB} \
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
echo -e "\n\nTotalseconds: $SECONDS\n"
