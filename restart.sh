#!/bin/bash

<<<<<<< HEAD
docker pull cncflora/$1

docker-compose stop $1 && docker-compose rm -f $1 && docker-compose up -d $1
=======
docker-compose pull $1 && docker-compose stop $1 && docker-compose rm $1 && docker-compose up -d $1
>>>>>>> ef28fc181426f655a3b14a7e6c44e043c3d89c1d

