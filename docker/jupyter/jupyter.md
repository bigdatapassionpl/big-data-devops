
```shell

export docker_image=jupyter/minimal-notebook

docker pull $docker_image

docker run -p 8888:8888 $docker_image

```