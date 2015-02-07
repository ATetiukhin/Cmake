####################################################################################################
# CGNS
#
# CGNS_FOUND           = system has CGNS lib
# CGNS_LIBRARY_DEBUG   = full path to the CGNS library debug
# CGNS_LIBRARY_RELEASE = full path to the CGNS library release
# CGNS_INCLUDE_DIR     = where to find headers 
#
####################################################################################################

find_path(CGNS_INCLUDE_DIR NAMES cgnslib.h PATHS
    "$ENV{CGNS_ROOT}/include" 
    PATH_SUFFIXES cgnslib 
    )
include_directories(${CGNS_INCLUDE_DIR})


find_library(CGNS_LIBRARY_DEBUG NAMES cgnsd PATHS "$ENV{CGNS_ROOT}/lib")
find_library(CGNS_LIBRARY_RELEASE NAMES cgns PATHS "$ENV{CGNS_ROOT}/lib")

if (CGNS_INCLUDE_DIR AND CGNS_LIBRARY_DEBUG AND CGNS_LIBRARY_RELEASE)
  set(CGNS_FOUND TRUE)
endif (CGNS_INCLUDE_DIR AND CGNS_LIBRARY_DEBUG AND CGNS_LIBRARY_RELEASE)

if (CGNS_FOUND)
  if (NOT CGNS_FIND_QUIETLY)
    message(STATUS "Found CGNS: $ENV{CGNS_ROOT}")
  endif (NOT CGNS_FIND_QUIETLY)
else (CGNS_FOUND)
  if (CGNS_FIND_REQUIRED)
    message(FATAL_ERROR ${CGNS_INCLUDE_DIR})
    message(FATAL_ERROR ${CGNS_LIBRARY_DEBUG})
    message(FATAL_ERROR ${CGNS_LIBRARY_RELEASE})
  endif (CGNS_FIND_REQUIRED)
endif (CGNS_FOUND)
