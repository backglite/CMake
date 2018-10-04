# PCAP_FOUND       - Set to true if PCAP can be found
# PCAP_INCLUDE_DIR - The path to the PCAP header files
# PCAP_LIBRARY     - The full path to the PCAP library

if (PCAP_DIR)
    find_package(PCAP NO_MODULE)
elseif (NOT PCAP_FOUND)
    include(CommonFindMacros)

    setup_find_root_context(PCAP)
    setup_find_library_suffix(PCAP)
    find_path(PCAP_INCLUDE_DIR pcap.h ${PCAP_FIND_OPTS})
    find_library(PCAP_LIBRARY pcap ${PCAP_FIND_OPTS})
    restore_find_library_suffix(PCAP)
    restore_find_root_context(PCAP)

    include(FindPackageHandleStandardArgs)
    find_package_handle_standard_args(PCAP PCAP_INCLUDE_DIR PCAP_LIBRARY)
endif ()
