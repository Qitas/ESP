#!/bin/bash

usage() {
    echo "Usage: build.sh <x86 | arm | mips> [prepare | build | clean]"
}

target=$1
if [ -z $target ]; then
    usage
    target="arm"
fi

mode=$2
if [ -z $mode ]; then
    usage
    mode="build"
fi

if [ -z $PROJECT_ROOT ]; then
    echo "please specify ROOT path of project by: export PROJECT_ROOT=\"...\""
    exit -1
fi

export SCRIPT=$PROJECT_ROOT/scripts
export OUTPUT=$PROJECT_ROOT/output/$target

case $mode in
    "prepare")
        mkdir -p build
        mkdir -p build/$target
        cd build/$target
        cmake -DCMAKE_INSTALL_PREFIX=$OUTPUT \
              -DCMAKE_TOOLCHAIN_FILE=$SCRIPT/toolchain.$target.cmake -DCMAKE_BUILD_TYPE=Release ../../
    ;;
    "clean")
        if [ -d build/$target ]; then
            cd build/$target
            make clean
        fi
    ;;
    "build")
        echo "BUILD $target for $PWD ..."
        case $target in
            "arm" | \
            "mips" | \
            "x86")
                cd build/$target
                # make VERBOSE=0
                make install VERBOSE=0
            ;;
            *)
                echo "which target?"
            ;;
        esac
    ;;
    *)
        echo "which mode?"
    ;;
esac

