#!/bin/bash
#SBATCH --partition=slurmgpu
#SBATCH --gpus-per-node=1 
#SBATCH --ntasks-per-node=4
#SBATCH --mem=1GB
#SBATCH --time=3:00
#SBATCH --account=admin
export OMP_NUM_THREADS=1
srun --cpus-per-task=1 nvidia-smi
srun  hostname