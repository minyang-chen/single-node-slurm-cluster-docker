
#!/bin/bash

#SBATCH --account=admin
#SBATCH --partition=slurmpar
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=2G
##SBATCH --time=1:00:00
#SBATCH -o slurm.%N.%j.out # STDOUT
#SBATCH -e slurm.%N.%j.err # STDERR

date
hostname
echo “hello $hostname”

