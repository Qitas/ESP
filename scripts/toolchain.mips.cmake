# this is required
SET(CMAKE_SYSTEM_NAME Linux)

# specify the cross compiler
SET(CMAKE_C_COMPILER   mipsel-openwrt-linux-gcc)
SET(CMAKE_CXX_COMPILER mipsel-openwrt-linux-g++)

# some program requires global define: versions.h
SET(GLOBAL_ROOT $ENV{PROJECT_ROOT})

# some program requires "depends/catch" ...
SET(DEPENDS_ROOT "${GLOBAL_ROOT}/depends")

# where is the target environment
SET(CMAKE_FIND_ROOT_PATH  ${GLOBAL_ROOT}/output/mips)

# PKG_CONFIG_LIBDIR, PKG_CONFIG_PATH
set(ENV{PKG_CONFIG_LIBDIR} "${CMAKE_FIND_ROOT_PATH}/lib/pkgconfig")
# message (STATUS PKG_CONFIG_PATH=$ENV{PKG_CONFIG_PATH})
# message (STATUS PKG_CONFIG_LIBDIR=$ENV{PKG_CONFIG_LIBDIR})

# search for programs in the build host directories (not necessary)
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# remove -rdynamic
SET(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS)

#
SET(STAGING_DIR /opt/openwrt_mt7688)
SET(LIB_UBOX_ROOT ${STAGING_DIR}/../build_dir/target-mipsel_24kec+dsp_uClibc-0.9.33.2/libubox-2015-11-08/ipkg-install/usr)
SET(LIB_UBUS_ROOT ${STAGING_DIR}/../build_dir/target-mipsel_24kec+dsp_uClibc-0.9.33.2/ubus-2015-05-25)
SET(LIB_JSON_ROOT ${STAGING_DIR}/../build_dir/target-mipsel_24kec+dsp_uClibc-0.9.33.2/json-c-0.12/ipkg-install/usr)

# LINK_DIRECTORIES(${CMAKE_FIND_ROOT_PATH}/lib)
