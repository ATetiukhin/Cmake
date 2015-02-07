set(APP_NAME test_cuda)

set(TEST_CUDA test_cuda.cu)

############################################################################################

# CUDA
find_package(CUDA QUIET REQUIRED)
if (CUDA_FOUND)
  set(CUDA_NVCC_FLAGS -gencode arch=compute_30,code=sm_30 CACHE STRING "" FORCE)
  set(CUDA_NVCC_FLAGS_DEBUG -G CACHE STRING "" FORCE)
endif (CUDA_FOUND)

############################################################################################

cuda_compile(CUDA_ALL_FILES ${TEST_CUDA})
cuda_add_executable(${APP_NAME} ${CUDA_ALL_FILES})
set_target_properties(${APP_NAME} PROPERTIES OUTPUT_NAME_DEBUG "${APP_NAME}d")
set_target_properties(${APP_NAME} PROPERTIES OUTPUT_NAME_RELEASE ${APP_NAME})

############################################################################################

# Project settings
# Project settings
if (MSVC)
    set(CMAKE_CXX_FLAGS "/EHsc /W3 /nologo" CACHE STRING "" FORCE)

    set(CMAKE_CXX_FLAGS_DEBUG "/D_DEBUG /MTd /Zi /Ob0 /Od /RTC1")
    set(CMAKE_CXX_FLAGS_MINSIZEREL     "/MT /O1 /Ob1 /D NDEBUG")
    set(CMAKE_CXX_FLAGS_RELEASE        "/MT /O2 /Ob2 /D NDEBUG")
    set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "/MT /Zi /O2 /Ob1 /D NDEBUG")

    set_target_properties(${APP_NAME} PROPERTIES LINK_FLAGS " /DYNAMICBASE:NO /FIXED")

elseif (CMAKE_COMPILER_IS_GNUCXX)
    # Setting directory
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIRECTORY} CACHE STRING "" FORCE)

    # Compiler flags
    set(CMAKE_CXX_FLAGS " -std=c++11 -Wall " CACHE STRING "" FORCE)
    set(CMAKE_CXX_FLAGS_DEBUG " -g -Os " CACHE STRING "" FORCE)
    set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE}" CACHE STRING "" FORCE)

    # Linker flags
    set(CMAKE_EXE_LINKER_FLAGS " -static-libgcc -static-libstdc++ -static " CACHE STRING "" FORCE)
    set(CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS "" CACHE STRING "" FORCE) # remove dynamic for CXX
    set(BUILD_SHARED_LIBS OFF)
endif (MSVC)

############################################################################################
