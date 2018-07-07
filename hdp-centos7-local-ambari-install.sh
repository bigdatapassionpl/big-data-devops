#!/usr/bin/env bash

wget -nv http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.6.2.2/ambari.repo -O /etc/yum.repos.d/ambari.repo

wget -nv http://public-repo-1.hortonworks.com/HDP/centos7/2.x/updates/2.6.5.0/hdp.repo -O /etc/yum.repos.d/hdp.repo

yum repolist
yum update


yum install ambari-server -y


ambari-server setup


ambari-server start