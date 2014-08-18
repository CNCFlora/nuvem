#!/bin/bash

export HOST=$(hostname -I | awk '{ print $1 }')
export ETCD=http://$HOST/etcd
export ROOT_APP=entrypoint

fige -c 'docker2etcd -u'

