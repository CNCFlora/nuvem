#!/bin/bash

export HOST=$(hostname -I | awk '{ print $1 }')
export ETCD=http://$HOST/etcd
export ROOT_APP=entrypoint

fige -c 'docker2etcd -u' -t etcd
sleep 2
fige -c 'docker2etcd -u' -t logstash
sleep 5
fige -c 'docker2etcd -u' -t datahub
sleep 5

for n in $(cat fig.yml | grep name  | awk '{ print $2 }'  ); do
    if [ "$n" != "logstash" ] && [ "$n" != "datahub" ] && [ "$n" != "etcd" ] ; then
        echo "run $n"
    fi
done

