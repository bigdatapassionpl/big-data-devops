#!/usr/bin/env bash

echo "Hostname"
hostnamectl set-hostname sandbox.hortonworks.com
hostnamectl status
hostname
hostname -f
echo -e "\n" >> /etc/hosts
echo "127.0.0.1  sandbox.hortonworks.com" >> /etc/hosts
