
sudo apt install nfs-common -y

echo "create mount point /mnt/workspace/..."

sudo mkdir -p /mnt/workspace
sudo chmod -R 775 /mnt/workspace
sudo mount -t nfs4 localhost: /mnt/workspace
ls -all /mnt/workspace
