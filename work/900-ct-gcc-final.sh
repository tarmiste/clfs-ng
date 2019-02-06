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

echo -en '\n#undef STANDARD_STARTFILE_PREFIX_1\n#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"\n' >> gcc/config/linux.h
echo -en '\n#undef STANDARD_STARTFILE_PREFIX_2\n#define STANDARD_STARTFILE_PREFIX_2 ""\n' >> gcc/config/linux.h
# PPC
echo -en '\n#undef STANDARD_STARTFILE_PREFIX_1\n#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"\n' >> gcc/config/rs6000/sysv4.h
echo -en '\n#undef STANDARD_STARTFILE_PREFIX_2\n#define STANDARD_STARTFILE_PREFIX_2 ""\n' >> gcc/config/rs6000/sysv4.h

#
mkdir -v ../gcc-build
cd ../gcc-build

##
# most non-multi added: >     --disable-nls \
#XXXXXX mips64/jhalfs/clfs-commands/cross-tools
#>     --with-abi=64
##

AR=ar \
LDFLAGS="-Wl,-rpath,/cross-tools/lib" \
../gcc-7.1.0/configure \
    --prefix=/cross-tools \
    --build=${CLFS_HOST} \
    --target=${CLFS_TARGET} \
    --host=${CLFS_HOST} \
    --with-sysroot=${CLFS} \
    ${MULTILIB} \
    --disable-nls \
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

echo -e "\n\nTotalseconds: $SECONDS\n"
exit
