#!/bin/bash

for n in $(cat fig.yml | grep name | awk '{ print $2 }' ); do
  docker stop $n
done

