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
pip install torch_spline_conv-1.2.0-cp37-cp37m-linux_x86_64.whl
pip install torch_scatter-2.0.5-cp37-cp37m-linux_x86_64.whl
pip install torch_sparse-0.6.8-cp37-cp37m-linux_x86_64.whl
pip install torch_cluster-1.5.8-cp37-cp37m-linux_x86_64.whl
pip3 install --no-index -r requirements.txt

# python ./MemGym/MortarMayhem2.py -s $seed  --num_proc 48