#!/bin/bash

[[ ! $HOST ]] && HOST=$(hostname -I | awk '{ print $1 }')
[[ ! $ETCD ]] && ETCD=http://$HOST/etcd
export ROOT_APP=entrypoint

export HOST
export ETCD

fige -c 'docker2etcd -u' -t etcd
sleep 2
fige -c 'docker2etcd -u' -t logstash
sleep 5
fige -c 'docker2etcd -u' -t entrypoint
sleep 5
fige -c 'docker2etcd -u' -t proxy
sleep 5
fige -c 'docker2etcd -u' -t datahub
sleep 5

for n in $(cat fig.yml | grep name  | awk '{ print $2 }'  ); do
    if [ "$n" != "logstash" ] && [ "$n" != "datahub" ] && [ "$n" != "etcd" ] && [ "$n" != "entrypoint" ] && [ "$n" != "proxy" ] ; then
        fige -c 'docker2etcd -u' -t $n
    fi
done

