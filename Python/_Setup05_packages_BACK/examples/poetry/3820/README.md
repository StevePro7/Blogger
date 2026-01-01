Pre-reqs
02-Aug-2025

pyenv install --list
pyenv install 3.8.20
pyenv versions

pyenv global 3.8.20
python --version


Launch PyCharm
New project

Name              PoetryTest_3.8.20
Location          ~/
Interpreter type  Custom environment
Environment       Generate new
Type              Poetry
Base python       ~/.pyenv/versions/3.8.20/bin/python3
Path to Poetry    ~/.local/bin/poetry


Terminal
pyenv versions
  system
* 3.8.20 (set by /Users/stevepro/.pyenv/version)
  3.10.4
  3.12.3

pyenv which python
/Users/stevepro/.pyenv/versions/3.8.20/bin/python


poetry lock
poetry install --no-root
