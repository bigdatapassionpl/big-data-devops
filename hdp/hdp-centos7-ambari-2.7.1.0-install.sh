#!/usr/bin/env bash

wget -nv http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.7.1.0/ambari.repo -O /etc/yum.repos.d/ambari.repo

yum repolist
yum update

yum install ambari-server -y

ambari-server setup

ambari-server start