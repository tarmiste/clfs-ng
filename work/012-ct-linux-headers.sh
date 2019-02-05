exit=========== ppc32multi/jhalfs/clfs-commands/cross-tools/033-linux-headers
#!/bin/bash
set +h
set -e
cd $PKGDIR
xzcat ../patch-4.9.21.xz | patch -Np1 -i -
make -j1 mrproper
ALL power pc   (double check)
make ARCH=powerpc headers_check
make ARCH=powerpc INSTALL_HDR_PATH=/tools headers_install
echo -e "\n\nTotalseconds: $SECONDS\n"
XXXXXX mips32/jhalfs/clfs-commands/cross-tools
# all mips
> make ARCH=mips headers_check
> make ARCH=mips INSTALL_HDR_PATH=/tools headers_install
XXXXXX sparc32/jhalfs/clfs-commands/cross-tools
SPARC32
> make ARCH=sparc headers_check
> make ARCH=sparc INSTALL_HDR_PATH=/tools headers_install
XXXXXX sparc64/jhalfs/clfs-commands/cross-tools
SPARC64 and MULTI
> make ARCH=sparc64 headers_check
> make ARCH=sparc64 INSTALL_HDR_PATH=/tools headers_install
XXXXXX x64/jhalfs/clfs-commands/cross-tools
7,8c7,8
x86 64 and MULTI
> make ARCH=x86_64 headers_check
> make ARCH=x86_64 INSTALL_HDR_PATH=/tools headers_install
XXXXXX x86/jhalfs/clfs-commands/cross-tools
7,8c7,8
X86 32
> make ARCH=i386 headers_check
> make ARCH=i386 INSTALL_HDR_PATH=/tools headers_install

