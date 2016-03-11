if which docker-machine >/dev/null; then
  echo $(docker-machine ip default)
else
  echo $(hostname --ip-address)
fi
