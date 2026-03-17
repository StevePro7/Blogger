PyBind11Test
01-Feb-2025

Reference
~/GitHub/StevePro9/PythonSetup/PyBind/org/03-inline-bindings/PyBind11Test

Launch PyCharm
New Project
~/GitHub/StevePro9/PythonSetup/PyBind/new-03/01-inline-bindings

Creates .venv  
Otherise  
uv venv --python 3.11.11
source .venv/bin/activate  

uv add pybind11
uv sync  

`which python` --version  
3.11.11  


touch hello.cpp  
touch CMakeLists.txt  

mkdir -p build
cd build
cmake -DPython3_EXECUTABLE=$(which python) ..  
make -j$(grep -c ^processor /proc/cpuinfo)  

creates
hello.cpython-311-x86_64-linux-gnu.so  

from build directory - in venv

python -c "import sysconfig, shutil, glob; \
dst = sysconfig.get_paths()['platlib']; \
so = glob.glob('*.so')[0]; \
shutil.copy2(so, dst)"


COPIES so file into venv
now can execute main.py

cd ..
uv run main.py