# CppUnit_FOUND       - Set to true if CppUnit can be found
# CppUnit_INCLUDE_DIR - The path to the CppUnit header files
# CppUnit_LIBRARY     - The full path to the CppUnit library

if (CppUnit_DIR)
    find_package(CppUnit NO_MODULE)
elseif (NOT CppUnit_FOUND)
    include(CommonFindMacros)

    setup_find_root_context(CppUnit)
    setup_find_library_suffix(CppUnit)
    find_path(CppUnit_INCLUDE_DIR cppunit/TestRunner.h ${CppUnit_FIND_OPTS})
    find_library(CppUnit_LIBRARY cppunit ${CppUnit_FIND_OPTS})
    restore_find_library_suffix(CppUnit)
    restore_find_root_context(CppUnit)

    include(FindPackageHandleStandardArgs)
    FIND_PACKAGE_HANDLE_STANDARD_ARGS(CppUnit CppUnit_INCLUDE_DIR CppUnit_LIBRARY)
    if (LOG4CXX_FOUND)
        set(CppUnit_FOUND TRUE)
    endif ()
endif ()
