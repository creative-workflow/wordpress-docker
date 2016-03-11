#!/usr/bin/env bash

parentdir="$(basename "$(pwd)")"

container_context=${parentdir//[-_]/}
container_name=$container_context"_db_1"

database_name='wordpress'
docker exec -d $container_name bash -c "mysql -uroot -pwordpress $database_name < /tmp/mysql/dump.sql"
