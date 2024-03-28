message("PYTHON: Collecting Python dynamic library")

message("Args:")
message("- FILE_TO_COPY_PATH=${FILE_TO_COPY_PATH}")
message("- EXECUTABLE_PATH=${EXECUTABLE_PATH}")

# get some path info things
get_filename_component(BASE_PATH ${EXECUTABLE_PATH} DIRECTORY)

message("COPYING ${FILE_TO_COPY_PATH} to ${BASE_PATH}")
execute_process(COMMAND "${CMAKE_COMMAND}" -E copy "${FILE_TO_COPY_PATH}" "${BASE_PATH}")
