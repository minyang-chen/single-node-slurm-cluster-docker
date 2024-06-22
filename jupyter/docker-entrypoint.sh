#!/bin/bash

sudo chmod 400 /etc/munge/munge.key
sudo chown munge:munge /etc/munge/munge.key

# authentication
sudo service munge restart

# user home permission
sudo mkdir -p /home/admin/.local
sudo chown admin:admin -R /home/admin
sudo cd /home/admin

# shell
curl -sS https://starship.rs/install.sh | sh
eval "$(starship init bash)"

# password: password
jupyter lab --no-browser --allow-root --ip=0.0.0.0 --NotebookApp.token='' --NotebookApp.password='sha1:092f023fbdf6:fe70e174d560ea28767d76d8ad65dd5248598de9' 

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
