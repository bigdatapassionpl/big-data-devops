#!/usr/bin/env bash

echo "Hostname"
hostnamectl set-hostname $1
hostnamectl set-hostname "Hortonworks Worker Node" --pretty
hostnamectl set-hostname $1 --static
hostnamectl set-hostname $1 --transient

hostnamectl status

hostname

hostname -f