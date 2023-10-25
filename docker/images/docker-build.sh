#!/bin/bash

echo Script name: $0
echo $# arguments
if [ $# -eq 1 ]
then
  echo $1
  export DOCKER_NAME=$1
  export DOCKER_VERSION=latest
elif [ $# -eq 2 ]
then
  echo "$1 $2"
  export DOCKER_NAME=$1
  export DOCKER_VERSION=$2
else
  echo "illegal number of parameters"
  exit
fi

export DOCKER_USER=bigdatapassion

export DOCKER_IMAGE="${DOCKER_USER}/${DOCKER_NAME}:${DOCKER_VERSION}"
echo $DOCKER_IMAGE

docker rmi -f $DOCKER_IMAGE

docker build --rm -t $DOCKER_IMAGE $DOCKER_NAME/

docker push $DOCKER_IMAGE

docker images | grep $DOCKER_NAME
