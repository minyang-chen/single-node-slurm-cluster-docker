#!/bin/bash
set -e

docker compose exec slurmmaster bash -c "/usr/bin/sacctmgr --immediate add cluster name=clusterlab" && \
docker compose restart slurmdbd slurmmaster

## Create initial slurm cluster, account, and user.
#
#$ sacctmgr add cluster compute-cluster
#$ sacctmgr add account compute-account description="Compute accounts" Organization=OurOrg
#$ sacctmgr create user myuser account=compute-account adminlevel=None
#$ sinfo
