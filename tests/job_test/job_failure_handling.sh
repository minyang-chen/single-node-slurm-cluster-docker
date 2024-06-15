Handling job failures and restarts
Step 0: If it fails, blame Slurm.

Step 1: Check the job output/error files. If you haven’t specified one, the default is slurm-<job_id>.out.

Step 2: Check the slurm log files, likely under /var/log/:

slurmdbd.log: logs from the slurmd daemon (one per compute node).
slurmctld.log: logs from the slurmctld daemon.

Step 3: Use sacct to check the state and exit code of a failed job:

sacct -j <job_id> --format=JobID,JobName,State,ExitCode
Step 4: Try to debug directly on the node the job failed by either ssh-ing into it or launching an interactive session (See Section 2.4).

Step 5: Add print statements everywhere, resubmit, and pray for the best.

Step 6: Go back to step 0.


