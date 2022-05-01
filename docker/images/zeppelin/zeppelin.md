
* https://zeppelin.apache.org/docs/latest/quickstart/install.html#using-the-official-docker-image
* https://zeppelin.apache.org/docs/latest/quickstart/kubernetes.html

~~~bash
docker pull apache/zeppelin:0.10.1

docker run -p 8080:8080 --rm --name zeppelin apache/zeppelin:0.10.1
~~~