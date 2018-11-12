set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14")

# 查找当前目录下的所有源文件 并将名称保存到 DIR_SRCS 变量
aux_source_directory(. DIR_SRCS)

aux_source_directory(${GLOBAL_ROOT}/depends/liblvgl/lvgl/lv_core DIR_SRCS_LVGL)
aux_source_directory(${GLOBAL_ROOT}/depends/liblvgl/lvgl/lv_draw DIR_SRCS_LVGL)
aux_source_directory(${GLOBAL_ROOT}/depends/liblvgl/lvgl/lv_hal DIR_SRCS_LVGL)
aux_source_directory(${GLOBAL_ROOT}/depends/liblvgl/lvgl/lv_misc DIR_SRCS_LVGL)
aux_source_directory(${GLOBAL_ROOT}/depends/liblvgl/lvgl/lv_misc/lv_fonts DIR_SRCS_LVGL)
aux_source_directory(${GLOBAL_ROOT}/depends/liblvgl/lvgl/lv_objx DIR_SRCS_LVGL)
aux_source_directory(${GLOBAL_ROOT}/depends/liblvgl/lvgl/lv_themes DIR_SRCS_LVGL)

aux_source_directory(${GLOBAL_ROOT}/depends/liblvgl/lv_drivers/display DIR_SRCS_LVGL)
aux_source_directory(${GLOBAL_ROOT}/depends/liblvgl/lv_drivers/indev DIR_SRCS_LVGL)

INCLUDE_DIRECTORIES(${CMAKE_CURRENT_LIST_DIR}/../include)
INCLUDE_DIRECTORIES(${GLOBAL_ROOT})

INCLUDE_DIRECTORIES(${GLOBAL_ROOT}/depends/liblvgl)

# include_directories(${DEPENDS_ROOT})
INCLUDE_DIRECTORIES(${CMAKE_INSTALL_PREFIX}/usr/include)
LINK_DIRECTORIES(${CMAKE_INSTALL_PREFIX}/usr/lib)

INCLUDE(FindPkgConfig)
PKG_SEARCH_MODULE(DAEMON libdaemon)
IF(DAEMON_FOUND)
  INCLUDE_DIRECTORIES(${DAEMON_INCLUDE_DIRS})
  LINK_DIRECTORIES(${DAEMON_LIBRARY_DIRS})
ELSE()
  MESSAGE(WARNING "libdaemon not found")
ENDIF()

INCLUDE(FindPkgConfig)
PKG_SEARCH_MODULE(SDL libSDL2)
IF(SDL_FOUND)
  INCLUDE_DIRECTORIES(${SDL_INCLUDE_DIRS})
  LINK_DIRECTORIES(${SDL_LIBRARY_DIRS})
ELSE()
  MESSAGE(WARNING "libSDL2 not found")
ENDIF()

# link_libraries(ozlog daemon)
link_libraries(sample)
link_libraries(SDL2)

# 指定生成目标
add_executable(${PROJECT_NAME} ${DIR_SRCS_LVGL} ${DIR_SRCS})

# INSTALL
INSTALL(TARGETS ${PROJECT_NAME} DESTINATION usr/sbin)
