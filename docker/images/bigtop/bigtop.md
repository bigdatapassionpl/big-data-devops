
~~~shell
export DOCKER_IMAGE=bigdatapassion/bigtop:latest
docker rmi -f $DOCKER_IMAGE
docker build --rm -t $DOCKER_IMAGE .
docker images | grep bigdatapassion
docker rm bigtop
docker run -it --name=bigtop -p 8080:8080 $DOCKER_IMAGE bash
~~~

~~~shell
docker cp \
  ~/projects/github/apache/bigtop/bigtop-packages/src/common/bigtop-ambari-mpack/bgtp-ambari-mpack/target/bgtp-ambari-mpack-1.0.0.0-SNAPSHOT-bgtp-ambari-mpack.tar.gz \
  bigtop:/tmp/bgtp-ambari-mpack-1.0.0.0-SNAPSHOT-bgtp-ambari-mpack.tar.gz
~~~