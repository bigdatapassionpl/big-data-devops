
~~~shell
export DOCKER_USER=bigdatapassion
export DOCKER_NAME=airbyte-source-mssql
export DOCKER_VERSION=0.4.28
export DOCKER_IMAGE="${DOCKER_USER}/${DOCKER_NAME}:${DOCKER_VERSION}"
echo $DOCKER_IMAGE

docker rmi -f $DOCKER_IMAGE
docker build --rm -t $DOCKER_IMAGE .
docker images | grep $DOCKER_NAME

docker run -it --name=$DOCKER_NAME \
  $DOCKER_IMAGE bash

docker push $DOCKER_IMAGE
~~~