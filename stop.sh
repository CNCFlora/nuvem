#!/bin/bash

for n in $(cat docker-compose.yml | grep name | awk '{ print $2 }' ); do
  docker stop $n
done

