cmake_minimum_required(VERSION 3.5)
project (vncserver)

SET(ENABLE_SHARED OFF CACHE BOOL "Build shared library")
SET(ENABLE_STATIC ON CACHE BOOL "Build shared library")

SET(PNG_TESTS OFF CACHE BOOL "Build libpng tests")
SET(PNG_SHARED OFF CACHE BOOL "Build libpng shared library")
SET(PNG_STATIC ON CACHE BOOL "Build libpng static library")
SET(PNG_HARDWARE_OPTIMIZATIONS OFF)
SET(SKIP_INSTALL_PROGRAMS ON CACHE BOOL "Install libpng program")
SET(PNG_ARM_NEON off CACHE STRING "")
SET(CMAKE_SYSTEM_PROCESSOR "arm" CACHE STRING "")

SET(BUILD_TESTING OFF CACHE BOOL "Build test for liblzo")

SET(OPENSSL_USE_STATIC_LIBS TRUE)
SET(OPENSSL_ROOT_DIR "${PROJECT_SOURCE_DIR}/openssl-1.1.1b")


SET(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR}/build CACHE STRING "")
SET(CMAKE_ASM_COMPILE_OBJECT "<CMAKE_ASM_COMPILER> <DEFINES> <FLAGS> -o <OBJECT>   -c <SOURCE>")

add_subdirectory(lzo-2.10)
add_subdirectory(libpng-1.6.36)
add_subdirectory(libvncserver)
