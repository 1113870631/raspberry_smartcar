cmake_minimum_required(VERSION 3.0.0)
project(send VERSION 0.1.0)

include(CTest)
enable_testing()
include_directories(./c_library_v2/common)
add_subdirectory(HC-SR04-Raspberry-Pi-C-) 
add_executable(send main.cpp)
target_link_libraries(send SR04_DISTANCE_LIB)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
