#!/bin/bash

docker network ls nuvem || docker network create --driver bridge nuvem
./pull.sh
docker-compose up -d

