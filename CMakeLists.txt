cmake_minimum_required(VERSION 3.25)

project(DebugPythonGHA)
message(STATUS "Using CMake ${CMAKE_VERSION}")

message("PROJECT_SOURCE_DIR=${PROJECT_SOURCE_DIR}")
set(FILE_TO_COPY_PATH "${PROJECT_SOURCE_DIR}/CMakeLists.txt")

# install(CODE [[
#   execute_process(
#     COMMAND ${CMAKE_COMMAND}
#     -DFILE_TO_COPY_PATH="${PROJECT_SOURCE_DIR}/CMakeLists.txt"
#     -DEXECUTABLE_PATH="${CMAKE_INSTALL_PREFIX}/energyplus${CMAKE_EXECUTABLE_SUFFIX}"
#     -P ${PROJECT_SOURCE_DIR}/cmake/PythonGetLibAndLinkUp.cmake
#   )
# ]])

install(
    CODE "execute_process(
      COMMAND ${CMAKE_COMMAND}
      -DFILE_TO_COPY_PATH=${FILE_TO_COPY_PATH}
      -DEXECUTABLE_PATH=\${CMAKE_INSTALL_PREFIX}/energyplus${CMAKE_EXECUTABLE_SUFFIX}
      -P ${PROJECT_SOURCE_DIR}/cmake/PythonGetLibAndLinkUp.cmake
    )")

# install(CODE [[
#   execute_process(
#     COMMAND echo "CMAKE_INSTALL_PREFIX = ${CMAKE_INSTALL_PREFIX}"
#   )
# ]])


set(CPACK_GENERATOR "TGZ")
include(CPack)

add_custom_target(package_debug
  COMMAND ${CMAKE_CPACK_COMMAND} --debug --verbose --config CPackConfig.cmake
  COMMENTS "Build package with debug and verbose output"
)
