
# Kafka on Docker
bash kontenera
~~~bash
docker exec -it broker1 bash

docker exec -it --user root broker1 bash
~~~


# Docker zmienne do poleceń w konsoli
~~~bash
#export KAFKA_HOME=/opt/kafka
export KAFKA_HOME=/usr

export KAFKA_ZOOKEEPER=zookeeper:2181
export KAFKA_BROKER=broker1:9092,broker2:9092,broker3:9092

export TOPIC=input-topic
export TOPIC_OUT=output-topic
~~~



### Stworzenie topicu
~~~bash
$KAFKA_HOME/bin/kafka-topics.sh --create --zookeeper $KAFKA_ZOOKEEPER \
    --replication-factor 2 --partitions 3 --topic $TOPIC
~~~



### Informacje o topicu
~~~bash
$KAFKA_HOME/bin/kafka-topics.sh --describe --zookeeper $KAFKA_ZOOKEEPER
$KAFKA_HOME/bin/kafka-topics.sh --describe --zookeeper $KAFKA_ZOOKEEPER \
    --topic $TOPIC
$KAFKA_HOME/bin/kafka-topics.sh --zookeeper $KAFKA_ZOOKEEPER --describe \
    --under-replicated-partitions
~~~



### Edycja topicu
~~~bash
$KAFKA_HOME/bin/kafka-topics.sh --alter --zookeeper $KAFKA_ZOOKEEPER \
    --topic $TOPIC --partitions 3
~~~



### Lista topiców
~~~bash
$KAFKA_HOME/bin/kafka-topics.sh --list --zookeeper $KAFKA_ZOOKEEPER
~~~



### Topic z replikami
~~~bash
$KAFKA_HOME/bin/kafka-topics.sh --create --zookeeper $KAFKA_ZOOKEEPER \
    --replication-factor 3 --partitions 3 --topic my-super-topic
$KAFKA_HOME/bin/kafka-topics.sh --describe --zookeeper $KAFKA_ZOOKEEPER \
    --topic my-super-topic
~~~




### Producent i konsument w konsoli

~~~bash
$KAFKA_HOME/bin/kafka-console-producer.sh --broker-list $KAFKA_BROKER \
    --topic $TOPIC
~~~

~~~bash
$KAFKA_HOME/bin/kafka-console-consumer.sh --bootstrap-server $KAFKA_BROKER \
    --topic $TOPIC --from-beginning

$KAFKA_HOME/bin/kafka-console-consumer.sh --bootstrap-server $KAFKA_BROKER \
    --topic $TOPIC \
    --from-beginning \
    --formatter kafka.tools.DefaultMessageFormatter \
    --property print.key=true \
    --property print.value=true \
    --property key.deserializer=org.apache.kafka.common.serialization.StringDeserializer \
    --property value.deserializer=org.apache.kafka.common.serialization.StringDeserializer
~~~