# Cmake version here

cmake_minimum_required(VERSION 3.18)
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
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -pthread")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -Wall -g -fsanitize=address -fno-omit-frame-pointer")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE}")
set(CMAKE_MODULE_PATH "${CMAKE_MODULE_PATH};${CMAKE_CURRENT_SOURCE_DIR}/CMAKE")


# END OF UPPER_DIRECTORY FILE


# BUILD CURRENT FILES
set(EXECUTABLE_NAME "MY_CPP_PROJECT_CMAKE.exe")
add_executable(${EXECUTABLE_NAME} "MyFile.cpp"  "MyFirstHeader.h"  "MyFourthFile.cpp"  "MyFourthHeader.h"  "MySecondHeader.h"  "MySecondFile.cpp"  "MyThirdFile.cpp"  "MyThirdHeader.h"  "MyCXXFile.cxx")

set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/CMAKE_MODULES" ${CMAKE_MODULE_PATH})
#Find any version 2.X of SFML
#See the FindSFML.cmake file for additional details and instructions

#~~~~~~~~~~~~~~~~~~~~~ TO LINK THE SFML LIBRARY ~~~~~~~~~~~~~~~~~~~~~~~
find_package(SFML 2 COMPONENTS network audio graphics window system REQUIRED)
if(SFML_FOUND)
  include_directories(${SFML_INCLUDE_DIR})
  # target_link_libraries(${EXECUTABLE_NAME} ${SFML_LIBRARIES} ${SFML_DEPENDENCIES})
  target_link_libraries(${EXECUTABLE_NAME} sfml-window sfml-graphics sfml-network sfml-system)
endif()

#~~~~~~~~~~~~~~~~~~~~~ TO LINK THE OPENGL LIBRARY ~~~~~~~~~~~~~~~~~~~~~~~
find_package(OpenGL REQUIRED)
include_directories(${OPENGL_INCLUDE_DIR})
if (OPENGL_FOUND)
  target_link_libraries(${EXECUTABLE_NAME} ${OPENGL_LIBRARIES})
  # or: target_link_libraries(${EXECUTABLE_NAME} ${OPENGL_gl_LIBRARY})
  target_link_libraries(${EXECUTABLE_NAME} m)  # if you use maths.h
endif()

#~~~~~~~~~~~~~~~~~~~~~ TO LINK THE BOOST LIBRARY ~~~~~~~~~~~~~~~~~~~~~~~
# boost::filesystem
#set(Boost_ADDITIONAL_VERSIONS "1.78" "1.78.0" "1.79" "1.79.0")
find_package(Boost 1.34.0 REQUIRED system filesystem)
if(Boost_FOUND)
  include_directories(${Boost_INCLUDE_DIRS})
  target_link_libraries(${EXECUTABLE_NAME} ${Boost_LIBRARIES})
endif()

#~~~~~~~~~~~~~~~~~~~~~ TO LINK THE YAML_CPP LIBRARY ~~~~~~~~~~~~~~~~~~~~~~~
include(FindPkgConfig)
pkg_check_modules(yaml-cpp REQUIRED yaml-cpp>=0.2.5)
if(yaml-cpp_FOUND)
  include_directories(${yaml-cpp_INCLUDE_DIRS})
  link_directories(${yaml-cpp_LIBRARY_DIRS})
endif()
# add_executable(${EXECUTABLE_NAME} ${SOURCES})
target_link_libraries(${EXECUTABLE_NAME} ${yaml-cpp_LIBRARIES})


install(TARGETS ${EXECUTABLE_NAME} DESTINATION BINARY_CMAKE)

# CPack packaging
#include(InstallRequiredSystemLibraries)
#set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_SOURCE_DIR}/COPYING")
#set(CPACK_PACKAGE_VERSION_MAJOR "${myproject_VERSION_MAJOR}")
#set(CPACK_PACKAGE_VERSION_MINOR "${myproject_VERSION_MINOR}")
#include(CPack)