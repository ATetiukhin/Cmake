####################################################################################################
# GSL
#
# GSL_FOUND           = system has GSL lib
# GSL_LIBRARY         = full path to the GSL library
# GSL_INCLUDE_DIR     = where to find headers 
#
####################################################################################################

set(GSL_MSVC_PREFIX "$ENV{GSL_LIB}")

find_library(GSL_LIB gsl PATHS ${GSL_MSVC_PREFIX}/lib)
find_library(GSLCBLAS_LIB gslcblas cblas PATHS ${GSL_MSVC_PREFIX}/lib)

find_path(GSL_INCLUDE_DIR
    gsl/gsl_blas.h
    ${GSL_MSVC_PREFIX}/include
    )

include_directories(${GSL_INCLUDE_DIR})

if (GSL_LIB AND GSLCBLAS_LIB)
    set(GSL_LIBRARIES ${GSL_LIB} ${GSLCBLAS_LIB})
endif (GSL_LIB AND GSLCBLAS_LIB)

if (GSL_LIBRARIES)
  if (GSL_INCLUDE_DIR OR GSL_CXX_FLAGS)
    set(GSL_FOUND 1)
    message(STATUS "Using GSL from ${GSL_PREFIX}")
  endif (GSL_INCLUDE_DIR OR GSL_CXX_FLAGS)
endif (GSL_LIBRARIES)
