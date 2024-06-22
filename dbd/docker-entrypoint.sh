#!/bin/bash

## sudo chmod 600 /etc/slurm-llnl/slurmdbd.conf
## sudo chown slurm:slurm /etc/slurm-llnl/slurmdbd.conf
sudo chmod 400 /etc/munge/munge.key
sudo chown munge:munge /etc/munge/munge.key

# user home permission
sudo chown admin:admin -R /home/admin

echo "---> check config files ..."
ls -all /etc/slurm-llnl/

echo "---> Starting the MUNGE Authentication service (munged) ..."
sudo service munge start

echo "---> MUNGE status ..."
munge -n | unmunge | grep STATUS

source /etc/profile.d/lmod.sh
module --version

echo "---> Starting the slurmdbd ..."
slurmdbd -Dvvv
