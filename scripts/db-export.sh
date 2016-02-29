parentdir="$(basename "$(pwd)")"

container_name="$parentdir" | tr -d '-' | tr -d '_'
echo $container_name

container_suffix='_db_1'
container_name="$container_name$container_suffix"


docker exec $container_name mysqldump > /tmp/mysql/dump.sql
