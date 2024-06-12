#!/bin/bash

#sudo sed -i "s/REPLACE_IT/CPUs=$(nproc)/g" /etc/slurm-llnl/slurm.conf

sudo service munge start
sudo service slurmctld start

sleep 5

source /etc/profile.d/lmod.sh
module

## Init slurm acct database
#IS_DATABASE_EXIST='0'
#while [ "1" != "$IS_DATABASE_EXIST" ]; do
##    echo "Waiting for database $MARIADB_DATABASE on $MARIADB_HOST..."
#    IS_DATABASE_EXIST="`mysql -h $MARIADB_HOST -u root -p"$MARIADB_ROOT_PASSWORD" -qfsBe "select count(*) as c from information_schema.schemata where schema_name='$MARIADB_DATABASE'" -H | sed -E 's/c|<[^>]+>//gi' 2>&1`"
#    sleep 5
#done

sudo service slurmctld restart

tail -f /dev/null
