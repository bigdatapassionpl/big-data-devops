# Przykład użycia MirrorMaker v1

~~~
docker exec -it kafkadr1 bash

cd /opt/kafka/bin/
./kafka-topics.sh --create --zookeeper zookeeperdr.bigdatapassion.com:2181 --replication-factor 2 --partitions 2 --topic mirrormakertopic
~~~

~~~
docker exec -it kafka1 bash

cd /opt/kafka/bin/
./kafka-topics.sh --create --zookeeper zookeeper.bigdatapassion.com:2181 --replication-factor 2 --partitions 2 --topic mirrormakertopic
~~~


