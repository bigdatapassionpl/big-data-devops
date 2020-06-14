# Przykład użycia MirrorMaker v1

~~~
docker exec -it kafka1 bash

cd /opt/kafka/bin/

./kafka-topics.sh --create --zookeeper zookeeperdr:2181 --replication-factor 2 --partitions 2 --topic mirrormakertopic
./kafka-topics.sh --describe --zookeeper zookeeperdr:2181

./kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 2 --partitions 2 --topic mirrormakertopic
./kafka-topics.sh --describe --zookeeper zookeeper:2181




~~~


