#!/bin/bash

echo Script name: $0
echo $# arguments
if [ $# -ge 2 ]
then
  echo "$1 $2"
  export DOCKER_NAME=$1
  export REPO_NAME=$2
  export DOCKER_VERSION=latest
elif [ $# -eq 2 ]
then
  echo "$1 $2 $3"
  export DOCKER_NAME=$1
  export REPO_NAME=$2
  export DOCKER_VERSION=$3
else
  echo "illegal number of parameters"
  exit
fi

gcloud auth print-access-token | docker login -u oauth2accesstoken --password-stdin https://$GCP_REGION-docker.pkg.dev

export FULL_IMAGE_NAME="$GCP_REGION-docker.pkg.dev/$GCP_PROJECT_ID/$REPO_NAME/$IMAGE_NAME"
echo $FULL_IMAGE_NAME

docker rmi -f $FULL_IMAGE_NAME

docker build --rm -t $FULL_IMAGE_NAME --platform linux/amd64 $DOCKER_NAME/

docker push $FULL_IMAGE_NAME

docker images | grep $FULL_IMAGE_NAME
