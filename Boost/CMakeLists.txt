set(APP_NAME test_boost)

set(ALL_FILES test_boost.cpp)

############################################################################################

# BOOST
set(Boost_USE_STATIC_LIBS        ON)
set(Boost_USE_MULTITHREADED      ON)
set(Boost_USE_STATIC_RUNTIME    OFF)
set(BOOST_COMPONENTS
    atomic
    chrono
    container
    context
    coroutine
    date_time
    filesystem
    graph
    iostreams
    locale
    log
    prg_exec_monitor
    math_C99
    math_c99f
    math_c99l
    math_tr1
    math_tr1f
    math_tr1l
    prg_exec_monitor
    program_options
    random
    regex
    serialization
    signals
    system
    thread
    timer
    unit_test_framework
    wave
    wserialization
    )

find_package(Boost 1.57.0 COMPONENTS ${BOOST_COMPONENTS} QUIET REQUIRED)
include_directories(${Boost_INCLUDE_DIRS})

############################################################################################

add_executable(${APP_NAME} ${ALL_FILES})
target_link_libraries(${APP_NAME} ${Boost_LIBRARIES})
set_target_properties(${APP_NAME} PROPERTIES OUTPUT_NAME_DEBUG "${APP_NAME}d")
set_target_properties(${APP_NAME} PROPERTIES OUTPUT_NAME_RELEASE ${APP_NAME})

############################################################################################

# Project settings
if (MSVC)
    set(CMAKE_CXX_FLAGS "/EHsc /W3 /nologo" CACHE STRING "" FORCE)

    set(CMAKE_CXX_FLAGS_DEBUG "/D_DEBUG /MDd /Zi /Ob0 /Od /RTC1")
    set(CMAKE_CXX_FLAGS_MINSIZEREL     "/MD /O1 /Ob1 /D NDEBUG")
    set(CMAKE_CXX_FLAGS_RELEASE        "/MD /O2 /Ob2 /D NDEBUG")
    set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "/MD /Zi /O2 /Ob1 /D NDEBUG")

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
