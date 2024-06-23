#!/bin/bash

#SBATCH --account=admin
#SBATCH --partition=slurmpar
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=2G
#SBATCH --time=1:00:00

date
hostname
/opt/spack/bin/spack --version
nvidia-smi

