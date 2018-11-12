#!/bin/bash

usage() {
    echo "Usage:"
    echo "Build individual libs: ./depbuild <lib_name> [x86|mips|arm] [prepare | build | clean]"
    echo "                       \"x86\"  means build this lib for X86 PC host linux"
    echo "                       \"mips\" means build this lib for MIPS host linux"
    echo "                       \"arm\"  means build this lib for ARM host linux"
    echo "                       default to \"arm\""
}

libname=$1
if [ -z $1 ]; then
    usage
    exit 1
fi

target=$2
if [ -z $target ]; then
    echo "default to ARM"
    target="arm"
fi

mode=$3
if [ -z $mode ]; then
    echo "default to BUILD"
    mode="build"
fi

# prepare enviorenment
if [ -z $PROJECT_ROOT ]; then
    echo "please specify ROOT path of project by: export PROJECT_ROOT=\"...\""
    exit -1
fi
export OUTPUT=$PROJECT_ROOT/output/$target

case $target in
    "mips")
        export STAGING_DIR=/opt/openwrt_mt7688
    ;;
esac

export CFLAGS="-I$OUTPUT/usr/include"
export LDFLAGS="-L$OUTPUT/usr/lib"
export PKG_CONFIG_PATH="$OUTPUT/usr/lib/pkgconfig"

# run
case $libname in
    "libdaemon")
        echo "------------------ libdaemon (for log) on $target ------------------"
        if [ $mode = "prepare" ]; then
            # git clone git://git.0pointer.de/libdaemon
            # git submodule add git://git.0pointer.de/libdaemon libdaemon
            cd libdaemon
            ./bootstrap.sh
            if [ $target = "arm" -o $target = "mips" ]; then
                echo "-------- patch applied ----------"
                echo "before cross-compile, run bootstrap.sh, and then add 2 lines to top of the file configure"
                echo "ac_cv_func_getpgrp_void=no"
                echo "ac_cv_func_setpgrp_void=yes"
                patch -lNp0 < ../patches/libdaemon/arm/configure.patch
                echo "-------- patch applied ----------"
            fi
        elif [ $target = "x86" ]; then
            cd libdaemon && \
            ./configure --prefix=$OUTPUT \
            --enable-shared --enable-static && \
            make && make install
        elif [ $target = "arm" ]; then
            cd libdaemon && \
            ./configure --prefix=$OUTPUT --host=arm-linux-gnueabihf \
            --enable-shared --enable-static && \
            make && make install
        elif [ $target = "mips" ]; then
            cd libdaemon && \
            ./configure --prefix=$OUTPUT --host=mipsel-openwrt-linux \
            --enable-shared --enable-static && \
            make && make install
        fi
    ;;

esac
