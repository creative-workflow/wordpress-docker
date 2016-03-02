parentdir="$(basename "$(pwd)")"

container_context=${parentdir//[-_]/}

container_suffix='_db_1'
container_name="$container_context$container_suffix"

database_name='wordpress'
docker exec -d $container_name bash -c "mysqldump $database_name > /tmp/mysql/dump.sql"
