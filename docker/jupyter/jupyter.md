
```shell

export docker_image=jupyter/minimal-notebook

docker pull $docker_image

docker run -p 8888:8888 $docker_image

```

~~~shell
docker build --rm -t bigdatapassion/all-spark-notebook .
docker run -p 8888:8888 bigdatapassion/all-spark-notebook
~~~