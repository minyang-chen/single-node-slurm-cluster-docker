#!/bin/bash
#SBATCH --account=admin
#SBATCH --gpus-per-node=1
#SBATCH --mem=400M               # memory per node
#SBATCH --time=0-03:00
nvidia-smi

