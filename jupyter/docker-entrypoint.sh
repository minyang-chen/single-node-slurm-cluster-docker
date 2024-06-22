#!/bin/bash

# sudo chmod 400 /etc/munge/munge.key
# sudo chown munge:munge /etc/munge/munge.key

# authentication
sudo service munge restart

echo "---> MUNGE status ..."
munge -n | unmunge | grep STATUS

# user home permission
sudo mkdir -p /home/admin/.local
sudo chown admin:admin -R /home/admin
sudo cd /home/admin

# shell
# curl -sS https://starship.rs/install.sh | sh
# eval "$(starship init bash)"

# password: password
jupyter lab --no-browser --allow-root --ip=0.0.0.0 --NotebookApp.token='' --NotebookApp.password='sha1:092f023fbdf6:fe70e174d560ea28767d76d8ad65dd5248598de9' 

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


tail -f /dev/null
