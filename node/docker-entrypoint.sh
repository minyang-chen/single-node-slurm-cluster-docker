#!/bin/bash

# sudo chmod 400 /etc/munge/munge.key
# sudo chown munge:munge /etc/munge/munge.key

# user home permission update
sudo chown admin:admin -R /home/admin

# start services
sudo service munge start

echo "---> MUNGE status ..."
munge -n | unmunge | grep STATUS

sudo slurmd -N $(hostname)

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

#environment check lmod
source /etc/profile.d/lmod.sh
#source /opt/focal/lmod/lmod/init/bash
module --version
module use ~/.local/easybuild/modules/
module avail

# show node info
slurmd -V
slurmd -C
slurmd -G

# show cluster info
sinfo

tail -f /dev/null
