# Przykład użycia MirrorMaker v2


~~~
docker exec -it mm2 bash

alias ll="ls -lah"
cd /opt/kafka/bin/



#/opt/kafka/bin/kafka-topics.sh --create --zookeeper zookeeperdr:2181 --replication-factor 2 --partitions 2 --topic mirrormakertopicdr
/opt/kafka/bin/kafka-topics.sh --describe --zookeeper zookeeperdr:2181

/opt/kafka/bin/kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 2 --partitions 2 --topic mirrormakertopic
/opt/kafka/bin/kafka-topics.sh --describe --zookeeper zookeeper:2181



/opt/kafka/bin/connect-mirror-maker.sh /opt/kafka/mirrormaker/mm2.properties




/opt/kafka/bin/kafka-console-consumer.sh --bootstrap-server kafkadr1:9092 --topic A.mirrormakertopic


/opt/kafka/bin/kafka-console-producer.sh --bootstrap-server kafka1:9092 --topic mirrormakertopic
~~~