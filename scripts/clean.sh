#!/usr/bin/env bash

echo 'dont forget to export your database with "./scripts/db-export"'

CONTAINERS=(db web php)
for name in ${CONTAINERS[@]}; do
  echo ''
  docker-compose stop $name
  docker-compose rm $name
done
