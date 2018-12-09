# CMake 最低版本号要求
cmake_minimum_required (VERSION 3.0)

INCLUDE(CheckLibraryExists)
INCLUDE(CheckFunctionExists)

# 项目信息
project(appmain)

# Version
set (${PROJECT_NAME}_VERSION_MAJOR 1)
set (${PROJECT_NAME}_VERSION_MINOR 0)

# 添加 src 子目录
add_subdirectory(src)
add_subdirectory(test)