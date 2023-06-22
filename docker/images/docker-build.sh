#!/bin/bash

export DOCKER_USER=bigdatapassion
export DOCKER_NAME=coder
export DOCKER_VERSION=latest

export DOCKER_IMAGE="${DOCKER_USER}/${DOCKER_NAME}:${DOCKER_VERSION}"
echo $DOCKER_IMAGE

docker rmi -f $DOCKER_IMAGE

docker build --rm -t $DOCKER_IMAGE coder/

docker images | grep $DOCKER_NAME

#docker run -it --name=$DOCKER_NAME \
#  $DOCKER_IMAGE bash

#docker rm $DOCKER_NAME

docker push $DOCKER_IMAGE
