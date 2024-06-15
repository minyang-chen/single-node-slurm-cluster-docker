FROM docker.io/nvidia/cuda:11.0.3-base-ubuntu20.04
#FROM nvidia/cuda:11.0.3-base-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive

ENV SPACK_ROOT=/opt/spack
ENV LMOD_ROOT=/opt/focal/lmod
ENV LMOD_CMD=/opt/focal/lmod/lmod/libexec/lmod
ENV MODULEPATH_ROOT=/opt/focal/modulefiles
ENV MODULEPATH=/opt/uw/modulefiles

RUN apt update -y && apt install munge -y && apt install vim -y && apt install build-essential -y && apt install git -y && apt-get install mariadb-server -y && apt install wget -y && apt install nfs-common -y

RUN apt install slurmd slurm-client slurmctld -y

# Make Python3 available as `python` also ensure that pip points to pip3
RUN apt install sudo -y && apt install python3.9 python3-pip -y && ln -s /usr/bin/python3 /usr/bin/python

RUN useradd -m admin -s /usr/bin/bash -d /home/admin && echo "admin:admin" | chpasswd && adduser admin sudo && echo "admin     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers 

RUN apt update -y && apt install libopenmpi-dev -y && pip3 install mpi4py
##RUN apt update -y && apt install net-tools -y && apt install iputils-ping -y && apt install iperf3 -y && apt install nano -y && apt install iotop -y
RUN apt update -y && apt install net-tools -y && apt install iputils-ping -y && apt install iperf3 -y && apt install nano -y && apt install iotop -y && apt install htop -y && apt install fish -y

# configuration
COPY gres.conf /etc/slurm-llnl/
COPY slurm.conf /etc/slurm-llnl/
COPY cgroup.conf /etc/slurm-llnl/
COPY docker-entrypoint.sh /etc/slurm-llnl/

# Authentication
COPY munge.key /etc/munge/
RUN sudo chmod 400 /etc/munge/munge.key
RUN sudo chown munge:munge /etc/munge/munge.key

# lmod - environment module
RUN apt-get install bc unzip lua5.3 liblua5.3-0 liblua5.3-dev lua-filesystem-dev lua-posix-dev -y
RUN apt-get install tcl tcl8.6-dev libtcl8.6 -y
RUN ln -s /usr/include/tcl8.6 /usr/include/tcl && ls /usr/bin/lua && ls /usr/include/tcl

RUN cd /tmp && git clone https://github.com/TACC/Lmod.git && cd Lmod && ./configure --prefix=/opt/focal/ && make install
# RUN source /opt/focal/lmod/lmod/init/profile && module --version
# RUN source /etc/profile.d/lmod.sh && module --version

# RUN mkdir -p /opt/uw/modulefiles
# RUN touch /opt/focal/lmod/lmod/init/.modulespath
# RUN echo "/opt/uw/modulefiles" >> /opt/focal/lmod/lmod/init/.modulespath

# RUN ln -s /opt/focal/lmod/lmod/init/profile /etc/profile.d/lmod.sh
# RUN ln -s /opt/focal/lmod/lmod/init/cshrc   /etc/profile.d/lmod.csh

#RUN chown -R admin:admin /etc/slurm-llnl

## environment module
RUN mkdir -p /opt/focal/modulefiles
RUN mkdir -p /opt/uw/modulefiles
RUN touch /opt/focal/lmod/lmod/init/.modulespath
RUN echo "/opt/focal/modulefiles" >> /opt/focal/lmod/lmod/init/.modulespath
RUN echo "/opt/uw/modulefiles" >> /opt/focal/lmod/lmod/init/.modulespath
RUN echo "/opt/spack/share/spack/modules" >> /opt/focal/lmod/lmod/init/.modulespath

RUN ln -s /opt/focal/lmod/lmod/init/profile /etc/profile.d/lmod.sh
RUN ln -s /opt/focal/lmod/lmod/init/cshrc   /etc/profile.d/lmod.csh

EXPOSE 6817 6818 6819 3306 

WORKDIR /home/admin

# Spack Installation
RUN git clone --depth=100 --branch=releases/v0.22 https://github.com/spack/spack.git /opt/spack && cd /opt/spack/bin && ./spack install zlib

RUN cd /opt/spack && . share/spack/setup-env.sh && spack list conda && spack install miniconda3 && spack load miniconda3 && conda --version

## Lmod Installation
## RUN cd /opt/spack/bin && ./spack install lmod && . $(spack location -i lmod)/lmod/lmod/init/bash && . spack/share/spack/setup-env.sh

RUN export PATH=/opt/spack/bin:$PATH

RUN pip3 install easybuild

ENTRYPOINT ["/etc/slurm-llnl/docker-entrypoint.sh"]
