#!/bin/bash
#SBATCH --partition=slurmgpu
#SBATCH --gres=gpu:nvidia:1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=1GB
#SBATCH --time=3:00
#SBATCH --account=admin
hostname
nvidia-smi