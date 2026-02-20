macro(test_cmake_template_configure_linker project_name)
  set(test_cmake_template_USER_LINKER_OPTION
    "DEFAULT"
      CACHE STRING "Linker to be used")
    set(test_cmake_template_USER_LINKER_OPTION_VALUES "DEFAULT" "SYSTEM" "LLD" "GOLD" "BFD" "MOLD" "SOLD" "APPLE_CLASSIC" "MSVC")
  set_property(CACHE test_cmake_template_USER_LINKER_OPTION PROPERTY STRINGS ${test_cmake_template_USER_LINKER_OPTION_VALUES})
  list(
    FIND
    test_cmake_template_USER_LINKER_OPTION_VALUES
    ${test_cmake_template_USER_LINKER_OPTION}
    test_cmake_template_USER_LINKER_OPTION_INDEX)

  if(${test_cmake_template_USER_LINKER_OPTION_INDEX} EQUAL -1)
    message(
      STATUS
        "Using custom linker: '${test_cmake_template_USER_LINKER_OPTION}', explicitly supported entries are ${test_cmake_template_USER_LINKER_OPTION_VALUES}")
  endif()

  set_target_properties(${project_name} PROPERTIES LINKER_TYPE "${test_cmake_template_USER_LINKER_OPTION}")
endmacro()
