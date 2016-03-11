#!/usr/bin/env bash

CONTAINERS=(db web php)
for name in ${CONTAINERS[@]}; do
  docker-compose build $name
done
