#!/bin/bash

#sudo sed -i "s/REPLACE_IT/CPUs=$(nproc)/g" /etc/slurm-llnl/slurm.conf

echo "---> Authentication ..."
sudo service munge start

echo "---> Compute Node ..."
sudo slurmd -N $(hostname)

echo "---> Check environment modules ..."
source /etc/profile.d/lmod.sh 
module --version && module avail

tail -f /dev/null
