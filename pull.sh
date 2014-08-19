#!/bin/bash

for i in $(cat fig.yml | grep image  | awk '{ print $2 }' | sort | uniq ); do
    docker pull $i
done

