#!/usr/bin/env bash

echo 'dont forget to export your database with "./scripts/db-export"'

CONTAINERS=(db web php browsersync)
for name in ${CONTAINERS[@]}; do
  echo "destroying $name container"
  docker-compose stop $name
  docker-compose rm $name
done
