#!/usr/bin/env bash

aws emr create-cluster \
  --name 'EMR Cluster' \
  --auto-scaling-role EMR_AutoScaling_DefaultRole \
  --applications Name=Hive Name=Hue Name=Hadoop Name=JupyterHub Name=JupyterEnterpriseGateway Name=Zeppelin Name=Oozie Name=Tez Name=Spark Name=Livy Name=Ganglia Name=Presto \
  --configurations file://emr-configurations.json \
  --ebs-root-volume-size 15 \
  --ec2-attributes file://emr-ec2-attributes.json \
  --service-role EMR_DefaultRole \
  --enable-debugging \
  --release-label emr-6.6.0 \
  --log-uri 's3n://aws-logs-434239389032-us-east-1/elasticmapreduce/' \
  --instance-groups file://emr-instance-groups.json \
  --region us-east-1 \
  --profile default \
  --scale-down-behavior TERMINATE_AT_TASK_COMPLETION \
  --steps file://emr-steps.json