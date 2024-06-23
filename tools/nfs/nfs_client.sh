
https://ruan.dev/blog/2020/09/20/setup-a-nfs-server-with-docker

NFS Client

To use a NFS Client to mount this to your filesystem, you can look at this blogpost>

In summary:
$ sudo apt install nfs-client -y
$ sudo mount -v -o vers=4,loud 192.168.0.4:/ /mnt

Verify that the mount is showing:
$ df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda2       109G   53G   51G  52% /
192.168.0.4:/   4.5T  2.2T  2.1T  51% /mnt

Now, create a test file on our NFS export:Now, create a test file on our NFS export:
$ touch /mnt/file.txt

Verify that the test file is on the local path:
$ ls /data/nfs-storage/
file.txt

If you want to load this into other client's /etc/fstab:
192.168.0.4:/   /mnt   nfs4    _netdev,auto  0  0

NFS Docker Volume Plugin:
You can use a NFS Volume Plugin for Docker or Docker Swarm for persistent container storage.

To use the NFS Volume plugin, we need to download docker-volume-netshare from their github releases page.

$ wget https://github.com/ContainX/docker-volume-netshare/releases/download/v0.36/docker-volume-netshare_0.36_amd64.deb
$ dpkg -i docker-volume-netshare_0.36_amd64.deb
$ service docker-volume-netshare start

Then your docker-compose.yml:

version: '3.7'

services:
  mysql:
    image: mariadb:10.1
    networks:
      - private
    environment:
      - MYSQL_ROOT_PASSWORD=${DATABASE_PASSWORD:-admin}
      - MYSQL_DATABASE=testdb
      - MYSQL_USER=${DATABASE_USER:-admin}
      - MYSQL_PASSWORD=${DATABASE_PASSWORD:-admin}
    volumes:
      - mysql_data.vol:/var/lib/mysql

volumes:
  mysql_data.vol:
    driver: nfs
    driver_opts:
      share: 192.168.69.1:/mysql_data_vol



