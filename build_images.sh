
echo "build slurm-dbd"
cd dbd && ./build_image.sh && cd ..

echo "build slurm-master"
cd master && ./build_image.sh && cd ..

echo "build slurm-node"
cd node && ./build_image.sh && cd ..

echo "build slurm-jupyter"
cd jupyter && ./build_image.sh && cd ..

echo "clean up dangling images"
docker rmi $(docker images --filter "dangling=true" -q)

echo "list images"
docker images
