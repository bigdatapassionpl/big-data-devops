#!/bin/bash

echo Script name: $0
echo $# arguments
if [ $# -eq 1 ]
then
  echo $1
  export DOCKER_NAME=$1
else
  echo "illegal number of parameters"
  exit
fi

export DOCKER_USER=bigdatapassion
export DOCKER_VERSION=latest

export DOCKER_IMAGE="${DOCKER_USER}/${DOCKER_NAME}:${DOCKER_VERSION}"
echo $DOCKER_IMAGE

docker images | grep $DOCKER_NAME

docker run -it --name=$DOCKER_NAME \
  $DOCKER_IMAGE bash

docker rm $DOCKER_NAME
