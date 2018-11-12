# this is required
SET(CMAKE_SYSTEM_NAME Linux)

# some program requires global define: versions.h
SET(GLOBAL_ROOT $ENV{PROJECT_ROOT})

# where is the target environment
SET(CMAKE_FIND_ROOT_PATH "${GLOBAL_ROOT}/output/x86")

# PKG_CONFIG_LIBDIR, PKG_CONFIG_PATH
set(ENV{PKG_CONFIG_LIBDIR} "${CMAKE_FIND_ROOT_PATH}/lib/pkgconfig")

# search for programs in the build host directories (not necessary)
#SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
#SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
#SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

#
#SET(LIB_UBOX_ROOT ${CMAKE_FIND_ROOT_PATH})
#SET(LIB_UBUS_ROOT ${CMAKE_FIND_ROOT_PATH})
#SET(LIB_JSON_ROOT ${CMAKE_FIND_ROOT_PATH})

