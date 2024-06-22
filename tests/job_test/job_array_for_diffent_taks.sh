What if you want to launch non-identical jobs from just one job script?

You can do this using job steps. By default, all jobs consist of at least one job step. If you include multiple srun calls within an sbatch script, be it either sequentially or in parallel, Slurm will treat these as individual job steps with their own requirements.

# !/bin/bash
#SBATCH --job-name=example_jobstep
#SBATCH --nodes=2
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=01:00:00

# Launch Job Steps

# Each job step uses one node and one task
srun --nodes 1 --ntasks 1 python download_data.py
srun --nodes 2 --ntasks 1 python preprocess_data.py

Note:
In the above example, each step is dependent on the previous step completing successfully. If any step fails, subsequent steps will not be executed.

Note:
To make the job steps run concurrently, simply add & after each srun command and a wait at the end:

# Each job step uses one node and one task
$ srun --nodes 2 --ntasks 2 python preprocess_data.py --input data_chunk_1 &
$ srun --nodes 2 --ntasks 2 python preprocess_data.py --input data_chunk_2 &
$ wait




