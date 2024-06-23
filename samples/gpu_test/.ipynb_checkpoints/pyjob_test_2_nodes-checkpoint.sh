#!/bin/bash

#SBATCH --partition=slurmcpu
#SBATCH --job-name=pyjob-test
#SBATCH --output=pyjob-test.out
#SBATCH --ntasks-per-node=1
#
#SBATCH --ntasks=2
#
sbcast -f pyjob_test.py /tmp/pyjob_test.py
srun python3 /tmp/pyjob_test.py

