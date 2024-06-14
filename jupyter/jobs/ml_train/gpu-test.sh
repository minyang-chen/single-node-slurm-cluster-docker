#!/bin/sh
##SBATCH --partition=gpu
##SBATCH --gres=gpu:titanv:1

#SBATCH --partition=slurmpar
#SBATCH --gres=gpu:nvidia:1

echo $CUDA_VISIBLE_DEVICES
hostname
nvidia-smi
cd /home/admin/gpu_test
sbcast -f nvidia-test.py /tmp/nvidia-test.py

#source /opt/spack/share/spack/setup-env.sh
sudo su
bash /opt/spack/share/spack/setup-env.sh
/opt/spack/bin/spack --version

eval `/opt/spack/bin/spack load --sh   miniconda3`

#/opt/spack/bin/spack install miniconda3
#/opt/spack/bin/spack load miniconda3

conda init
. ~/.bashrc
conda deactivate

conda create -n tf-gpu tensorflow-gpu -y
conda activate tf-gpu

#source /etc/profile.d/lmod.sh

#export LD_LIBRARY_PATH=/jhpce/shared/jhpce/core/JHPCE_tools/3.0/lib:/usr/local/lib/python3.9/site-packages/nvidia/#cudnn/lib:/jhpce/shared/jhpce/core/conda/miniconda3-23.3.1/envs/cudatoolkit-11.8.0/lib

python /tmp/nvidia-test.py
