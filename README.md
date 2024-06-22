# single-node-slurm-cluster-docker (ubuntu 20.04)
dockerized single-node slurm cluster with CPU/GPU partition

## Scheduling resources at the per GPU level

Slurm can be made aware of GPUs as a consumable resource to allow jobs to request any number of GPUs.

This feature requires job accounting to be enabled first; for more info, see: https://slurm.schedmd.com/accounting.html

The Slurm configuration file needs parameters set to enable cgroups for resource management and GPU resource scheduling:

slurm.conf:

## Enable cgroup
```
cat /etc/default/grub

*** update line with cgroup value below ***
GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1"
$ update-grub
```

## General
```
ProctrackType=proctrack/cgroup
TaskPlugin=task/cgroup
```

## Scheduling
```
SelectType=select/cons_res
SelectTypeParameters=CR_Core_Memory
```

## Logging and Accounting
```
AccountingStorageTRES=gres/gpu
DebugFlags=CPU_Bind,gres                # show detailed information in Slurm logs about GPU binding and affinity
JobAcctGatherType=jobacct_gather/cgroup
```

## multi-node slurm cluster docker
https://github.com/minyang-chen/multi-nodes-slurm-cluster-docker/tree/main


## map host cgroup to container
```
volumes:
        - /sys/fs/cgroup:/sys/fs/cgroup:ro       
```
