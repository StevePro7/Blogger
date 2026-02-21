16-Feb-2026

Using Python with C++. Part2.
https://medium.com/@stevechange/using-python-with-c-part2-e1db73185c9e


Copy from previous directory
01-stevechange-01


Launch PyCharm
Open
~/GitHub/StevePro9/PythonSetup/PyBind/new-02/01-stevechange-03/python

uv venv --python 3.11.11
source .venv/bin/activate



Launch CLion
build

mkdir build
cd build
cmake ..
make


Close CLion
Delete .idea
re-launch CLion


First time I separated out
Container.h
Container.cpp

but this creates linker error

~/GitHub/StevePro9/PythonSetup/PyBind/new-02/01-stevechange-03/python/.venv/bin/python ~/GitHub/StevePro9/PythonSetup/PyBind/new-02/01-stevechange-03/python/main.py 
Traceback (most recent call last):
  File "~/GitHub/StevePro9/PythonSetup/PyBind/new-02/01-stevechange-03/python/main.py", line 1, in <module>
    import my_api_py
ImportError: ~/GitHub/StevePro9/PythonSetup/PyBind/new-02/01-stevechange-03/python/.venv/lib/python3.11/site-packages/my_api_py.cpython-311-x86_64-linux-gnu.so: undefined symbol: _ZN9ContainerIdEC1Em

Process finished with exit code 1


Templates must be header only
Templates must usually be header-only.



IMPORTANT
I added gmock to CMakeLists.txt file - just one line added


target_link_libraries(my_api_tests
        PRIVATE
        my_api
        GTest::gtest_main
        GTest::gmock
        Python3::Python
        )
