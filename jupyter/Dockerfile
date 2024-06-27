FROM docker.io/nvidia/cuda:11.0.3-base-ubuntu20.04
#FROM nvidia/cuda:11.0.3-base-ubuntu20.04
#FROM nvidia/cuda:11.0.3-devel-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive

ENV EB_ROOT=/tools/easybuild
ENV EB_PYTHON=python3.9
ENV EB_MODULEPATH="~/.local/easybuild/modules"
ENV LMOD_ROOT=/tools/focal/lmod
ENV LMOD_CMD=/tools/focal/lmod/lmod/libexec/lmod
ENV LMOD_COLORIZE="YES"
ENV MODULEPATH_ROOT="/tools/focal/modulefiles"
ENV MODULEPATH="/tools/spack/share/spack/lmod:~/.local/easybuild/modules:/tools/uw/modulefiles:/tools/spack/share/spack/modules"
ENV SPACK_ROOT=/tools/spack
ENV PATH="${PATH}:${SPACK_ROOT}/bin:${EB_ROOT}/bin"
ENV SPACK_LMOD_MODULES='/tools/spack/bin/spack module lmod refresh'
ENV SPACK_TCL_MODULES='/tools/spack/bin/spack module tcl refresh'
ENV SPACK_SEARCH_MODULES='/tools/spack/bin/spack list'

# module use /tools/focal/lmod/8.7.40/modulefiles/
# module use /home/admin/.spack

RUN apt update -y && apt install munge -y && apt install vim -y && apt install build-essential -y && apt install git -y && apt-get install mariadb-server -y && apt install wget -y && apt install nfs-common -y

RUN apt install slurm-client -y

RUN apt install curl -y && apt install dirmngr apt-transport-https lsb-release ca-certificates -y

# Make Python3 available as `python` also ensure that pip points to pip3
RUN apt install sudo -y && apt install python3.9 python3.9-dev python3-pip -y && ln -s /usr/bin/python3.9 /usr/bin/python

RUN rm /usr/bin/python3 && ln -s /usr/bin/python3.9 /usr/bin/python3

RUN useradd -m admin -s /usr/bin/bash -d /home/admin && echo "admin:admin" | chpasswd && adduser admin sudo && echo "admin     ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers

## nodejs
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt update -y && apt install nodejs -y && npm install -g configurable-http-proxy

## jupyterlab and slurm extension
RUN pip3 install jupyterlab==4.2.3 && pip3 install jupyterlab_slurm && pip3 install jupyterlab_theme_solarized_dark

## Jupyter Lmod/Tmod Extensions
RUN pip install jupyterlmod && jupyter labextension disable @jupyterlab/server-proxy && jupyter labextension disable jupyterlab-server-proxy

# COPY gres.conf /etc/slurm-llnl/
# COPY slurm.conf /etc/slurm-llnl/
# COPY cgroup.conf /etc/slurm-llnl/
# COPY docker-entrypoint.sh /etc/slurm-llnl/

RUN mkdir -p /etc/slurm-llnl
RUN chown -R slurm:slurm /etc/slurm-llnl

## Authentication
# RUN mkdir -p /etc/munge
# RUN chown -R munge:munge /etc/munge
COPY munge.key /etc/munge/
RUN chmod 400 /etc/munge/munge.key
RUN chown munge:munge /etc/munge/munge.key

## Environment Module tsch--START
# cd /tmp && sudo apt-get install curl tk8.6 tk8.6-dev -y
# curl -LJO https://github.com/cea-hpc/modules/releases/download/v5.4.0/modules-5.4.0.tar.gz && tar xfz modules-5.4.0.tar.gz
# cd modules-5.4.0 && ./configure && make && sudo make install

# sudo ln -s /usr/local/Modules/init/profile.sh /etc/profile.d/modules.sh
# sudo ln -s /usr/local/Modules/init/profile.csh /etc/profile.d/modules.csh

# module use /usr/local/modules-4.2.1/modulefiles
# source /usr/local/Modules/init/bash
## Environment Module --FINISH

# lmod tool --START
RUN apt install bc unzip lua5.3 liblua5.3-0 liblua5.3-dev lua-filesystem-dev lua-posix-dev -y
RUN apt install tcl tcl8.6-dev libtcl8.6 -y
RUN ln -s /usr/include/tcl8.6 /usr/include/tcl && ls /usr/bin/lua && ls /usr/include/tcl

RUN cd /tmp && git clone https://github.com/TACC/Lmod.git && cd Lmod && ./configure --prefix=/tools/focal/ && make install

## modules files
RUN mkdir -p /tools/uw/modulefiles
RUN touch /tools/focal/lmod/lmod/init/.modulespath
RUN echo "/tools/focal/modulefiles" >>/tools/focal/lmod/lmod/init/.modulespath
RUN echo "/tools/uw/modulefiles" >>/tools/focal/lmod/lmod/init/.modulespath
RUN echo "/tools/spack/share/spack/modules" >>/tools/focal/lmod/lmod/init/.modulespath
RUN echo "/tools/spack/share/spack/lmod" >>/tools/focal/lmod/lmod/init/.modulespath
RUN echo "~/.local/easybuild/modules" >>/tools/focal/lmod/lmod/init/.modulespath

RUN ln -s /tools/focal/lmod/lmod/init/profile /etc/profile.d/lmod.sh
RUN ln -s /tools/focal/lmod/lmod/init/cshrc /etc/profile.d/lmod.csh
# lmod tool --FINISH

WORKDIR /home/admin

EXPOSE 8888

ENV USER admin
ENV SHELL bash

## Openmpi
RUN apt install libopenmpi-dev -y && pip3 install mpi4py

## Utilities
RUN apt update -y && apt install net-tools -y && apt install iputils-ping -y && apt install iperf3 -y && apt install nano -y && apt install iotop -y && apt install htop -y && apt install fish -y && apt install tmux -y

## Shell tool
RUN curl -sLf https://spacevim.org/install.sh | bash
#RUN curl -sLF https://starship.rs/install.sh | bash

# Spack tool
RUN mkdir -p /tools && cd /tools && git clone --depth=100 --branch=releases/v0.22 https://github.com/spack/spack.git /tools/spack && cd /tools/spack/bin && ./spack install zlib

# Spack installation - miniconda3
RUN cd /tools/spack && . share/spack/setup-env.sh && spack list conda && spack install miniconda3 && spack load miniconda3 && conda --version

# RUN /tools/spack/bin/spack install python  
# Spack generate module files for all future installations
#RUN /tools/spack/bin/spack module tcl refresh -y && /tools/spack/bin/spack config add modules:default:enable:[tcl]
RUN /tools/spack/bin/spack module lmod refresh -y && /tools/spack/bin/spack config add modules:default:enable:[lmod]

## EasyBuild tool
RUN mkdir -p /tools/easybuild && pip3 install --prefix /tools/easybuild easybuild

ENV PYTHONPATH=/tools/easybuild/lib/python3.9/site-packages:${PYTHONPATH}

ENTRYPOINT ["/etc/slurm-llnl/docker-entrypoint.sh"]
