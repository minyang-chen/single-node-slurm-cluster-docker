cd /tmp && sudo apt-get install curl tk8.6 tk8.6-dev -y 

curl -LJO https://github.com/cea-hpc/modules/releases/download/v5.4.0/modules-5.4.0.tar.gz && tar xfz modules-5.4.0.tar.gz

cd modules-5.4.0 && ./configure && make && sudo make install

sudo ln -s /usr/local/Modules/init/profile.sh /etc/profile.d/modules.sh
sudo ln -s /usr/local/Modules/init/profile.csh /etc/profile.d/modules.csh

module use /usr/local/modules-4.2.1/modulefiles

source /usr/local/Modules/init/bash
