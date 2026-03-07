3Duv
08-Dec-2025

uv venv --python 3.9

Update pyproject.toml
uv sync

imageio
remove 2x torch

#uv pip install "numpy<2"
#numpy                                1.26.4

numpy 1.23



pip install "git+https://github.com/facebookresearch/pytorch3d.git"
Defaulting to user installation because normal site-packages is not writeable Collecting git+https://github.com/facebookresearch/pytorch3d.git Cloning https://github.com/facebookresearch/pytorch3d.git to /tmp/pip-req-build-d1_hjjln Running command git clone --filter=blob:none --quiet https://github.com/facebookresearch/pytorch3d.git /tmp/pip-req-build-d1_hjjln Resolved https://github.com/facebookresearch/pytorch3d.git to commit 33824be3cbc87a7dd1db0f6a9a9de9ac81b2d0ba Preparing metadata (setup.py) ... error error: subprocess-exited-with-error


pip install tensorboard open3d prettytable ptable jsonschema transformers lightning ninja locust pre-commit pydantic


ip install tensorboard open3d prettytable ptable jsonschema transformers lightning ninja locust pre-commit pydantic Attempting uninstall: flask Found existing installation: Flask 2.3.2 Uninstalling Flask-2.3.2: Successfully uninstalled Flask-2.3.2

pip check WARNING: Error parsing dependencies of gym: Expected matching RIGHT_PARENTHESIS for LEFT_PARENTHESIS, after version specifier opencv-python (>=3.) ; extra == 'all'

pip uninstall gym gym-retro -y
pip install amqp alabaster testresources

pip uninstall pydantic-typeddict -y Found existing installation: pydantic-typeddict 0.1.0 Uninstalling pydantic-typeddict-0.1.0: ERROR: Exception: Traceback (most recent call last): File "/usr/lib/python3.8/shutil.py", line 791, in move os.rename(src, real_dst) PermissionError: [Errno 13] Permission denied: '/usr/local/lib/python3.8/dist-packages/__pycache__/pydantic_typeddict.cpython-38.pyc' -> '/tmp/pip-uninstall-42mxb3dn/pydantic_typeddict.cpython-38.pyc'
pip uninstall pydantic-typeddict -y
pip install --upgrade pydantic
pip install amqp alabaster testresources


pip install "git+https://github.com/facebookresearch/pytorch3d.git"

pip install "git+https://github.com/facebookresearch/pytorch3d.git" Building wheel for pytorch3d (setup.py) ... error error: subprocess-exited-with-error × python setup.py bdist_wheel did not run successfully. │ exit code: 1 ╰─> [681 lines of output] running bdist_wheel untimeError: Error compiling objects for extension [end of output]

python -c "import torch; print(torch.__version__, torch.version.cuda)"

sudo apt update
sudo apt install -y build-essential cmake libopenexr-dev libpng-dev libjpeg-dev


# Install PyTorch 2.3 with CUDA 11.8
# 1. Install compatible PyTorch, torchvision, torchaudio
pip install torch==2.3.0+cu118 torchvision==0.14.1+cu118 torchaudio==2.3.0 -f https://download.pytorch.org/whl/torch_stable.html

# 2. Install PyTorch3D pre-built wheel for Python 3.9, CUDA 11.8, PyTorch 2.3
pip install pytorch3d -f https://dl.fbaipublicfiles.com/pytorch3d/packaging/wheels/py39_cu118_pyt230/download.html

ERROR

# Install system dependencies
sudo apt update
sudo apt install -y build-essential cmake libopenexr-dev libpng-dev libjpeg-dev ninja-build

# Set environment variables
export CUDA_HOME=/usr/local/cuda-12.2
export TORCH_CUDA_ARCH_LIST="8.6"   # Ampere GPU (RTX 3080)
export CMAKE_GENERATOR=Ninja

# Install PyTorch3D from source
pip install "git+https://github.com/facebookresearch/pytorch3d.git"


sudo apt update
sudo apt install -y nvidia-cuda-toolkit

CUDA toolkit
which nvcc
/usr/bin/nvcc

export CUDA_HOME=/usr/local/cuda-12.2
export PATH=$CUDA_HOME/bin:$PATH
export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH

# Download CUB
git clone https://github.com/NVIDIA/cub.git ~/cub
export CUB_HOME=~/cub

pip install --no-cache-dir "git+https://github.com/facebookresearch/pytorch3d.git"


export CUDA_HOME=/usr
export PATH=$CUDA_HOME/bin:$PATH
export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH

$CUDA_HOME/bin/nvcc --version

pip install --no-cache-dir "git+https://github.com/facebookresearch/pytorch3d.git"

