#!/bin/bash
#SBATCH --partition=slurmgpu
#SBATCH --gpus=1 ## okay number of gpus per job
#SBATCH --ntasks-per-node=1
#SBATCH --mem=1GB
#SBATCH --time=3:00
#SBATCH --account=admin
hostname
nvidia-smi