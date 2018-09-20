# JSONSpirit_FOUND       - Set to true if JSONSpirit can be found
# JSONSpirit_INCLUDE_DIR - The path to the JSONSpirit header files
# JSONSpirit_LIBRARY     - The full path to the JSONSpirit library

if (JSONSpirit_DIR)
    find_package(JSONSpirit NO_MODULE)
elseif (NOT JSONSpirit_FOUND)
    include(CommonFindMacros)

    setup_find_root_context(JSONSpirit)
    setup_find_library_suffix(JSONSpirit)
    find_path(JSONSpirit_INCLUDE_DIR json_spirit.h ${JSONSpirit_FIND_OPTS})
    find_library(JSONSpirit_LIBRARY json_spirit ${JSONSpirit_FIND_OPTS})
    restore_find_library_suffix(JSONSpirit)
    restore_find_root_context(JSONSpirit)

    include(FindPackageHandleStandardArgs)
    FIND_PACKAGE_HANDLE_STANDARD_ARGS(JSONSpirit JSONSpirit_INCLUDE_DIR JSONSpirit_LIBRARY)
    if (JSONSPIRIT_FOUND)
        set(JSONSpirit_FOUND TRUE)
    endif ()
endif ()
