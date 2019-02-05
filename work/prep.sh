#=========== ppc32multi/jhalfs/clfs-commands/final-preps/025-creatingtoolsdir
#same
#!/bin/bash
set +h
set -e
install -dv ${CLFS}/tools
ln -sv ${CLFS}/tools /
exit

#=========== ppc32multi/jhalfs/clfs-commands/final-preps/026-creatingcrossdir
#same
#!/bin/bash
set +h
set -e
install -dv ${CLFS}/cross-tools
ln -sv ${CLFS}/cross-tools /
exit

#=========== ppc32multi/jhalfs/clfs-commands/final-preps/027-addinguser
#same
#!/bin/bash
set +h
set -e
groupadd clfs
useradd -s /bin/bash -g clfs -d /home/clfs clfs
mkdir -pv /home/clfs
chown -v clfs:clfs /home/clfs
passwd clfs
chown -v clfs ${CLFS}/tools
chown -v clfs ${CLFS}/cross-tools
chown -v clfs ${CLFS}/sources
su - clfs
exit
#=========== ppc32multi/jhalfs/clfs-commands/final-preps/028-settingenvironment
#same
#!/bin/bash
set +h
set -e
cat > ~/.bash_profile << "EOF"
exec env -i HOME=${HOME} TERM=${TERM} PS1='\u:\w\$ ' /bin/bash
EOF
cat > ~/.bashrc << "EOF"
set +h
umask 022
CLFS=/mnt/clfs
LC_ALL=POSIX
PATH=/cross-tools/bin:/bin:/usr/bin
export CLFS LC_ALL PATH
unset CFLAGS CXXFLAGS PKG_CONFIG_PATH
EOF
source ~/.bash_profile
exit



#=========== /jhalfs/clfs-commands/final-preps/029-variables

case `echo $CLFS_ARCH` in
MIPS)
   case `echo $CLFS_LIB` in
   32)
        export CLFS_HOST=$(echo ${MACHTYPE} | sed -e 's/-[^-]*/-cross/')
        export CLFS_TARGET="mipsel-unknown-linux-gnu"
        cat >> ~/.bashrc << EOF
        export CLFS_HOST="${CLFS_HOST}"
        export CLFS_TARGET="${CLFS_TARGET}"
        EOF
   64)
        export CLFS_HOST=$(echo ${MACHTYPE} | sed -e 's/-[^-]*/-cross/')
        export CLFS_TARGET="mips64el-unknown-linux-gnu"
        export BUILD64="-mabi=64"
        cat >> ~/.bashrc << EOF
        export CLFS_HOST="${CLFS_HOST}"
        export CLFS_TARGET="${CLFS_TARGET}"
        export BUILD64="${BUILD64}"
        EOF
   MULTI)
        export CLFS_HOST=$(echo ${MACHTYPE} | sed -e 's/-[^-]*/-cross/')
        export CLFS_TARGET="mips64el-unknown-linux-gnu"
        export CLFS_TARGET32="$(echo ${CLFS_TARGET}| sed -e 's/64//g')"
        export BUILD32="-mabi=32"
        export BUILDN32="-mabi=n32"
        export BUILD64="-mabi=64"
        cat >> ~/.bashrc << EOF
        export CLFS_HOST="${CLFS_HOST}"
        export CLFS_TARGET="${CLFS_TARGET}"
        export CLFS_TARGET32="${CLFS_TARGET32}"
        export BUILD32="${BUILD32}"
        export BUILDN32="${BUILDN32}"
        export BUILD64="${BUILD64}"
        EOF
   esac
POWERPC)
   case `echo $CLFS_LIB` in
   32)
        export CLFS_HOST=$(echo ${MACHTYPE} | sed -e 's/-[^-]*/-cross/')
        export CLFS_TARGET="powerpc-unknown-linux-gnu"
        cat >> ~/.bashrc << EOF
        export CLFS_HOST="${CLFS_HOST}"
        export CLFS_TARGET="${CLFS_TARGET}"
        EOF
   64)
        export CLFS_HOST=$(echo ${MACHTYPE} | sed -e 's/-[^-]*/-cross/')
        export CLFS_TARGET="powerpc64-unknown-linux-gnu"
        export BUILD64="-m64"
        cat >> ~/.bashrc << EOF
        export CLFS_HOST="${CLFS_HOST}"
        export CLFS_TARGET="${CLFS_TARGET}"
        export BUILD64="${BUILD64}"
        EOF
   MULTI)
        export CLFS_HOST=$(echo ${MACHTYPE} | sed -e 's/-[^-]*/-cross/')
        export CLFS_TARGET="powerpc64-unknown-linux-gnu"
        export CLFS_TARGET32="powerpc-unknown-linux-gnu"
        export BUILD32="-m32"
        export BUILD64="-m64"
        cat >> ~/.bashrc << EOF
        export CLFS_HOST="${CLFS_HOST}"
        export CLFS_TARGET="${CLFS_TARGET}"
        export CLFS_TARGET32="${CLFS_TARGET32}"
        export BUILD32="${BUILD32}"
        export BUILD64="${BUILD64}"
        EOF
   esac
esac
SPARC)
   case `echo $CLFS_LIB` in
   32)
        export CLFS_HOST=$(echo ${MACHTYPE} | sed -e 's/-[^-]*/-cross/')
        export CLFS_TARGET="sparc-unknown-linux-gnu"
        cat >> ~/.bashrc << EOF
        export CLFS_HOST="${CLFS_HOST}"
        export CLFS_TARGET="${CLFS_TARGET}"
        EOF
   64)
        export CLFS_HOST=$(echo ${MACHTYPE} | sed -e 's/-[^-]*/-cross/')
        export CLFS_TARGET="sparc64-unknown-linux-gnu"
        export BUILD64="-m64 -mcpu=ultrasparc -mtune=ultrasparc"
        export GCCTARGET="-mcpu=ultrasparc -mtune=ultrasparc"
        cat >> ~/.bashrc << EOF
        export CLFS_HOST="${CLFS_HOST}"
        export CLFS_TARGET="${CLFS_TARGET}"
        export BUILD64="${BUILD64}"
        export GCCTARGET="${GCCTARGET}"
        EOF
   MULTI)
        export CLFS_HOST=$(echo ${MACHTYPE} | sed -e 's/-[^-]*/-cross/')
        export CLFS_TARGET="sparc64-unknown-linux-gnu"
        export CLFS_TARGET32="sparcv9-unknown-linux-gnu"
        export BUILD32="-m32 -mcpu=ultrasparc -mtune=ultrasparc"
        export BUILD64="-m64 -mcpu=ultrasparc -mtune=ultrasparc"
        export GCCTARGET="-mcpu=ultrasparc -mtune=ultrasparc"
        cat >> ~/.bashrc << EOF
        export CLFS_HOST="${CLFS_HOST}"
        export CLFS_TARGET="${CLFS_TARGET}"
        export CLFS_TARGET32="${CLFS_TARGET32}"
        export BUILD32="${BUILD32}"
        export BUILD64="${BUILD64}"
        export GCCTARGET="${GCCTARGET}"
        EOF
   esac
esac
INTEL)
   case `echo $CLFS_LIB` in
   32)
        export CLFS_HOST=$(echo ${MACHTYPE} | sed -e 's/-[^-]*/-cross/')
        export CLFS_TARGET="i486-pc-linux-gnu"
        cat >> ~/.bashrc << EOF
        export CLFS_HOST="${CLFS_HOST}"
        export CLFS_TARGET="${CLFS_TARGET}"
        EOF
   64)
        export CLFS_HOST=$(echo ${MACHTYPE} | sed -e 's/-[^-]*/-cross/')
        export CLFS_TARGET="x86_64-unknown-linux-gnu"
        export BUILD64="-m64"
        cat >> ~/.bashrc << EOF
        export CLFS_HOST="${CLFS_HOST}"
        export CLFS_TARGET="${CLFS_TARGET}"
        export BUILD64="${BUILD64}"
        EOF
   MULTI)
        export CLFS_HOST=$(echo ${MACHTYPE} | sed -e 's/-[^-]*/-cross/')
        export CLFS_TARGET="x86_64-unknown-linux-gnu"
        export CLFS_TARGET32="i686-pc-linux-gnu"
        export BUILD32="-m32"
        export BUILD64="-m64"
        cat >> ~/.bashrc << EOF
        export CLFS_HOST="${CLFS_HOST}"
        export CLFS_TARGET="${CLFS_TARGET}"
        export CLFS_TARGET32="${CLFS_TARGET32}"
        export BUILD32="${BUILD32}"
        export BUILD64="${BUILD64}"
        EOF
   esac
esac
