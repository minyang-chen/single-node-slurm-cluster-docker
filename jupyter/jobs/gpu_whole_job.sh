#!/bin/bash
#SBATCH --nodes=1
## SBATCH --gpus-per-node=p100:4
#SBATCH --ntasks-per-node=2
#SBATCH --exclusive
#SBATCH --mem=1G
#SBATCH --time=3:00
#SBATCH --account=admin
hostname
nvidia-smi

