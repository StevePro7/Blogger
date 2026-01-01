Reference
https://github.com/StevePro7/Blogger/blob/master/Python/_Setup04_packages/articles/04-uv-TODO.txt

Install uv
uv --version

uv init my-app
cd my-app

Launch PyCharm
Navigate to my-app


my-app/
├── .venv/
├── .python-version
├── pyproject.toml
├── main.py
└── README.md

No virtual directory
uv venv

Now there is .venv virtual directory
source .venv/bin/activate


uv add pandas numpy

Update pyproject.toml
dependencies = [
    "numpy>=2.2.6",
    "pandas>=2.3.1",
]

INTERESTING
both of these work from within the Virtual Environment

(my-app) stevepro@SteveProIMac:~/SVN/qv/my-app$ python main.py
Hello from my-app!!
(my-app) stevepro@SteveProIMac:~/SVN/qv/my-app$ uv run main.py 
Hello from my-app!!


Other commands
uv python list --only-installed
uv sync

Build egg-info
uv pip install -e .

SUMMARY - none of these worked:
uv venv exec python main.py
uv pip compile --generate-hashes -o requirements.txt