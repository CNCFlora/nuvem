#!/bin/bash

docker pull $1

docker-compose stop $1 && docker-compose rm $1 docker-compose up -d $1

