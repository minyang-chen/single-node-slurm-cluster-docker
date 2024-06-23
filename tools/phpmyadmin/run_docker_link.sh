
docker run --name phpmyadmin -d --link mysql_db_server:db -p 8080:80 phpmyadmin

