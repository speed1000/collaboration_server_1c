#!/bin/bash
set -e

DOCKER_REGISTRY_URL=192.168.173.50:5000

docker login $DOCKER_REGISTRY_URL

last_arg='.'

docker build \
    --build-arg BASE_TAG=latest \
    -t $DOCKER_REGISTRY_URL/collaboration_server_1c_new:latest \
	-f Dockerfile \
    $last_arg

docker push $DOCKER_REGISTRY_URL/collaboration_server_1c_new:latest