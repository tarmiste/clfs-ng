exit=========== ppc32multi/jhalfs/clfs-commands/cross-tools/045-gcc-final
#!/bin/bash
set +h
set -e
cd $PKGDIR
#all pure64 do this instead: > patch -Np1 -i ../gcc-7.1.0-pure64_specs-1.patch
patch -Np1 -i ../gcc-7.1.0-specs-1.patch
echo -en '\n#undef STANDARD_STARTFILE_PREFIX_1\n#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"\n' >> gcc/config/linux.h
echo -en '\n#undef STANDARD_STARTFILE_PREFIX_2\n#define STANDARD_STARTFILE_PREFIX_2 ""\n' >> gcc/config/linux.h
# ppc32 and ppc64 do this instead of above:
> echo -en '\n#undef STANDARD_STARTFILE_PREFIX_1\n#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"\n' >> gcc/config/rs6000/sysv4.h
> echo -en '\n#undef STANDARD_STARTFILE_PREFIX_2\n#define STANDARD_STARTFILE_PREFIX_2 ""\n' >> gcc/config/rs6000/sysv4.h
#
mkdir -v ../gcc-build
cd ../gcc-build
AR=ar \
LDFLAGS="-Wl,-rpath,/cross-tools/lib" \
# some move this but probably don't matter: <     --with-isl=/cross-tools
# all non-multi add: >     --disable-multilib \
# most non-multi add: >     --disable-nls \
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
XXXXXX mips64/jhalfs/clfs-commands/cross-tools
25c26,27
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
XXXXXX ppc32multi/jhalfs/clfs-commands/cross-tools
XXXXXX ppc64/jhalfs/clfs-commands/cross-tools
5,7c5,7
< echo -en '\n#undef STANDARD_STARTFILE_PREFIX_1\n#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"\n' >> gcc/config/linux.h
< echo -en '\n#undef STANDARD_STARTFILE_PREFIX_2\n#define STANDARD_STARTFILE_PREFIX_2 ""\n' >> gcc/config/linux.h
---
> echo -en '\n#undef STANDARD_STARTFILE_PREFIX_1\n#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"\n' >> gcc/config/rs6000/sysv4.h
> echo -en '\n#undef STANDARD_STARTFILE_PREFIX_2\n#define STANDARD_STARTFILE_PREFIX_2 ""\n' >> gcc/config/rs6000/sysv4.h
19a20
>     --disable-nls \
XXXXXX sparc32/jhalfs/clfs-commands/cross-tools
19a20
>     --disable-nls \
XXXXXX sparc64/jhalfs/clfs-commands/cross-tools
19a20
>     --disable-nls \
XXXXXX sparcmulti/jhalfs/clfs-commands/cross-tools
XXXXXX x64/jhalfs/clfs-commands/cross-tools
>     --disable-nls \
XXXXXX x86/jhalfs/clfs-commands/cross-tools
19a20
>     --disable-nls \
XXXXXX x86multi/jhalfs/clfs-commands/cross-tools
echo -e "\n\nTotalseconds: $SECONDS\n"
exit
