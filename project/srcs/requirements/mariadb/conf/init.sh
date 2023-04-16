#!/bin/bash

docker rm -f maria

docker rmi -f database

docker build -t database .
docker run -itd --name maria database

