#!/usr/bin/env bash

IP=`./scripts/ip.sh`


docker-compose build
docker-compose create

echo ''
echo " -> starting wordpress web container on: $IP:9999"
echo ''

docker-compose start
