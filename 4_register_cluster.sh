#!/bin/bash
set -e

docker compose exec slurmmaster bash -c "/usr/bin/sacctmgr --immediate add cluster name=clusterlab" && \
docker compose restart slurmdbd slurmmaster
