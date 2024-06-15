#!/bin/bash

#sudo sed -i "s/REPLACE_IT/CPUs=$(nproc)/g" /etc/slurm-llnl/slurm.conf

sudo service munge start
sudo slurmd -N $(hostname)

#environment check spack
source /opt/spack/share/spack/setup-env.sh
spack --version

#environment check easybuild
eb --version
eb --show-system-info
eb --show-config

#environment check lmod
source /etc/profile.d/lmod.sh
#source /opt/focal/lmod/lmod/init/bash
module --version
module use ~/.local/easybuild/modules/
module avail

tail -f /dev/null
