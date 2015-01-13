#!/bin/bash

[[ ! $HOST ]] && HOST=$(hostname -I | awk '{ print $1 }')
export HOST

[[ ! $ETCD ]] && ETCD=http://$HOST:4001
export ETCD

docker pull $(cat fig.yml | grep $1 | grep image | awk '{ print $2 }') 
fige -t $1 -c 'docker2etcd -u'

