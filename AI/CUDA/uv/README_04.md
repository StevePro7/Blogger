Imports
18-Jan-2026

pytorch3d
WORKS
import pytorch3d
from pytorch3d.structures import Meshes
from pytorch3d.structures import Pointclouds
from pytorch3d.transforms import acos_linear_extrapolation
from pytorch3d.transforms import se3_exp_map
from pytorch3d.transforms.so3 import so3_relative_angle

ERROR
#from pytorch3d.io import load_ply
#from pytorch3d.loss import chamfer_distance
#from pytorch3d.ops import ball_query
#from pytorch3d.ops import sample_points_from_meshes
#from pytorch3d.ops import sample_points_from_meshes as pspfm
#from pytorch3d.renderer import FoVPerspectiveCameras, look_at_view_transform
#from pytorch3d.renderer import TexturesVertex

ImportError: /home/stevepro/GitHub/StevePro9/FelixTesting/Solv/3Duv/.venv/lib/python3.8/site-packages/pytorch3d/_C.cpython-38-x86_64-linux-gnu.so:
undefined symbol: _ZN3c104impl8GPUTrace13gpuTraceStateE


scipy
WORKS
from scipy import interpolate
from scipy.interpolate import splrep, splev
from scipy.optimize import least_squares
from scipy.optimize import minimize
from scipy.spatial import cKDTree
from scipy.spatial.distance import mahalanobis
from scipy.spatial.transform import Rotation
from scipy.stats import chi2
from scipy.stats import special_ortho_group


sklearn
WORKS
from sklearn.cluster import DBSCAN
from sklearn.preprocessing import QuantileTransformer


torch
WORKS
from torch import nn
from torch import optim
from torch import Tensor
from torch.nn import ConstantPad2d
from torch.nn import Module
from torch.optim import SGD
from torch.utils.data import DataLoader
from torch.utils.data import Dataset
import torch.distributions
import torch.multiprocessing
import torch.nn as nn
import torch.nn.functional as F
import torch.optim as optim

ERROR
from torch._C import Module
ImportError: cannot import name 'Module' from 'torch._C'
(/home/stevepro/GitHub/StevePro9/FelixTesting/Solv/3Duv/.venv/lib/python3.8/site-packages/torch/_C.cpython-38-x86_64-linux-gnu.so)


torch_geometric
from torch_geometric.data import Data
import torch_geometric.nn as TG


MODULE NOT FOUND
import torch_scatter
ModuleNotFoundError: No module named 'torch_scatter'


import torch_sparse
ModuleNotFoundError: No module named 'torch_sparse'


import torchsparse
ModuleNotFoundError: No module named 'torchsparse'