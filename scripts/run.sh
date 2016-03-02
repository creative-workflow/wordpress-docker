#!/usr/bin/env bash


if which docker-machine >/dev/null; then
  IP=$(docker-machine ip default)
else
  IP=$(hostname --ip-address)
fi

echo ''
echo " -> starting wordpress web container on: $IP:9999"
echo ''

docker-compose up
