2.5 How to debug scripts directly on a compute node
If you want to debug directly on one of the compute nodes (e.g. you need a GPU to run the script), you can create an interactive session with a time limit that will launch a bash shell:


$ srun -t 2:00:00 --partition=gpu-queue --nodes=1 --ntasks-per-node=1 --gpus=1 --pty bash -i

