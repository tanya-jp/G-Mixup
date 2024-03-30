#!/bin/bash 
#SBATCH --account=def-skelly
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem=512M
#SBATCH --time=00-00:15  # time (DD-HH:MM)
#SBATCH --error=error_file.txt

seed=$1
module load python/3.11

virtualenv --no-download $SLURM_TMPDIR/env
source $SLURM_TMPDIR/env/bin/activate
# conda create -n memory-gym python=3.11 --yes
# conda activate memory-gym
pip3 install --no-index --upgrade pip
!pip install -q torch-scatter -f https://data.pyg.org/whl/torch-1.7.0+cu113.html
!pip install -q torch-sparse -f https://data.pyg.org/whl/torch-1.7.0+cu113.html
!pip install -q torch-spline -f https://data.pyg.org/whl/torch-1.7.0+cu113.html
!pip install -q torch-cluster -f https://data.pyg.org/whl/torch-1.7.0+cu113.html
pip3 install --no-index -r requirements.txt

# python ./MemGym/MortarMayhem2.py -s $seed  --num_proc 48