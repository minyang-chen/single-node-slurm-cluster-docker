
#environment check spack
#source /opt/spack/share/spack/setup-env.sh

## user modules
mkdir -p /opt/focal/modulefiles
mkdir -p /opt/uw/modulefiles
touch /opt/focal/lmod/lmod/init/.modulespath
echo "/opt/focal/modulefiles" >> /opt/focal/lmod/lmod/init/.modulespath
echo "/opt/uw/modulefiles" >> /opt/focal/lmod/lmod/init/.modulespath
echo "/opt/spack/share/spack/modules" >> /opt/focal/lmod/lmod/init/.modulespath

## create link
#ln -s /opt/focal/lmod/lmod/init/profile /etc/profile.d/lmod.sh
#ln -s /opt/focal/lmod/lmod/init/cshrc   /etc/profile.d/lmod.csh

## environment
cd /opt/spack 
. share/spack/setup-env.sh 
spack --version

## install
spack list conda 
spack install miniconda3 
