#!/bin/bash

# authentication
sudo service munge restart

# password: password
jupyter lab --no-browser --allow-root --ip=0.0.0.0 --NotebookApp.token='' --NotebookApp.password='sha1:092f023fbdf6:fe70e174d560ea28767d76d8ad65dd5248598de9' &

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
