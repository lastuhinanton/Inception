#!/bin/bash
sudo rm -rf ../data/database
sudo mkdir ../data/database
docker rmi -f srcs_mariadb srcs_nginx
