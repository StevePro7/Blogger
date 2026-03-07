3Duv
08-Dec-2025

uv venv --python 3.8

Update pyproject.toml
uv sync
numpy                                1.23.5

uv pip install --upgrade pip setuptools wheel

pip install torch==2.0.1+cu118 torchvision==0.15.2+cu118 torchaudio==2.0.2 --index-url https://download.pytorch.org/whl/cu118
uv pip uninstall lightning pytorch-lightning

#pip install torch==2.0.1+cu118 torchvision==0.15.2+cu118 torchaudio==2.0.2+cu118 --index-url https://download.pytorch.org/whl/cu118

pip uninstall torch torchvision torchaudio torchmetrics pytorch-lightning
uv pip list | grep torch
uv pip cache purge

uv pip install --no-cache-dir torch==2.0.1+cu118 torchvision==0.15.2+cu118 torchaudio==2.0.2+cu118 --index-url https://download.pytorch.org/whl/cu118
python -c "import torch; print(torch.__version__, torch.version.cuda)"
2.3.0+cu118 11.8

export CUB_HOME=~/cub
python -c "import torch; import pytorch3d; print(torch.__version__, pytorch3d.__version__)"
2.3.0+cu118 0.7.x

export CUB_HOME=~/cub
export CUDA_HOME=/usr          # points to CUDA root
export PATH=$CUDA_HOME/bin:$PATH
export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH

uv pip install --no-cache-dir torch==2.0.1+cu118 torchvision==0.15.2+cu118 torchaudio==2.0.2+cu118 --index-url https://download.pytorch.org/whl/cu11818
uv pip install --no-build-isolation "git+https://github.com/facebookresearch/pytorch3d.git"
ERROR

sudo apt remove nvidia-cuda-toolkit

wget https://developer.download.nvidia.com/compute/cuda/11.8.0/local_installers/cuda-repo-ubuntu2004-11-8-local_11.8.0-520.61.05-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu2004-11-8-local_11.8.0-520.61.05-1_amd64.deb
sudo cp cuda-repo-ubuntu2004-11-8-local_11.8.0-520.61.05-1_amd64.deb /usr/share/keyrings/
sudo apt-key add /var/cuda-repo-ubuntu2004-11-8-local/7fa2af80.pub

sudo apt update
sudo apt install cuda-11-8

export CUDA_HOME=/usr/local/cuda-11.8
export PATH=$CUDA_HOME/bin:$PATH
export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH

nvcc --version
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2022 NVIDIA Corporation
Built on Wed_Sep_21_10:33:58_PDT_2022
Cuda compilation tools, release 11.8, V11.8.89
Build cuda_11.8.r11.8/compiler.31833905_0

uv pip install --no-build-isolation "git+https://github.com/facebookresearch/pytorch3d.git"
uv pip install --no-build-isolation "git+https://github.com/facebookresearch/pytorch3d.git"
ERROR

git clone https://github.com/facebookresearch/pytorch3d.git
cd pytorch3d
uv pip install -v --no-build-isolation .


uv pip install --upgrade packaging
uv pip show setuptools packaging

torch messed up again
2.4.1+cu121

WORKS
uv pip uninstall torch torchvision torchaudio
# Also remove any leftover global/user installs just to be safe:
pip uninstall -y torch torchvision torchaudio

uv pip list | grep torch

nvcc --version
11.8

export CUDA_HOME=/usr/local/cuda-11.8
export PATH=$CUDA_HOME/bin:$PATH
export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH

uv pip install --no-cache-dir torch==2.0.1+cu118 torchvision==0.15.2+cu118 torchaudio==2.0.2+cu118 --index-url https://download.pytorch.org/whl/cu118
uv pip install -v --no-build-isolation "git+https://github.com/facebookresearch/pytorch3d.git"

YAH!
uv pip list | grep torch
pytorch3d                            0.7.9
torch                                2.0.1+cu118
torchaudio                           2.0.2+cu118
torchmetrics                         1.5.2
torchvision                          0.15.2+cu118


TorchSparse
git clone https://github.com/mit-han-lab/torchsparse.git
cd torchsparse
uv pip install -v --no-build-isolation .


sudo apt update
sudo apt install -y build-essential ninja-build cmake libopenblas-dev

uv pip install --upgrade pip setuptools wheel
rm -rf build dist *.egg-info

export CC=/usr/bin/gcc-9
export CXX=/usr/bin/g++-9
uv pip install -v --no-build-isolation .


uv pip install --upgrade pip setuptools wheel


uv pip install --upgrade pip setuptools wheel
uv pip install setuptools_scm
ERROR


try this
python -m pip install git+https://github.com/mit-han-lab/torchsparse.git
uv pip install git+https://github.com/mit-han-lab/torchsparse.git


uv pip install --upgrade pip setuptools wheel setuptools_scm
uv pip show setuptools pip wheel

export CUDA_HOME=/usr/local/cuda-11.8
export PATH=$CUDA_HOME/bin:$PATH
export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH
export CC=/usr/bin/gcc-9
export CXX=/usr/bin/g++-9
export SETUPTOOLS_USE_DISTUTILS=stdlib


git clone https://github.com/mit-han-lab/torchsparse.git
cd torchsparse
rm -rf build dist *.egg-info
uv pip install -v --no-build-isolation .

ERROR

TorchSparse
sudo apt-get update
sudo apt-get install -y libsparsehash-dev


uv pip install --upgrade ninja

rm -rf ~/.cache/torch_extensions
rm -f /home/stevepro/GitHub/StevePro9/FelixTesting/Solv/3Duv/.venv/.lock
rm -f /home/stevepro/.cache/uv/.lock
rm -rf build dist *.egg-info


pip install --upgrade pip setuptools wheel ninja cmake

uv pip install -v --no-build-isolation .