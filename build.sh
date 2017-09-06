#!/bin/bash -
#===============================================================================
#
#          FILE: build.sh
#
#         USAGE: ./build.sh
#
#   DESCRIPTION:
#
#       OPTIONS: ---
#        AUTHOR: Wei-Lun Hsu (WL),
#  ORGANIZATION:
#       CREATED: 08/31/2017
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error
set -e

export ARCH=arm
#export ARCH=x86


# $ sudo apt-get install libnewlib-arm-none-eabi gcc-arm-none-eabi gcc-arm-linux-gnueabi

if [ $ARCH == 'arm' ]; then
    #toolchain=$HOME/work/gcc-arm-none-eabi-5_4-2016q3
    #toolchain=$HOME/gcc-arm-none-eabi-4_9-2015q1
    toolchain=/usr
    export CROSS_COMPILE=$toolchain/bin/arm-linux-gnueabi-
    export PATH=$toolchain/arm-linux-gnueabi/include:$PATH
    export LD_LIBRARY_PATH=$toolchain/arm-linux-gnueabi/lib
else
    toolchain=/usr
    export CROSS_COMPILE=$toolchain/bin/
    export PATH=$toolchain/include:$PATH
    export LD_LIBRARY_PATH=$toolchain/lib/i386-linux-gnu
fi

echo -e "CROSS_COMPILE=$CROSS_COMPILE"

cur_dir=`pwd`

if [ ! -e '.config' ]; then
    make menuconfig
fi

make

