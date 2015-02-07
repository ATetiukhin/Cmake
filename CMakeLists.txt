cmake_minimum_required(VERSION 3.0.0 FATAL_ERROR)

# Project settings
set(PROJECT_NAME CMake)
project(${PROJECT_NAME})

set(VERSION_MAJOR 1)
set(VERSION_MINOR 0)
set(VERSION_PATCH 0)
set(VERSION ${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH})
message(STATUS "VERSION: " ${VERSION})

############################################################################################

# OS settings
if (WIN32 OR APPLE)
    set(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR}/build/install CACHE STRING "" FORCE)
    set(CMAKE_CONFIGURATION_TYPES "Debug;Release" CACHE STRING "" FORCE)
endif(WIN32 OR APPLE)

# Cmake settings
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PROJECT_SOURCE_DIR}/cmake)

############################################################################################

add_subdirectory(Boost)
add_subdirectory(CUDA)
add_subdirectory(GTest)
add_subdirectory(OpenMP)
add_subdirectory(Qt5)

############################################################################################

find_package(Qwt QUIET REQUIRED)
find_package(GSL QUIET REQUIRED)
find_package(CGNS QUIET REQUIRED)

############################################################################################
