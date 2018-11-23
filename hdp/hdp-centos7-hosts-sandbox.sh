#!/usr/bin/env bash

echo "Hostname"
hostnamectl set-hostname sandbox.hortonworks.com
hostnamectl set-hostname "Hortonworks Worker Node" --pretty
hostnamectl set-hostname sandbox.hortonworks.com --static
hostnamectl set-hostname sandbox.hortonworks.com --transient

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

echo -e "\n" >> /etc/sysconfig/network
echo "NETWORKING=yes" >> /etc/sysconfig/network
echo "HOSTNAME=sandbox.hortonworks.com" >> /etc/sysconfig/network