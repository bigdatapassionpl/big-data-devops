#!/usr/bin/env bash

profile=$1
echo "profile: $profile"

aws ec2 describe-instances --query "Reservations[*].Instances[*].[PublicDnsName,PublicIpAddress,PrivateDnsName,PrivateIpAddress]" --output table  --profile $profile

sudo sed '/compute.internal/d' /etc/hosts > /tmp/newhosts
sudo cp /tmp/newhosts /etc/hosts
aws ec2 describe-instances --query "Reservations[*].Instances[*].[PublicIpAddress,PrivateDnsName]" --output text  --profile $profile > /tmp/aws-hosts
sudo sh -c 'cat /tmp/aws-hosts | grep -v None >> /etc/hosts'
