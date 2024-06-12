#!/bin/bash

sudo service munge restart

# password: password
source /etc/profile.d/lmod.sh
module

jupyter lab --no-browser --allow-root --ip=0.0.0.0 --NotebookApp.token='' --NotebookApp.password='sha1:092f023fbdf6:fe70e174d560ea28767d76d8ad65dd5248598de9'

tail -f /dev/null
