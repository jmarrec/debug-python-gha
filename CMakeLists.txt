cmake_minimum_required(VERSION 3.25)

project(DebugPythonGHA)
message(STATUS "Using CMake ${CMAKE_VERSION}")

if(Python_REQUIRED_VERSION)
  find_package(Python ${Python_REQUIRED_VERSION} EXACT COMPONENTS Interpreter Development REQUIRED)
else()
  find_package(Python 3.8 COMPONENTS Interpreter Development REQUIRED)
endif()
get_filename_component(RESOLVED_PYTHON_LIBRARY "${Python_LIBRARIES}" REALPATH)
message("Python_LIBRARIES=${Python_LIBRARIES}")
message("RESOLVED_PYTHON_LIBRARY=${RESOLVED_PYTHON_LIBRARY}")

# install(
#     CODE "execute_process(
#       COMMAND ${CMAKE_COMMAND}
#       -DRESOLVED_PYTHON_LIB=${RESOLVED_PYTHON_LIBRARY}
#       -DEXECUTABLE_PATH=\${CMAKE_INSTALL_PREFIX}/energyplus${CMAKE_EXECUTABLE_SUFFIX}
#       -P ${PROJECT_SOURCE_DIR}/cmake/PythonGetLibAndLinkUp.cmake
#     )")

install(CODE [[
  execute_process(
    COMMAND echo "CMAKE_INSTALL_PREFIX = ${CMAKE_INSTALL_PREFIX}"
  )
]])


set(CPACK_GENERATOR "TGZ")
include(CPack)

add_custom_target(package_debug
  COMMAND ${CMAKE_CPACK_COMMAND} --debug --verbose --config CPackConfig.cmake
  COMMENTS "Build package with debug and verbose output"
)
