cmake_minimum_required(VERSION 3.0.0)
project(ProjectInBuildSystem VERSION 0.1.0)

if(WIN32) # IF WE ARE ON WINDOWS

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_TOOLCHAIN_FILE "E:/_WINDOWS_DATA_/VCPKG_PACKAGE_MANAGER/scripts/buildsystems/vcpkg.cmake")
set(EXECUTABLE_NAME "MY_CPP_PROJECT_CMAKE.exe")


INCLUDE_DIRECTORIES(
    E:/_WINDOWS_DATA_/VCPKG_PACKAGE_MANAGER/installed/x86-windows/include
)

LINK_DIRECTORIES(
    E:/_WINDOWS_DATA_/VCPKG_PACKAGE_MANAGER/installed/x86-windows/lib
)


add_executable(ProjectInBuildSystem SOURCE_CPP/mainFile.cpp)

# For SFML
find_package(SFML COMPONENTS system window graphics CONFIG REQUIRED) # REQUIRED FOR DLL's

TARGET_LINK_LIBRARIES( ProjectInBuildSystem PRIVATE
    sfml-graphics
    sfml-system
    sfml-audio
    sfml-window
)

ADD_TEST(NAME ProjectInBuildSystem COMMAND ProjectInBuildSystem)

INSTALL(TARGETS ProjectInBuildSystem DESTINATION "Binaries")

endif()







if(UNIX) # IF WE ARE ON UNIX


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
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++20 -pthread")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -Wall -g -fsanitize=address -fno-omit-frame-pointer")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE}")
set(CMAKE_MODULE_PATH "${CMAKE_MODULE_PATH};${CMAKE_CURRENT_SOURCE_DIR}/CMAKE")

set(CMAKE_TOOLCHAIN_FILE "/home/matthewalgo/MSPackageManager/scripts/buildsystems/vcpkg.cmake")



# BUILD CURRENT FILES
set(EXECUTABLE_NAME "MY_CPP_PROJECT_CMAKE.exe")

INCLUDE_DIRECTORIES(
    /home/matthewalgo/MSPackageManager/installed/x64-linux/include

)

LINK_DIRECTORIES(
    /home/matthewalgo/MSPackageManager/installed/x64-linux/lib

)


add_executable(${EXECUTABLE_NAME} "mainFile.cpp") # Add your c++ and header files here


set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/CMAKE_MODULES" ${CMAKE_MODULE_PATH})


find_package(SFML COMPONENTS system window graphics CONFIG REQUIRED)
target_link_libraries(${EXECUTABLE_NAME} PRIVATE 
    sfml-system 
    sfml-network 
    sfml-graphics
    sfml-window
)


install(TARGETS ${EXECUTABLE_NAME} DESTINATION BINARY_CMAKE)

endif()