#!/bin/bash run with sbatch file_name.sh

#SBATCH --job-name=my_cpu_job              # Name of the job
#SBATCH --partition=cpu_queue              # Name of the CPU queue/partition
#SBATCH --nodes=42                         # Request 42 nodes
#SBATCH --ntasks-per-node=1                # Run a single task on each node
#SBATCH --cpus-per-task=8                  # Use 8 CPUs for each task
#SBATCH --time=01:00:00                    # Maximum time for the job to run, format is HH:MM:SS
#SBATCH --output=job_output_%j.log         # Where to save the job's console output (%j is replaced by job's ID)
#SBATCH --error=job_error_%j.log           # Where to save the job's error messages

# Load any required modules (environments, libraries etc.)
eval "$(conda 'shell.bash' 'hook' 2> /dev/null)" # initialize conda
conda activate my_env

# debugging flags (optional)
export NCCL_DEBUG=INFO
export PYTHONFAULTHANDLER=1
export PYTHONUNBUFFERED=1

# Your script or command to execute
srun python cpu_job.py


