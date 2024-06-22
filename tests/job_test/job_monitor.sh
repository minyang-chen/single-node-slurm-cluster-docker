Slurm commands such as sinfo, squeue etc. communicate with the slurmctld and slurmd daemons to retrieve or modify information about nodes, jobs, and partitions.

$squeue

Beyond using squeue to check the status of a job, here are a few other non-basic ways to get more information about your jobs.

Check the output/error logs in the files you specified in your sbatch script:

#SBATCH --output=my_output.txt
#SBATCH --error=my_errors.txt

For more detailed info about the state of a job:

# sacct provides accounting data for all jobs (running or terminated)

$sacct -j <job_id>

# detailed information about the status of a specific job including starting/end time, cpus used, task id etc.
$scontrol show job <job_id>


