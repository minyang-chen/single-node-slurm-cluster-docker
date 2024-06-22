
echo "prepare shell environment"
echo "spack packages"
source /opt/spack/share/spack/setup-env.sh
spack --version
spack list


echo "Lmod module"
source /etc/profile.d/lmod.sh
module --version
module avail
module purge


