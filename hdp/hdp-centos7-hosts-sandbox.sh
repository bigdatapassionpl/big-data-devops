#!/usr/bin/env bash

echo "Hostname"
hostnamectl set-hostname sandbox.hortonworks.com
hostnamectl status

hostname
hostname -f

cp /etc/hosts > /tmp/hosts
sed '1d' /etc/hosts > /tmp/newhosts1
sed '1d' /tmp/newhosts1 > /tmp/newhosts2
mv /tmp/newhosts2 /etc/hosts

echo -e "\n" >> /etc/hosts
echo "127.0.0.1  sandbox.hortonworks.com" >> /etc/hosts
echo "::1  sandbox.hortonworks.com" >> /etc/hosts
