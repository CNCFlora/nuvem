#!/bin/bash

export HOST=$(hostname -I | awk '{ print $1 }')
export ETCD=http://$HOST/etcd

fige -d -c 'docker2etcd -u'

