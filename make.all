#!/bin/bash

usage() {
    echo "Usage: ./mk.all <x86 | arm | mips> [prepare | build | clean]"
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

export PROJECT_ROOT=$PWD
export BUILD=$PWD/scripts/build.sh
export DEPBUILD=$PWD/scripts/depbuild.sh

case $target in
    "mips")
        export STAGING_DIR=
    ;;
esac

case $mode in
    "prepare")
        echo "---------------- prepare $target ------------------"
        echo "PREPARE ESSENTIAL LIBS"
        cd depends && $DEPBUILD libdaemon $target $mode && cd ../ && \
        cd depends && $DEPBUILD libdaemon $target build && cd ../ && \
        echo "PREPARE OUR LIBS" && \
        cd depends/libsample && $BUILD $target $mode && cd ../../ && \
        cd programs/appmain && $BUILD $target $mode && cd ../../
    ;;
    "clean")
        echo "------------------ clean $target ------------------"
        cd depends/libsample && $BUILD $target $mode && cd ../../ && \
        cd programs/appmain && $BUILD $target $mode && cd ../../
    ;;
    "build")
        echo "------------------ build $target ------------------"
        case $target in
            "arm" | \
            "mips" | \
            "x86")
                #export VERBOSE=1
                echo "# Build all depends" && \
                cd depends/libsample && $BUILD $target $mode && cd ../../ && \

                echo "# Build all programs" && \
                cd programs/appmain && $BUILD $target $mode && cd ../../ && \

                echo "# Generate Release" && \
                scripts/mk.release $target
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

exit 0
