#!/bin/bash

#sudo sed -i "s/REPLACE_IT/CPUs=$(nproc)/g" /etc/slurm-llnl/slurm.conf

sudo service munge start
sudo service slurmctld start

sleep 5

# source /etc/profile.d/lmod.sh
# module --version

## Init slurm acct database
#IS_DATABASE_EXIST='0'
#while [ "1" != "$IS_DATABASE_EXIST" ]; do
##    echo "Waiting for database $MARIADB_DATABASE on $MARIADB_HOST..."
#    IS_DATABASE_EXIST="`mysql -h $MARIADB_HOST -u root -p"$MARIADB_ROOT_PASSWORD" -qfsBe "select count(*) as c from information_schema.schemata where schema_name='$MARIADB_DATABASE'" -H | sed -E 's/c|<[^>]+>//gi' 2>&1`"
#    sleep 5
#done

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

sudo service slurmctld restart

tail -f /dev/null
