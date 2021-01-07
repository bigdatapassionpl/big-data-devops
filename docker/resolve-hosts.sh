#!/bin/bash

# get all running docker container names
containers=$(sudo docker ps | awk '{if(NR>1) print $NF}')
host=$(hostname)

# loop through all containers
echo "# Docker" >> /etc/hosts
for container in $containers
do
  echo "Container: $container"

  container_ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $container)
  echo $container_ip

  container_hostname=$(docker inspect -f '{{.Config.Hostname}}' $container)
  echo $container_hostname

  echo "$container_ip $container_hostname" >> /etc/hosts

  echo ================================
done



#docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' zookeeper
#
#docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' kafka1
#
#docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' kafka2
#
#docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' kafka3
#
#docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' kafka-manager
#
#docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' schema-registry
#
#docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' rest-proxy
#
#docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' kafka-topics-ui
#
#docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' schema-registry-ui