#!/bin/sh

echo `docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' zookeeper` zookeeper.bigdatapassion.com
echo `docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' zookeeperdr` zookeeperdr.bigdatapassion.com

echo `docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' kafka1` kafka1.bigdatapassion.com
echo `docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' kafka2` kafka2.bigdatapassion.com

echo `docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' kafkadr1` kafkadr1.bigdatapassion.com
echo `docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' kafkadr2` kafkadr2.bigdatapassion.com
