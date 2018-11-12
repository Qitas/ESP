# this is required
SET(CMAKE_SYSTEM_NAME Linux)

SET(TARGET_PLATFORM armhf)

# FIXME: use command line to specify these commands
SET(PLATFORM_ARM_A7 yes)
SET(REVISION_CX_AUDIOSMART yes)
SET(BOARD_VC2 yes)

# program will check this for platform specific behavior
IF (PLATFORM_ARM_A7 MATCHES yes)
    add_definitions(-DPLATFORM_ARM_A7)
ENDIF()

IF (BOARD_VC2 MATCHES yes)
    add_definitions(-DBOARD_VC2)
ENDIF()

IF (REVISION_CX_AUDIOSMART MATCHES yes)
    add_definitions(-DREVISION_CX_AUDIOSMART)
ENDIF()

# specify the cross compiler
SET(CMAKE_C_COMPILER   arm-linux-gnueabihf-gcc)
SET(CMAKE_CXX_COMPILER arm-linux-gnueabihf-g++)

# some program requires global define: versions.h
SET(GLOBAL_ROOT $ENV{PROJECT_ROOT})

# some program requires "depends/catch" ...
SET(DEPENDS_ROOT "${GLOBAL_ROOT}/depends")

# where is the target environment
SET(CMAKE_FIND_ROOT_PATH "${GLOBAL_ROOT}/output/arm")

# PKG_CONFIG_LIBDIR, PKG_CONFIG_PATH
set(ENV{PKG_CONFIG_LIBDIR} "${CMAKE_FIND_ROOT_PATH}/lib/pkgconfig")
# message (STATUS PKG_CONFIG_PATH=$ENV{PKG_CONFIG_PATH})
# message (STATUS PKG_CONFIG_LIBDIR=$ENV{PKG_CONFIG_LIBDIR})

# search for programs in the build host directories (not necessary)
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# include_directories(${CMAKE_FIND_ROOT_PATH}/include)
# link_directories(${CMAKE_FIND_ROOT_PATH}/lib)
# "../../../root/arm/lib"

# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -mfpu=neon")
# set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mfpu=neon")
