#!/bin/bash
#SBATCH --job-name=original_training   # Job name
#SBATCH --nodes=1                    # Number of nodes
#SBATCH --cpus-per-gpu=12
#SBATCH --nodelist=gcpl4-eu-1
#SBATCH --gres=gpu:l4-24g:1    
#SBATCH --time=48:00:00        
#SBATCH --mem-per-gpu=32
#SBATCH --output=/scratch/sombit_dey/job_%j.out
#SBATCH --error=/scratch/sombit_dey/job_%j.err

# bash /home/sombit_dey/.bashrc

export CUDA_HOME=/opt/modules/nvidia-cuda-11.8.0/
export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH
export PATH=$CUDA_HOME/bin:$PATH

micromamba activate 3dvista

cd /scratch/sombit_dey/3D-VisTA
micromamba run -n 3dvista python run.py --config project/vista/nr3d_config.yml           
# python run.py --config project/vista/nr3d_config.yml 