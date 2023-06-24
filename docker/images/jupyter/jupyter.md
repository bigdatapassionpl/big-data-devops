
* https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html#

~~~shell
export DOCKER_USER=bigdatapassion
export DOCKER_NAME=jupyter
export DOCKER_VERSION=latest

export DOCKER_IMAGE="${DOCKER_USER}/${DOCKER_NAME}:${DOCKER_VERSION}"
echo $DOCKER_IMAGE

docker run -p 8888:8888 $DOCKER_IMAGE
~~~