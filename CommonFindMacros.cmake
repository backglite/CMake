# Setup restricted search paths
macro(setup_find_root_context PKG)
    if (${PKG}_ROOT)
        set(_CMAKE_FIND_ROOT_PATH "${CMAKE_FIND_ROOT_PATH}")
        set(_CMAKE_PREFIX_PATH "${CMAKE_PREFIX_PATH}")
        set(CMAKE_FIND_ROOT_PATH "${${PKG}_ROOT}")
        set(CMAKE_PREFIX_PATH /)
        set(_${PKG}_FIND_OPTS ${${PKG}_FIND_OPTS})
        set(${PKG}_FIND_OPTS ONLY_CMAKE_FIND_ROOT_PATH ${${PKG}_FIND_OPTS})
    endif ()
endmacro()


# Restore original search paths
macro(restore_find_root_context PKG)
    if (${PKG}_ROOT)
        set(CMAKE_FIND_ROOT_PATH "${_CMAKE_FIND_ROOT_PATH}")
        set(CMAKE_PREFIX_PATH "${_CMAKE_PREFIX_PATH}")
        set(${PKG}_FIND_OPTS ${_${PKG}_FIND_OPTS})
    endif ()
endmacro()

# Setup library find suffix based on if static is required
macro(setup_find_library_suffix PKG)
    if (${PKG}_USE_STATIC_LIBS)
        if (CMAKE_CXX_COMPILER_ID MATCHES "GNU|Intel")
            set(_CMAKE_FIND_LIBRARY_SUFFIXES ${CMAKE_FIND_LIBRARY_SUFFIXES})
            set(CMAKE_FIND_LIBRARY_SUFFIXES ".a")
        endif ()
    endif ()
endmacro()

# Restore library find suffix
macro(restore_find_library_suffix PKG)
    if (${PKG}_USE_STATIC_LIBS)
        if (CMAKE_CXX_COMPILER_ID MATCHES "GNU|Intel")
            set(CMAKE_FIND_LIBRARY_SUFFIXES ${_CMAKE_FIND_LIBRARY_SUFFIXES})
        endif ()
    endif ()
endmacro()
