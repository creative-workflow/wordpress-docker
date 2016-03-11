#!/usr/bin/env bash

CONTAINERS=(db web php browsersync)
for name in ${CONTAINERS[@]}; do
  docker-compose build $name
done
