
$ sudo mkdir -p /data/nfs-storage

NFS Server

$ docker run -itd --privileged \
  --restart unless-stopped \
  -e SHARED_DIRECTORY=/data \
  -v /data/nfs-storage:/data \
  -p 2049:2049 \
  itsthenetwork/nfs-server-alpine:12


We can do the same using docker-compose, for our docker-compose.yml:

version: "2.1"
services:
  # https://hub.docker.com/r/itsthenetwork/nfs-server-alpine
  nfs:
    image: itsthenetwork/nfs-server-alpine:12
    container_name: nfs
    restart: unless-stopped
    privileged: true
    environment:
      - SHARED_DIRECTORY=/data
    volumes:
      - /data/nfs-storage:/data
    ports:
      - 2049:2049


To deploy using docker-compose:
$ docker-compose up -d
