# single-node-slurm-cluster-docker (ubuntu 20.04)
Fully Dockerized Slurm cluster with CPU/GPU partition deployed in a local PC or Server using docker compose.

It consist of the following services:
- MariaDB node (for storage of accounting data)
- phpmyadmin node ( for web sql client)
- Jupyterlab node (notebook, slurm client)
- Storage node (munge, slurmdbd)
- Master node (munge, slurmctld-controller)
- compute GPU nodes x1 (munge, slurmd, nvidia-gpu)
- compute CPU nodes x2 (munge, slurmd)

Optional:
- NFS Server node (for shared storage )

The slurm version is `v19.05.5`
<br />

## Related Projects

### multi-node slurm cluster docker
https://github.com/minyang-chen/multi-nodes-slurm-cluster-docker/tree/main

### slurm job samples
https://github.com/minyang-chen/slurm-job-samples


# How to deploy

Clone the repository

```
hostpc$ git clone https://github.com/minyang-chen/single-node-slurm-cluster-docker.git
hostpc$ cd single-node-slurm-cluster-docker
```

Next, build the node image.
```
hostpc$ ./build_images.sh
```

Start the cluster

```
hostpc$ ./1_create_slurm_cluster.sh
```

To access the storage node:

```
hostpc$ docker compose exec -it slurmdbd bash
```

register the cluster:
```
slumdbd$ /usr/bin/sacctmgr add cluster name=clusterlab 

expected confirmation message (Y/N) enter Y
next check cluster registration status with accounting manager command

slumdbd$ sacctmgr 

```

next, restart master and storage node:
```
hostpc$ docker compose restart slurmdbd slurmmaster
```

NOTE: the first running of Slurm might take up to 1-3 minute because a new MariaDB database initiation procedure and slurm master restart to pick up all nodes joining the cluster.
