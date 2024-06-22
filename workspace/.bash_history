ls
pwd
cd /etc/slurm-llnl/
ls
pwd
ls -all
cat docker-entrypoint.sh 
sudo service slurmctld restart
cat /var/log/slurm-llnl/slurmctld.log 
sudo nano /var/log/slurm-llnl/slurmctld.log 
--num-threads=10
sudo service munge restart
sudo chmod 400 /etc/munge/munge.key
sudo chown munge:munge /etc/munge/munge.key
sudo service munge restart
sudo service slurmctld restart
sinfo -V
sinfo
sudo service slurmctld restart
sinfo -V
sinfo 
exit
sudo chmod 400 /etc/munge/*
sudo chmod 400 /etc/munge
exit
ls
cd /etc/slurm-llnl/
ls
cat docker-entrypoint.sh 
sudo service slurmctld restart
exit
