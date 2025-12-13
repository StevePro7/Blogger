cmake_minimum_required(VERSION 3.19)
set(CMAKE_CUDA_COMPILER /usr/local/cuda-11.8/bin/nvcc)
project(cuda_hello LANGUAGES CXX CUDA)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CUDA_STANDARD 14)
set(CMAKE_CUDA_STANDARD_REQUIRED ON)

# Enable debug symbols for device code
set(CMAKE_CUDA_FLAGS_DEBUG "-G -g")
#add_executable(cuda_hello main.cpp)
add_executable(cuda_hello hello.cu)

# Required for printf + debugging
set_target_properties(cuda_hello PROPERTIES CUDA_SEPARABLE_COMPILATION ON)
