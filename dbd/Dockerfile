#FROM nvidia/cuda:11.0.3-base-ubuntu20.04
FROM docker.io/nvidia/cuda:11.0.3-base-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive

#SHELL [ "/bin/bash", "-c" ]

RUN apt update -y && apt install munge -y && apt install vim -y && apt install build-essential -y && apt install git -y && apt-get install mariadb-server -y && apt install wget -y && apt install ca-certificates -y && apt install nfs-common -y

RUN apt install slurmd slurmdbd slurm-client slurmctld -y

RUN apt install sudo -y && apt install python3.9 python3-pip -y 

# Make Python3 available as `python`
# Also ensure that pip points to pip3
RUN ln -s /usr/bin/python3 /usr/bin/python

RUN useradd -m admin -s /usr/bin/bash -d /home/admin && echo "admin:admin" | chpasswd && adduser admin sudo && echo "admin     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN  echo "slurm:slurm" | chpasswd && adduser slurm sudo && echo "slurm     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers 

COPY gres.conf /etc/slurm-llnl/
COPY slurm.conf /etc/slurm-llnl/
COPY slurmdbd.conf /etc/slurm-llnl/
COPY cgroup.conf /etc/slurm-llnl/
COPY docker-entrypoint.sh /etc/slurm-llnl/

COPY munge.key /etc/munge/
RUN chmod 400 /etc/munge/munge.key
RUN chown munge:munge /etc/munge/munge.key

RUN chmod 600 /etc/slurm-llnl/slurmdbd.conf
RUN chown slurm:slurm /etc/slurm-llnl/slurmdbd.conf

# RUN apt update -y && apt install libopenmpi-dev -y && pip3 install mpi4py

RUN apt update -y && apt install net-tools -y && apt install iputils-ping -y && apt install iperf3 -y && apt install nano -y && apt install iotop -y

# lmod - environment module
RUN apt-get install bc unzip lua5.3 liblua5.3-0 liblua5.3-dev lua-filesystem-dev lua-posix-dev -y
RUN apt-get install tcl tcl8.6-dev libtcl8.6 -y
RUN ln -s /usr/include/tcl8.6 /usr/include/tcl && ls /usr/bin/lua && ls /usr/include/tcl

RUN cd /tmp && git clone https://github.com/TACC/Lmod.git && cd Lmod && ./configure --prefix=/opt/focal/ && make install
# RUN source /opt/focal/lmod/lmod/init/profile && module --version
# RUN source /etc/profile.d/lmod.sh && module --version

RUN mkdir -p /opt/uw/modulefiles
RUN touch /opt/focal/lmod/lmod/init/.modulespath
RUN echo "/opt/uw/modulefiles" >> /opt/focal/lmod/lmod/init/.modulespath

RUN ln -s /opt/focal/lmod/lmod/init/profile /etc/profile.d/lmod.sh
RUN ln -s /opt/focal/lmod/lmod/init/cshrc   /etc/profile.d/lmod.csh

EXPOSE 6817 6818 6819 3306

# RUN chown -R slurm:slurm /etc/slurm-llnl/
#WORKDIR /home/admin

ENTRYPOINT ["/etc/slurm-llnl/docker-entrypoint.sh"]
