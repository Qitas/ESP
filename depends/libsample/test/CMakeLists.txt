# 查找当前目录下的所有源文件 并将名称保存到 DIR_SRCS 变量
aux_source_directory(. DIR_SRCS)

include_directories(${CMAKE_CURRENT_LIST_DIR}/../include)
include_directories(${DEPENDS_ROOT}/Catch/single_include)

set (EXTRA_LIBS ${EXTRA_LIBS} ${PROJECT_NAME})

# 指定生成目标
add_executable(test_${PROJECT_NAME} ${DIR_SRCS})
target_link_libraries(test_${PROJECT_NAME} ${EXTRA_LIBS})

# 启用测试
# enable_testing()

# 测试程序是否成功运行
# add_test(test_${PROJECT_NAME} demo)
