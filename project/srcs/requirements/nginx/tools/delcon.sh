#!/bin/sh

docker rm -f nginx
docker rmi -f my-nginx

docker build -t my-nginx .
docker run --name nginx -p 80:80 -itd my-nginx
