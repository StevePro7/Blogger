3D UV new
19-Jan-2026

cd /home/stevepro/GitHub/StevePro9/FelixTesting/Solv
mkdir 3Duvnew
cd 3Duvnew

uv init --python 3.10.19
uv venv --python 3.10.19
source .venv/bin/activate

which python
`which python` --version

uv pip list



IMPORTANT
I removed previous CUDA 11.8 and replace / upgraded with CUDA 12.1

information

export CUB_HOME=~/cub
export CUDA_HOME=/usr/local/cuda-11.8
export PATH=$CUDA_HOME/bin:$PATH
export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH


which nvcc
nvcc --version
python - << 'EOF'
import torch
print(torch.version.cuda)
EOF


I had CUDA 11.8


01.
Clean up partial CUDA installs (safe)
sudo apt remove -y cuda* nvidia-cuda-toolkit
sudo apt autoremove -y


(This does not remove your NVIDIA driver.)


02.
Add NVIDIA CUDA repo for Ubuntu 20.04
sudo mkdir -p /etc/apt/keyrings

curl -fsSL https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/3bf863cc.pub \
  | sudo gpg --dearmor -o /etc/apt/keyrings/cuda-archive-keyring.gpg

echo "deb [signed-by=/etc/apt/keyrings/cuda-archive-keyring.gpg] \
https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /" \
| sudo tee /etc/apt/sources.list.d/cuda.list

sudo apt update


03.
Install CUDA 12.1 toolkit only

export CUDA_HOME=/usr/local/cuda-12.1
export PATH=$CUDA_HOME/bin:$PATH
export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH


nvcc --version
# release 12.1

Suppress!
warning: The `extra-build-dependencies` option is experimental and may change without warning. Pass `--preview-features extra-build-dependencies` to disable this warning.

export UV_PREVIEW_FEATURES=extra-build-dependencies


# noinspection PyUnresolvedReferences
from pytorch3d import _C
print(_C)

In PyCharm to ignore "error" on the Problems tab

