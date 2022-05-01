#!/bin/sh

echo `docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' zookeeper` zookeeper
echo `docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' zookeeperdr` zookeeperdr

echo `docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' kafka1` kafka1
echo `docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' kafka2` kafka2

echo `docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' kafkadr1` kafkadr1
echo `docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' kafkadr2` kafkadr2
