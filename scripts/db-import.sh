#!/usr/bin/env bash

database_name='wordpress'

docker-compose run db "mysql -uroot -pwordpress $database_name < /tmp/mysql/dump.sql"
