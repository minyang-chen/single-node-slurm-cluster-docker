# General
#SBATCH --nodes=2                 # Number of compute nodes to use for the job
#SBATCH --ntasks=4                # Number of tasks (processes) to run
#SBATCH --gres=gpu:1              # What general resources to use per node
#SBATCH --mem=32G                 # How much memory to use
#SBATCH --mem-per-cpu=4G          # How much memory to use per cpu
#SBATCH --time=2:00:00            # Time limit for the job
#SBATCH --partition=general       # Which partition the job should use

# CPU specific
#SBATCH --cpus-per-task=2         # Number of CPU cores to use for each task

# GPU specific 
#SBATCH --gpus=1                  # How many gpus to use for an entire job
#SBATCH --gpus-per-node=1         # How many gpus to use per node
#SBATCH --gpus-per-task=1         # How many gpus to use per task
#SBATCH --gpus-per-socket=1       # How many gpus to use per socket
#SBATCH --constraint=gpu_type     # What type of gpu to use
#SBATCH --constraint=gmem24G      # only use 24G of GPU memory

Note:
Generally it is recommended to use --gpus-per-node in most cases 
combined with --ntasks-per-gpu as all tasks in your job will be guaranteed 
to have access to a GPU.
