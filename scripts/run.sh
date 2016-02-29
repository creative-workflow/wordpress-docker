#!/usr/bin/env bash

IP=$(docker-machine ip default)
echo "running wordpress on $IP:9999"

docker-compose up
