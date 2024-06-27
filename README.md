# single-node-slurm-cluster-docker (ubuntu 20.04)
Fully Dockerized Slurm cluster with CPU/GPU partition and Jupyterlab HPC extensions for local PC or Server deployment using docker compose.

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

## Pre-requisites 
1. Supported OS (tested on ubuntu 20+, should works on other platform with docker support)

2. Host PC/VM with docker installed
```
curl -fsSL https://get.docker.com -o get-docker.sh 
sh get-docker.sh
```
3. Nvidia-Container-Toolkit
```
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

sudo apt update

sudo apt-get install -y nvidia-container-toolkit

sudo nvidia-ctk runtime configure --runtime=docker

cat /etc/docker/daemon.json

sudo systemctl restart docker
```

## Related Projects

#### multi-node slurm cluster docker
https://github.com/minyang-chen/multi-nodes-slurm-cluster-docker/tree/main

#### slurm job samples
https://github.com/minyang-chen/slurm-job-samples
<br />

## How to deploy

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

## Manage the Cluster

To start the cluster in daemon mode:

     $ docker-compose up -d


To restart the cluster:

     $ docker-compose restart

To stop it:

     $ docker-compose stop

To check logs:

     $ docker-compose logs

     (stop logs with CTRL-c")

To check running containers:

     $ docker-compose ps


To Add more nodes on the cluster, update docker compose section:
```
  slurmnodeX:
    image: slurm-node:latest
    hostname: slurmnodeX
    user: admin
    volumes:
      - ./workspace:/home/admin
      - ./etc/slurm-llnl/cgroup.conf:/etc/slurm-llnl/cgroup.conf            
      - ./etc/slurm-llnl/gres.conf:/etc/slurm-llnl/gres.conf            
      - ./etc/slurm-llnl/slurm.conf:/etc/slurm-llnl/slurm.conf            
      - ./etc/slurm-llnl/slurmdbd.conf:/etc/slurm-llnl/slurmdbd.conf                 
      - ./node/docker-entrypoint.sh:/etc/slurm-llnl/docker-entrypoint.sh                                
      - /sys/fs/cgroup:/sys/fs/cgroup:ro                        
    links:
      - slurmmaster      
```

NOTE: the first running of Slurm might take up to 1-3 minute because a new MariaDB database initiation procedure and slurm master restart to pick up all nodes joining the cluster.
