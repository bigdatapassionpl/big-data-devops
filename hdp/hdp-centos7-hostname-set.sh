#!/usr/bin/env bash

echo "Hostname"
hostnamectl set-hostname $1
hostnamectl set-hostname "Hortonworks Data Platform Node" --pretty
hostnamectl set-hostname $1 --static
hostnamectl set-hostname $1 --transient

echo
hostnamectl status

echo
hostname

echo
hostname -f

echo
hostname -s

echo
cat /etc/hosts

echo
cat /etc/sysconfig/network

echo
cat /etc/oci-hostname.conf