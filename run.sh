#!/bin/bash

[[ ! $HOST ]] && HOST=$(hostname -I | awk '{ print $1 }')
[[ ! $ETCD ]] && ETCD=http://$HOST/etcd
export ROOT_APP=entrypoint

export HOST
export ETCD

fige -c 'docker2etcd -u; sleep 3' -u

