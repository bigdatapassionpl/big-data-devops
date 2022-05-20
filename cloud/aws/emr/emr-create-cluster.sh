#!/usr/bin/env bash

aws emr create-cluster \
  --name 'EMR Spark Cluster' \
  --auto-scaling-role EMR_AutoScaling_DefaultRole \
  --applications Name=Spark \
  --ebs-root-volume-size 10 \
  --ec2-attributes '{"KeyName":"vockey","InstanceProfile":"EMR_EC2_DefaultRole","SubnetId":"subnet-1451ea4b","EmrManagedSlaveSecurityGroup":"sg-08f208da5bc56f56c","EmrManagedMasterSecurityGroup":"sg-0151288ddcff4e6a2"}' \
  --service-role EMR_DefaultRole \
  --enable-debugging \
  --release-label emr-5.31.0 \
  --log-uri 's3n://aws-logs-109824097611-us-east-1/elasticmapreduce/' \
  --steps file://emr-steps.json \
  --instance-groups file://emr-instance-groups.json \
  --scale-down-behavior TERMINATE_AT_TASK_COMPLETION \
  --region us-east-1 \
  --profile default