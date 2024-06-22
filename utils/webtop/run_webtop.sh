
## nvidia
sudo nvidia-ctk runtime configure --runtime=docker --set-as-default
sudo service docker restart

docker compose -f docker-compose-nvidia.yml up -d 
