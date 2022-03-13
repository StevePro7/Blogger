cmake_minimum_required(VERSION 3.16)
project(ebpf_hello_world C)

set(CMAKE_C_STANDARD 11)

include_directories(.)

link_directories(libbpf /home/stevepro/GitHub/sartura/ebpf-hello-world/libbpf/src)
add_executable(ebpf_hello_world hello.c)
target_link_libraries(ebpf_hello_world bpf elf z)



#TODO delete below
#link_directories(/usr/lib64)

#add_library(libbpf STATIC)
link_directories(libbpf /home/stevepro/GitHub/sartura/ebpf-hello-world/libbpf/src)
#set_target_properties(libbpf PROPERTIES
#        IMPORTED_LOCATION "/home/stevepro/GitHub/sartura/ebpf-hello-world/libbpf/src/libbpf.so"
#        INTERFACE_INCLUDE_DIRECTORIES "/home/stevepro/GitHub/sartura/ebpf-hello-world/libbpf/src/"
#        )

#ADD_LIBRARY(LibsModule STATIC libbpf/src/*.c)

#target_link_libraries(LibsModule libbpf/build/libbpf.a)
#target_link_libraries(LibsModule -lelf)
#target_link_libraries(LibsModule -lz)
#target_link_libraries(LibsModule -L/home/stevepro/GitHub/sartura/ebpf-hello-world/libbpf/src/)

add_executable(ebpf_hello_world hello.c)

#target_link_libraries(libbpf)

target_link_libraries(ebpf_hello_world bpf elf z)