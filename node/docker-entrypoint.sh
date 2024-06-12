#!/bin/bash

#sudo sed -i "s/REPLACE_IT/CPUs=$(nproc)/g" /etc/slurm-llnl/slurm.conf

sudo service munge start
sudo slurmd -N $(hostname)

source /etc/profile.d/lmod.sh
module

tail -f /dev/null
