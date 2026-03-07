3Duv
07-Dec-2025

cd ~/GitHub/StevePro9/FelixTesting/Solv/
mkdir 3Duv
cd 3Duv
uv init --python 3.10.12
uv venv --python 3.10.12
source .venv/bin/activate

Update pyproject.toml
uv sync
uv pip install "numpy<2"

pip install --upgrade setuptools packaging

PyTorch3D
git clone https://github.com/facebookresearch/pytorch3d.git
cd pytorch3d
uv pip install -v --no-build-isolation .

TorchSparse
sudo apt-get update
sudo apt-get install -y libsparsehash-dev

git clone https://github.com/mit-han-lab/torchsparse.git
cd torchsparse
uv pip install -v --no-build-isolation .