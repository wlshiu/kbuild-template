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

#export ARCH=arm
#export CROSS_COMPILE=$HOME/work/gcc-arm-none-eabi-5_4-2016q3/bin/arm-none-eabi-
#export PATH=$HOME/work/gcc-arm-none-eabi-5_4-2016q3/arm-none-eabi/include:$PATH
#export LD_LIBRARY_PATH=$HOME/work/gcc-arm-none-eabi-5_4-2016q3/arm-none-eabi/lib

export ARCH=x86
export CROSS_COMPILE=/usr/bin/

export PATH=/usr/include:$PATH
export LD_LIBRARY_PATH=/usr/lib/i386-linux-gnu


cur_dir=`pwd`

if [ -z .config ]; then
    make menuconfig
fi

make

