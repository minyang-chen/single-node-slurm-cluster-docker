
## https://kasmweb.com/docs/latest/guide/custom_images.html?utm_campaign=Github&utm_source=github
#The container is now accessible via a browser : https://<IP>:6901

#    User : kasm_user
#    Password: password

sudo docker run --rm  -it --shm-size=1024m -p 6901:6901 -e VNC_PW=password kasmweb/fedora-39-desktop:1.15.0
