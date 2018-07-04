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


systemctl disable firewalld
systemctl stop firewalld
systemctl status firewalld
systemctl disable firewalld.service
systemctl stop firewalld.service
systemctl status firewalld.service


yum install -y ntp
systemctl disable chrony.service
systemctl enable ntpd
systemctl start ntpd
systemctl status ntpd
systemctl enable ntpd.service
systemctl is-enabled ntpd.service
systemctl start ntpd.service
systemctl status ntpd.service


umask 022
echo umask 022 >> ~/.bash_profile
echo umask 022 >> /etc/profile