PyBind Debugging example
05-Jan-2025

FF stable-retro
~/GitHubX/Farama-Foundation/stable-retro

Copy .vscode folder at top level

PyCharm
stevenb.py
~/stable-retro/retro/examples

set breakpoint
F5  debug
break


VS Code
retro.cpp
~/GitHubX/Farama-Foundation/stable-retro/src

set breakpoint
e.g.
	void step() {
		m_re.run();
	}
	
	
Follow usual instructions
Terminal
ps aux | grep stevenb

VS Code
(gdb) Attach
67115
y
Enter password

PyCharm F5
VS Code break


Reference
~/GitHub/StevePro9/PythonSetup/PyBind/Medium/Pybind11Example

source
https://nadiah.org/2020/03/01/example-debug-mixed-python-c-in-visual-studio-code
