#!/bin/bash

# sudo chmod 600 /etc/slurm-llnl/slurmdbd.conf
# sudo chown slurm:slurm /etc/slurm-llnl/slurmdbd.conf

echo "---> Check config files ..."
ls -all /etc/slurm-llnl/

echo "---> Check environment modules ..."
source /etc/profile.d/lmod.sh 
module --version && module avail

echo "---> Starting the MUNGE Authentication service (munged) ..."
sudo service munge start

echo "---> Starting the slurmdbd ..."
slurmdbd -Dvvv
