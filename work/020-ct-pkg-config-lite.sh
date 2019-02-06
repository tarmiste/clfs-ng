#!/bin/bash
set +h
set -e
cd $PKGDIR

case `echo $CLFS_LIB` in
    MULTI)
    PC_PATH="--with-pc-path=/tools/lib64/pkgconfig:/tools/share/pkgconfig"
    ;;
    *)
    PC_PATH="--with-pc-path=/tools/lib/pkgconfig:/tools/share/pkgconfig"
    ;;
esac

./configure \
    --prefix=/cross-tools \
    --host=${CLFS_TARGET} \
    --with-pc-path=${PC_PATH}

make
make -j1 install

echo -e "\n\nTotalseconds: $SECONDS\n"
