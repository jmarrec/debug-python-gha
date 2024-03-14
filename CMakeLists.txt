find_package(Python 3.12  EXACT COMPONENTS Interpreter Development REQUIRED)
get_filename_component(RESOLVED_PYTHON_LIBRARY "${Python_LIBRARIES}" REALPATH)
message("Python_LIBRARIES=${Python_LIBRARIES}")
message("RESOLVED_PYTHON_LIBRARY=${RESOLVED_PYTHON_LIBRARY}")
