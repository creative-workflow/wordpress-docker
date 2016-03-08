if [ -z "$1" ]
  then
    echo "No argument supplied. Available: db, web, php"
    exit 1
fi
which_container=$1

parentdir="$(basename "$(pwd)")"
container_context=${parentdir//[-_]/}

container_name=$container_context"_"$which_container"_1"

docker exec -it $container_name bash
