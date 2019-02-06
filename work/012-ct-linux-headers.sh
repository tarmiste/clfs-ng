#!/bin/bash
set +h
set -e
cd $PKGDIR
#xzcat ../patch-4.9.21.xz | patch -Np1 -i -
make -j1 mrproper
case `echo $CLFS_ARCH` in

    MIPS)
        make ARCH=mips headers_check
        make ARCH=mips INSTALL_HDR_PATH=/tools headers_install
    ;;

    POWERPC)
        make ARCH=powerpc headers_check
        make ARCH=powerpc INSTALL_HDR_PATH=/tools headers_install
    ;;

    SPARC)
        case `echo $CLFS_LIB` in
        32)
            make ARCH=sparc headers_check
            make ARCH=sparc INSTALL_HDR_PATH=/tools headers_install
        ;;
        64)
            make ARCH=sparc64 headers_check
            make ARCH=sparc64 INSTALL_HDR_PATH=/tools headers_install
        ;;
        MULTI)
            make ARCH=sparc64 headers_check
            make ARCH=sparc64 INSTALL_HDR_PATH=/tools headers_install
        ;;
        esac
    ;;

    INTEL)
        case `echo $CLFS_LIB` in
        32)
            make ARCH=i386 headers_check
            make ARCH=i386 INSTALL_HDR_PATH=/tools headers_install
        ;;
        64)
            make ARCH=x86_64 headers_check
            make ARCH=x86_64 INSTALL_HDR_PATH=/tools headers_install
        ;;
        MULTI)
            make ARCH=x86_64 headers_check
            make ARCH=x86_64 INSTALL_HDR_PATH=/tools headers_install
        ;;

        esac 
    ;;
esac
echo -e "\n\nTotalseconds: $SECONDS\n"
