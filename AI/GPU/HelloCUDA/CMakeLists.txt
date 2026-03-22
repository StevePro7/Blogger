cmake_minimum_required(VERSION 3.19)
project(HelloCUDAl LANGUAGES CXX CUDA)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CUDA_STANDARD 17)
set(CMAKE_CUDA_STANDARD_REQUIRED ON)

# Enable debug symbols for device code
set(CMAKE_CUDA_FLAGS_DEBUG "-G -g")
set(CMAKE_CUDA_COMPILER /usr/local/cuda-12.1/bin/nvcc)

# Executable
add_executable(HelloCUDA hello.cu)

# Required for printf + debugging
set_target_properties(HelloCUDA PROPERTIES CUDA_SEPARABLE_COMPILATION ON)