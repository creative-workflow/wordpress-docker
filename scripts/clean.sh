parentdir="$(basename "$(pwd)")"

container_context=${parentdir//[-_]/}

CONTAINERS=(db web php)

#create folders
for name in ${CONTAINERS[@]}; do
  container_name=$container_context"_"$name"_1"
  docker stop $container_name
  docker rm $container_name
done
