#!/usr/bin/env bash

parentdir="$(basename "$(pwd)")"

container_context=${parentdir//[-_.]/}
container_name=$container_context"_db_1"

database_name="wordpress"
database_user="root"

export_file="/tmp/mysql/dump.sql"

docker exec -d $container_name bash -c "mysqldump -u$database_user --databases $database_name > $export_file"
