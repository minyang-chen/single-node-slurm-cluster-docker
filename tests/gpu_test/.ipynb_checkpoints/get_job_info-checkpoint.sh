sacct -o ALL -j <jobid>

#sstat -j 11600 -o maxrss,maxvmsize,maxdiskwrite


scontrol show --details job <

scontrol show node <nodename>

scontrol show partition <partitionname>
