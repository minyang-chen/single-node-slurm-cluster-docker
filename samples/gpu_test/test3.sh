#!/bin/bash
#SBATCH -o code20.out
#SBATCH --partition=cup-hpc
#SBATCH --nodes=3
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=40
#SBATCH --gres=gpu:4
#SBATCH --mem-per-cpu=100mb

#source /home/slurm/tensorflow_prj/tf_gpu_cluster/bin/activate
#python3 /nfs/code/code20.py
