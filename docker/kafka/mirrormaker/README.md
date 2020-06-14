# Przykład użycia MirrorMaker v1

Dokumentacja:
- https://cwiki.apache.org/confluence/pages/viewpage.action?pageId=27846330
- https://kafka.apache.org/documentation.html#basic_ops_mirror_maker

~~~
docker exec -it kafka1 bash

alias ll="ls -lah"
cd /opt/kafka/bin/

./kafka-topics.sh --create --zookeeper zookeeperdr:2181 --replication-factor 2 --partitions 2 --topic mirrormakertopic
./kafka-topics.sh --describe --zookeeper zookeeperdr:2181

./kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 2 --partitions 2 --topic mirrormakertopic
./kafka-topics.sh --describe --zookeeper zookeeper:2181


./kafka-mirror-maker.sh \
    --consumer.config /opt/kafka/mirrormaker/consumer.properties \
    --producer.config /opt/kafka/mirrormaker/producer.properties \
    --num.streams 1 --whitelist=".*"

./kafka-consumer-groups.sh --describe --group mirror_maker --bootstrap-server kafka1:9092
~~~


