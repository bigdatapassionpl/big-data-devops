#!/usr/bin/env bash

yum -y update
yum -y upgrade

yum install -y wget

yum install -y epel-release

yum -y install wget vim htop ntp openssh-server openssh-clients nano bash-completion tree