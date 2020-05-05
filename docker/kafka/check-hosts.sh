#!/bin/sh

docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' cluster_zookeeper

docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' cluster_kafka1

docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' cluster_kafka2

docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' cluster_kafka3

docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' kafka-manager

docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' schema-registry

docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' rest-proxy

docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' kafka-topics-ui