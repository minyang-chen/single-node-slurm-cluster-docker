
module purge
#export SPACK_PYTHON=/spack/2206/apps/linux-centos7-x86_64_v3/gcc-11.3.0/python-3.11.3-gl2q3yz/bin/python
export SPACK_PYTHON=/opt/spack/opt/spack/linux-ubuntu20.04-x86_64_v4/gcc-9.4.0/miniconda3-24.3.0-nyutz6mpwmkmufasqu5pc3p2twmnybgk/bin/python

source ./spack/share/spack/setup-env.sh
spack env activate python
python

