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
sudo apt-get install tk8.6 tk8.6-dev -y
sudo grep -y
sudo apt-get install grep -y
tclsh
curl -LJO https://github.com/cea-hpc/modules/releases/download/v5.4.0/modules-5.4.0.tar.gz
ls
tar xfz modules-5.4.0.tar.gz
cd modules-5.4.0
pwd
ls -all
sudo ./configure 
make
make install
sudo make install
ls -all /usr/local/Modules
ls -all /usr/local/Modules/modulefiles/
ln -s PREFIX/init/profile.sh /etc/profile.d/modules.sh
sudo ln -s PREFIX/init/profile.sh /etc/profile.d/modules.sh
sudo ln -s PREFIX/init/profile.csh /etc/profile.d/modules.csh
source PREFIX/init/bash
./configure --prefix=/usr/share/Modules               --modulefilesdir=/etc/modulefiles
sudo ./configure --prefix=/usr/share/Modules               --modulefilesdir=/etc/modulefiles
make
sudo make install
source PREFIX/init/bash
source /usr/share/Modules/init/bash
module avail
modules avail
module avail
source /usr/share/Modules/init/bash
ls -all /usr/share/Modules/init/bash
source /usr/share/Modules/init/bash
env
ls /usr/share/Modules/
ls /usr/share/
source /usr/share/Modules/init/bashls -all /usr/local/Modules/modulefiles 
ls -all /usr/local/Modules/modulefiles 
ls -all /usr/local/Modules/modulefiles
module use /usr/local/Modules/modulefiles
module avail
module use /usr/local/Modules/modulefiles/modules
module avail
module use /usr/local/Modules/modulefiles
module load
module exit
exit
module list
module
exit
cd /tmp && sudo apt-get install tk8.6 tk8.6-dev -y
curl -LJO https://github.com/cea-hpc/modules/releases/download/v5.4.0/modules-5.4.0.tar.gz && tar xfz modules-5.4.0.tar.gz
sudo apt install curl -y
curl -LJO https://github.com/cea-hpc/modules/releases/download/v5.4.0/modules-5.4.0.tar.gz && tar xfz modules-5.4.0.tar.gz
pwd
ls -all
cd modules-5.4.0 && ./configure && make && sudo make install
ls -all usr/local/Modules/modulefiles
ls -all /usr/local/Modules/modulefiles
ls -all /usr/local/Modules/modulefiles/module-git 
ls -all /usr/local/Modules/modulefiles/got
ls -all /usr/local/Modules/modulefiles/modules

cd /usr/local/Modules/modulefiles/module-info
ls -all /usr/local/Modules
ls -all /usr/local/Modules/init/
ls -all /usr/local/Modules/init/bash
source /usr/local/Modules/init/bash
sudo source /usr/local/Modules/init/bash
. /usr/local/Modules/init/bash
ln -s /usr/local/Modules/init/profile.sh /etc/profile.d/modules.sh
sudo ln -s /usr/local/Modules/init/profile.sh /etc/profile.d/modules.sh
sudo ln -s /usr/local/Modules/init/profile.csh /etc/profile.d/modules.csh
sudo su
source /usr/local/Modules/init/bash
module
module avail
module list
module avail
module avail python
source /usr/local/Modules/init/bash; module list
module load pgi/19.4
module purge
module load openmpi/4.0
/usr/local/Modules/modulerc
cat /usr/local/Modules/modulerc
cat /usr/local/Modules
ls /usr/local/Modules
ls /usr/local/Modules/modulefiles/modules
module use /usr/local/Modules/modulefiles/modules
module avail
module use /usr/local/Modules/modulefiles
module avail
exit
ls
conda --version
module
bash /etc/profile.d/lmod.sh && module --version
source /opt/focal/lmod/lmod/init/profile && module --version
module --version
module avail
spack
spack/share/spack/setup-env.sh
. /opt/spack/bin/spack/setup-env.sh
/opt/spack/bin
ls -all /opt
ls -all /opt/spack
. /opt/spack/share/spack/setup-env.sh 
spack
spack list py*
spack install python=venv
spack install python-venv
spack install py-gputil
spack install py-gpustat
spack install py-gpustat
sudo chown admin:admin -R /opt/spack
/opt/spack/bin install py-gpustat
/opt/spack/bin install py-gpustat
/opt/spack/bin/spack install py-gpustat
sudo /opt/spack/bin/spack install py-gpustat
lscpu
cd ..
exit
