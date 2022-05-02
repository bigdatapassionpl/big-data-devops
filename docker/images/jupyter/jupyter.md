
* https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html#

~~~shell
export docker_image=jupyter/minimal-notebook

docker pull $docker_image

docker run -p 8888:8888 $docker_image
~~~

~~~shell
export DOCKER_IMAGE=bigdatapassion/all-spark-notebook:2022-04-24
docker rmi -f $DOCKER_IMAGE
docker build --rm -t $DOCKER_IMAGE .
docker images | grep bigdatapassion
docker run -p 8888:8888 $DOCKER_IMAGE
~~~