#!/bin/bash

# sudo chmod 600 /etc/slurm-llnl/slurmdbd.conf
# sudo chown slurm:slurm /etc/slurm-llnl/slurmdbd.conf

echo "---> check config files ..."
ls -all /etc/slurm-llnl/

echo "---> Starting the MUNGE Authentication service (munged) ..."
sudo service munge start

source /etc/profile.d/lmod.sh
module --version

echo "---> Starting the slurmdbd ..."
slurmdbd -Dvvv
