#!/bin/bash

[[ ! $HOST ]] && HOST=$(hostname -I | awk '{ print $1 }')
export HOST

[[ ! $ETCD ]] && ETCD=http://$HOST:4001
export ETCD

fige -t etcd
sleep 2

ETCD2="http://$(docker inspect --format='{{.NetworkSettings.IPAddress}}' etcd):4001"

fige -t logstash -e $ETCD2
fige -t logspout -e $ETCD2
fige -t portal -e $ETCD2
docker2etcd 
fige -t proxy -e $ETCD2
docker2etcd -u

ETCD=http://$HOST/etcd
export ETCD

for n in $(cat fig.yml | grep name | awk '{ print $2 }' ); do
  if [ "$n" != "etcd" ] && [ "$n" != "logstash" ] && [ "$n" != "portal" ] && [ "$n" != "proxy" ] && [ "$n" != "logspout"  ] ; then
    fige -t $n -e $ETCD2
  fi
done

docker2etcd -u

