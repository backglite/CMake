# RabbitMQ_FOUND       - Set to true if RabbitMQ can be found
# RabbitMQ_INCLUDE_DIR - The path to the RabbitMQ header files
# RabbitMQ_LIBRARY     - The full path to the RabbitMQ library

if (RabbitMQ_DIR)
    find_package(RabbitMQ NO_MODULE)
elseif (NOT RabbitMQ_FOUND)
    include(CommonFindMacros)

    setup_find_root_context(RabbitMQ)
    setup_find_library_suffix(RabbitMQ)
    find_path(RabbitMQ_INCLUDE_DIR amqp.h ${RabbitMQ_FIND_OPTS})
    find_library(RabbitMQ_LIBRARY rabbitmq ${RabbitMQ_FIND_OPTS})
    restore_find_library_suffix(RabbitMQ)
    restore_find_root_context(RabbitMQ)

    include(FindPackageHandleStandardArgs)
    FIND_PACKAGE_HANDLE_STANDARD_ARGS(RabbitMQ RabbitMQ_INCLUDE_DIR RabbitMQ_LIBRARY)
    if (LOG4CXX_FOUND)
        set(RabbitMQ_FOUND TRUE)
    endif ()
endif ()
