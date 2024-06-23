#!/bin/bash
#SBATCH --nodes=1
## SBATCH --gpus-per-node=p100:2
#SBATCH --ntasks-per-node=2
## SBATCH --mem=500M
#SBATCH --time=3:00
#SBATCH --account=def-someuser
nvidia-smi

