cmake_minimum_required(VERSION 3.16)
project(ebpf_hello_world C)

set(CMAKE_C_STANDARD 11)

include_directories(.)
link_directories(libbpf libbpf/src)

add_executable(ebpf_hello_world hello.c)
target_link_libraries(ebpf_hello_world bpf elf z)