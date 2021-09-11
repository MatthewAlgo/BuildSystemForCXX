# Cmake version here
cmake_minimum_required(VERSION 3.18)

# For VCPKG
set(CMAKE_TOOLCHAIN_FILE "/home/matthewalgo/MSPackageManager/scripts/buildsystems/vcpkg.cmake")
set(CMAKE_PREFIX_PATH "/home/matthewalgo/MSPackageManager/installed/x64-linux/share")

set(CMAKE_VERBOSE_MAKEFILE ON)

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Debug CACHE STRING "Choose the type of build (Debug or Release)" FORCE)
endif()

project(MyCPPProject VERSION 1.0)
set(myproject_VERSION_MAJOR 1)
set(myproject_VERSION_MINOR 0)

# add_subdirectory(SOURCE_CPP)
# add_subdirectory(BUILD_GCC_CMAKE)


# SET CMAKE AND COMPILER OPTIONS
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++20 -pthread")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -Wall -g -fsanitize=address -fno-omit-frame-pointer")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE}")
set(CMAKE_MODULE_PATH "${CMAKE_MODULE_PATH};${CMAKE_CURRENT_SOURCE_DIR}/CMAKE")


# END OF UPPER_DIRECTORY FILE


# BUILD CURRENT FILES
set(EXECUTABLE_NAME "MY_CPP_PROJECT_CMAKE.exe")
add_executable(${EXECUTABLE_NAME} "MyFile.cpp"  "MyFirstHeader.h")


set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/CMAKE_MODULES" ${CMAKE_MODULE_PATH})


find_package(SFML COMPONENTS system window graphics CONFIG REQUIRED)
target_link_libraries(${EXECUTABLE_NAME} PRIVATE sfml-system sfml-network sfml-graphics sfml-window)



install(TARGETS ${EXECUTABLE_NAME} DESTINATION BINARY_CMAKE)


# DEPRECATED FUNCTIONS -----> NOT IN CONTINUOUS USE ANYMORE
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~ TO LINK THE SFML LIBRARY ~~~~~~~~~~~~~~~~~~~~~~~
# find_package(SFML 2 COMPONENTS network audio graphics window system REQUIRED)
# if(SFML_FOUND)
#  include_directories(${SFML_INCLUDE_DIR})
#  target_link_libraries(${EXECUTABLE_NAME} sfml-window sfml-graphics sfml-network sfml-system)
# endif()

#~~~~~~~~~~~~~~~~~~~~~ TO LINK THE OPENGL LIBRARY ~~~~~~~~~~~~~~~~~~~~~~~
# find_package(OpenGL REQUIRED)
# include_directories(${OPENGL_INCLUDE_DIR})
# if (OPENGL_FOUND)
#   target_link_libraries(${EXECUTABLE_NAME} ${OPENGL_LIBRARIES})
# endif()

#~~~~~~~~~~~~~~~~~~~~~ TO LINK THE BOOST LIBRARY ~~~~~~~~~~~~~~~~~~~~~~~
# find_package(Boost 1.34.0 REQUIRED system filesystem)
# if(Boost_FOUND)
#   include_directories(${Boost_INCLUDE_DIRS})
#   target_link_libraries(${EXECUTABLE_NAME} ${Boost_LIBRARIES})
# endif()

#~~~~~~~~~~~~~~~~~~~~~ TO LINK THE YAML_CPP LIBRARY ~~~~~~~~~~~~~~~~~~~~~~~
# include(FindPkgConfig)
# pkg_check_modules(yaml-cpp REQUIRED yaml-cpp>=0.2.5)
# if(yaml-cpp_FOUND)
#   include_directories(${yaml-cpp_INCLUDE_DIRS})
#   link_directories(${yaml-cpp_LIBRARY_DIRS})
#   target_link_libraries(${EXECUTABLE_NAME} ${yaml-cpp_LIBRARIES})
# endif()


# CPack packaging
#include(InstallRequiredSystemLibraries)
#set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_SOURCE_DIR}/COPYING")
#set(CPACK_PACKAGE_VERSION_MAJOR "${myproject_VERSION_MAJOR}")
#set(CPACK_PACKAGE_VERSION_MINOR "${myproject_VERSION_MINOR}")
#include(CPack)