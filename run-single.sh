#!/bin/bash

[[ ! $HOST ]] && HOST=$(hostname -I | awk '{ print $1 }')
export HOST

[[ ! $ETCD ]] && ETCD=http://$HOST:4001
export ETCD

docker pull $(cat fig.yml | grep $1 | grep image | awk '{ print $2 }') 
fige -t $1 -e "http://$(docker inspect --format='{{.NetworkSettings.IPAddress}}' etcd):4001"
docker2etcd -u

