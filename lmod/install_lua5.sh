cd /tmp
## https://github.com/TACC/Lmod/issues/461

apt-get install bc unzip lua5.3 liblua5.3-0 liblua5.3-dev lua-filesystem-dev lua-posix-dev -y
apt-get install tcl tcl8.6-dev libtcl8.6 -y

ln -s /usr/include/tcl8.6 /usr/include/tcl && ls /usr/bin/lua && ls /usr/include/tcl

git clone https://github.com/TACC/Lmod.git && cd Lmod && ./configure --prefix=/opt/focal/ && make install

source /opt/focal/lmod/lmod/init/profile && module --version


mkdir -p /opt/uw/modulefiles
cat > /opt/focal/lmod/lmod/init/.modulespath <<EOF
/opt/uw/modulefiles
EOF

ln -s /opt/focal/lmod/lmod/init/profile /etc/profile.d/lmod.sh
ln -s /opt/focal/lmod/lmod/init/cshrc   /etc/profile.d/lmod.csh

source /etc/profile.d/lmod.sh

