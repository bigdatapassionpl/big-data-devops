#!/usr/bin/env bash

aws emr create-cluster \
  --name 'EMR Spark Cluster' \
  --auto-scaling-role EMR_AutoScaling_DefaultRole \
  --applications Name=Spark \
  --ebs-root-volume-size 10 \
  --ec2-attributes file://emr-ec2-attributes.json \
  --service-role EMR_DefaultRole \
  --enable-debugging \
  --release-label emr-5.31.0 \
  --log-uri 's3n://aws-logs-109824097611-us-east-1/elasticmapreduce/' \
  --instance-groups file://emr-instance-groups.json \
  --region us-east-1 \
  --profile default \
  --scale-down-behavior TERMINATE_AT_TASK_COMPLETION \
  --steps file://emr-steps.json