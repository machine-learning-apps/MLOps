#!/bin/bash

set -e

root="$(pwd)"

if [[ $- == "*i*" ]]; then
  DOCKER_OPTS="-it"
fi

echo "%%%FOLD {building image}%%%"
docker-compose build pages
echo "%%%END FOLD%%%"

docker-compose run --rm \
  $DOCKER_OPTS \
  -w "$root" \
  -v "$root:$root" \
  pages \
  script/cibuild
