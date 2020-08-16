cmake_minimum_required(VERSION 2.8.12)

# format source files with uncrustify
macro(LIBYANG_FORMAT)
    find_program(UNCRUSTIFY uncrustify)
    find_package_handle_standard_args(uncrustify DEFAULT_MSG UNCRUSTIFY)

    if(CLANG_FORMAT)
        add_custom_target(format
                COMMAND ${UNCRUSTIFY} -c ${CMAKE_SOURCE_DIR}/uncrustify.cfg --no-backup --replace ${CMAKE_SOURCE_DIR}/src/* ${CMAKE_SOURCE_DIR}/compat/*
                WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
                COMMENT "Formating sources with ${UNCRUSTIFY} ...")

        add_custom_target(format-check
                COMMAND ${UNCRUSTIFY} -c ${CMAKE_SOURCE_DIR}/uncrustify.cfg --check ${CMAKE_SOURCE_DIR}/src/* ${CMAKE_SOURCE_DIR}/compat/*
                WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
                COMMENT "Checking format of the sources with ${UNCRUSTIFY} ...")
    endif()
endmacro()
