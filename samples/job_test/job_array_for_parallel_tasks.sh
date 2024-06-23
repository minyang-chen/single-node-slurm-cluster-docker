## job arrays for parallel tasks -- identical tasks

#!/bin/bash

#SBATCH --job-name=array_job
#SBATCH --partition=gpu-queue
#SBATCH --time=10:00:00
#SBATCH --array=0-9  # launches 10 jobs indices from 0 to 9
#SBATCH --output=output_%J_%i.log  # %J is array job ID, %i is array index

# Run a parallel task over 10 data chunks
srun python run_parallel_task.py data_chunk_$SLURM_ARRAY_TASK_ID.txt

