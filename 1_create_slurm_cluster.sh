
# local storage folders
mkdir -p workspace
mkdir -p data

echo "launch slurm cluster. please wait..."
docker compose up -d
sleep 3
echo "list running containers"
docker compose ps



