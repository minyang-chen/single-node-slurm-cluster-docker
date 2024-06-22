#!/bin/bash

## sudo chmod 600 /etc/slurm-llnl/slurmdbd.conf
## sudo chown slurm:slurm /etc/slurm-llnl/slurmdbd.conf
# sudo chmod 400 /etc/munge/munge.key
# sudo chown munge:munge /etc/munge/munge.key

# user home permission
sudo chown admin:admin -R /home/admin

echo "---> check config files ..."
ls -all /etc/slurm-llnl/

echo "---> Starting the MUNGE Authentication service (munged) ..."
sudo service munge start

echo "---> MUNGE status ..."
munge -n | unmunge | grep STATUS

#environment check spack
source /tools/spack/share/spack/setup-env.sh
spack --version

#environment check easybuild
eb --version
eb --show-system-info
eb --show-config

eb bzip2-1.0.6.eb
## search
# eb --search pytorch*.*CUDA
## install 
# eb PyTorch-2.1.2-foss-2023a-CUDA-12.1.1.eb --robot --accept-eula-for=CUDA
# eb TensorFlow-2.15.1-foss-2023a.eb --robot

source /etc/profile.d/lmod.sh
module --version

echo "---> Starting the slurmdbd ..."
slurmdbd -Dvvv
