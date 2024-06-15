
## Step 1: Installing EasyBuild into a temporary location

# pick installation prefix, and install EasyBuild into it
export EB_TMPDIR=/tmp/$USER/eb_tmp
python3 -m pip install --ignore-installed --prefix $EB_TMPDIR easybuild

# update environment to use this temporary EasyBuild installation
export PATH=$EB_TMPDIR/bin:$PATH
export PYTHONPATH=$(/bin/ls -rtd -1 $EB_TMPDIR/lib*/python*/site-packages | tail -1):$PYTHONPATH
export EB_PYTHON=python3

## Step 2: Using EasyBuild to install EasyBuild
eb --install-latest-eb-release --prefix $HOME/easybuild

## Step 3: Loading the EasyBuild module
module use _PREFIX_/modules/all

### Replace _PREFIX_ with the path to the directory that you used when running Step 2: Using EasyBuild to install EasyBuild (for example, $HOME/easybuild).
module load EasyBuild

## Sanity Test
python -V
type module
type -f module
module --version
module av EasyBuild
which -a eb
eb --version

