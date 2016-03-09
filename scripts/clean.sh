#!/usr/bin/env bash

echo 'dont forget to export your database with "./scripts/db-export"'
read -p "Are you sure you want to destroy all containers? <y/N> " prompt
if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
then

else
  exit 0
fi


CONTAINERS=(db web php)
#create folders
for name in ${CONTAINERS[@]}; do
  echo "destroying $name container"
  docker-compose stop $name
  docker-compose rm $name
done
