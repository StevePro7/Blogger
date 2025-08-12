uv test
07-Aug-2025

uv init

uv venv
source .venv/bin/activate

import rich
uv pip install rich

uv pip list
uv pip show rich

PYCHARM
can Run | Debug via PyCharm IDE

Terminal
python main.py
ModuleNotFoundError: No module named 'rich'

SOLUTION
uv run main.py

uv pip install rich
did NOT update pyproject.toml file

uv sync
creates uv.lock file

