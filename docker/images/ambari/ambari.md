
~~~shell
export DOCKER_USER=bigdatapassion
export DOCKER_NAME=ambari
export DOCKER_VERSION=latest
export DOCKER_IMAGE="${DOCKER_USER}/${DOCKER_NAME}:${DOCKER_VERSION}"
echo $DOCKER_IMAGE
docker rmi -f $DOCKER_IMAGE
docker build --rm -t $DOCKER_IMAGE .
docker images | grep $DOCKER_NAME
docker rm $DOCKER_NAME

docker run -it --name=$DOCKER_NAME \
  -p 8080:8080 \
  -v $(pwd)/m2:/root/.m2 \
  $DOCKER_IMAGE bash
~~~
