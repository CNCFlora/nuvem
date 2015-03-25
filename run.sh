#!/bin/bash

[[ ! $HOST ]] && HOST=$(hostname -I | awk '{ print $1 }')
export HOST

[[ ! $ETCD ]] && ETCD=http://$HOST:4001
export ETCD

fige -t etcd
sleep 2

ETCD2="http://$(docker inspect --format='{{.NetworkSettings.IPAddress}}' etcd):4001"

docker2etcd
docker2etcd -c
fige -t logstash -e $ETCD2
docker2etcd -c
fige -t logspout -e $ETCD2
docker2etcd -c
fige -t portal -e $ETCD2
docker2etcd -c 
fige -t proxy -e $ETCD2
docker2etcd -c -u

ETCD=http://$HOST/etcd
export ETCD

for n in $(cat fig.yml | grep name | awk '{ print $2 }' ); do
  if [ "$n" != "etcd" ] && [ "$n" != "logstash" ] && [ "$n" != "portal" ] && [ "$n" != "proxy" ] ; then
    fige -t $n -e $ETCD2
    docker2etcd -u
  fi
done

#fige -t proxy
#docker2etcd -c -u

#fige -c 'docker2etcd -u; sleep 3' -u

