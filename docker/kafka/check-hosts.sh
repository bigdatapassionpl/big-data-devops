#!/bin/sh

docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' zookeeper

docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' kafka1

docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' kafka2

docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' kafka3

docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' kafka-manager

docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' schema-registry

docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' rest-proxy

docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' kafka-topics-ui