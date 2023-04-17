#!/bin/bash

docker-compose down
docker rmi -f srcs_mariadb
docker rmi -f srcs_nginx
docker-compose up -d
curl http://localhost/test/
