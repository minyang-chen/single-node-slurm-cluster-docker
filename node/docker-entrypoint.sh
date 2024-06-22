#!/bin/bash

sudo chmod 400 /etc/munge/munge.key
sudo chown munge:munge /etc/munge/munge.key

# user home permission update
sudo chown admin:admin -R /home/admin

# start services
sudo service munge start

echo "---> MUNGE status ..."
munge -n | unmunge | grep STATUS

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
