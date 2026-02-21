16-Feb-2026

https://medium.com/@stevechange/using-python-with-c-part1-3e894912214d

mkdir -p /home/stevepro/GitHub/StevePro9/PythonSetup/PyBind/new-02/01-stevechange-01


Launch CLion
C++ Executable
C++17
/home/stevepro/GitHub/StevePro9/PythonSetup/PyBind/new-02/01-stevechange-01/cpp


CLion | Build, Execution, Deployment | CMake
Build directory    build


${CMAKE_SOURCE_DIR}/.venv
Change to
${CMAKE_SOURCE_DIR}/../python/.venv


delete build dir
mkdir build
cd build
cmake ..


Had to close CLion
delete .idea
re-launch CLion
configure build directory
now all good after refresh


DEBUGGING
Ensure CLion Build | Build All in Debug

TODO - can I set CMake configuration

cmake -DCMAKE_BUILD_TYPE=Debug ..
-g -O0

VS Code debug as before
ps aux | grep main.py


CLion
Must do this first
sudo sysctl kernel.yama.ptrace_scope=0
