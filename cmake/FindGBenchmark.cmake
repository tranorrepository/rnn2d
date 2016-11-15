SET(GBENCH_ROOT "" CACHE PATH "Folder containing Google Benchmark install")
MARK_AS_ADVANCED(GBENCH_ROOT)

FIND_PATH(GBENCH_INCLUDE_DIR
  NAMES benchmark/benchmark.h
  HINTS ${GBENCH_ROOT} $ENV{GBENCH_ROOT}
  PATH_SUFFIXES include
)
MARK_AS_ADVANCED(GBENCH_INCLUDE_DIR)

FIND_LIBRARY(GBENCH_LIBRARY
  NAMES benchmark
  HINTS ${GBENCH_ROOT} $ENV{GBENCH_ROOT}
  PATH_SUFFIXES lib lib64
)
MARK_AS_ADVANCED(GBENCH_LIBRARY)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(GBENCH
  DEFAULT_MSG GBENCH_LIBRARY GBENCH_INCLUDE_DIR)

MESSAGE(STATUS "GBENCH_INCLUDE_DIR = ${GBENCH_INCLUDE_DIR}")
MESSAGE(STATUS "GBENCH_LIBRARY = ${GBENCH_LIBRARY}")

IF(GBENCH_FOUND)
  SET(GBENCH_INCLUDE_DIRS ${GBENCH_INCLUDE_DIR})
  SET(GBENCH_LIBRARIES ${GBENCH_LIBRARY})
ENDIF()