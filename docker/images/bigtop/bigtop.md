
~~~shell
export DOCKER_IMAGE=bigdatapassion/bigtop:latest
docker rmi -f $DOCKER_IMAGE
docker build --rm -t $DOCKER_IMAGE .
docker images | grep bigdatapassion
docker rm bigtop
docker run -it --name=bigtop -p 8080:8080 $DOCKER_IMAGE bash
~~~