cmake_minimum_required(VERSION 3.10)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

project(output VERSION 1.0)
include_directories(${PROJECT_SOURCE_DIR})

add_executable(output main.cpp printHelloWorld.cpp)
