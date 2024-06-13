#!/bin/bash

echo "---> Authentication ..."
sudo service munge restart

echo "---> Check environment modules ..."
source /etc/profile.d/lmod.sh 
module --version && module avail

echo "---> Jupyterlab ..."
# password: password
jupyter lab --no-browser --allow-root --ip=0.0.0.0 --NotebookApp.token='' --NotebookApp.password='sha1:092f023fbdf6:fe70e174d560ea28767d76d8ad65dd5248598de9'

tail -f /dev/null
