#environment check easybuild
eb --version
eb --show-system-info
eb --show-config

eb bzip2-1.0.6.eb

source /etc/profile.d/lmod.sh
#source /opt/focal/lmod/lmod/init/bash
module --version
module use ~/.local/easybuild/modules/
module avail
