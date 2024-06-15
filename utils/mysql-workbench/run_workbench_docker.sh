docker run -d \
  --name=mysql-workbench \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  -p 3000:3000 \
  -p 3001:3001 \
  -v /config:/config \
  --cap-add="IPC_LOCK" \
  --restart unless-stopped \
  lscr.io/linuxserver/mysql-workbench:latest
