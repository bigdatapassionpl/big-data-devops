#!/usr/bin/env bash

systemctl disable firewalld

iptables -S

iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

for e in `cat white-list.txt` ; do iptables -I INPUT -s ${e} -j ACCEPT; done

for f in `grep horton  /etc/hosts|awk '{ print $1 }'`; do iptables -I INPUT -s ${f} -j ACCEPT; done

iptables -A INPUT -p tcp  --dport 22 -j  ACCEPT

iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

iptables -S