
echo "starting nfs server..."
docker run -itd --privileged \
  --restart unless-stopped \
  -e SHARED_DIRECTORY=/data \
  -v ./data/nfs-storage:/data \
  -p 2049:2049 \
  itsthenetwork/nfs-server-alpine:12

echo "done"

