#!/usr/bin/env bash

yum -y update
yum -y upgrade

yum install -y wget

yum install -y epel-release

yum -y install wget vim htop ntp openssh-server openssh-clients nano bash-completion tree

hostnamectl set-hostname sandbox.hortonworks.com
hostnamectl status
hostname
hostname -f

echo "\n127.0.0.1   sandbox sandbox.hortonworks.com" >> /etc/hosts

ssh-keygen -f id_rsa -t rsa -N ''
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys


sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
setenforce 0
sestatus