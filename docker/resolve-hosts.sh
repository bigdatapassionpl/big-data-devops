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

  sed "/$container_hostname/d" /etc/hosts > /tmp/newhosts
  cp /tmp/newhosts /etc/hosts

  echo "$container_ip $container_hostname" >> /etc/hosts

  echo ================================
done
