#!/usr/bin/env bash


if which docker-machine >/dev/null; then
  IP=$(docker-machine ip default)
else
  IP=$(hostname --ip-address)
fi

echo ''
echo " -> starting wordpress web container on: $IP:9998"
echo " -> starting browsersync proxy container on: $IP:9999"
echo " -> starting browsersync UI on: $IP:9997"
echo ''

docker-compose up
