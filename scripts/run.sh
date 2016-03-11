#!/usr/bin/env bash

IP=`./scripts/ip.sh`

echo ''
echo " -> starting wordpress web container on: $IP:9999"
echo ''

docker-compose up
