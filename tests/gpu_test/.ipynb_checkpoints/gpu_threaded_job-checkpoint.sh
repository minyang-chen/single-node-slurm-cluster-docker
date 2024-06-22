#!/bin/bash
#SBATCH --partition=slurmgpu
#SBATCH --account=admin
#SBATCH --gpus-per-node=1         # Number of GPU(s) per node
#SBATCH --cpus-per-task=2         # CPU cores/threads
##SBATCH --mem=400M               # memory per node
#SBATCH --time=0-03:00
export OMP_NUM_THREADS=2
nvidia-smi