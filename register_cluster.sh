#!/bin/bash
set -e

docker exec slurm-cluster-jupyter-v3-slurmdbd-1 bash -c "/usr/bin/sacctmgr --immediate add cluster name=clusterlab" && \
docker compose restart slurmdbd slurmmaster
