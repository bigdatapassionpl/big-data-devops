#!/bin/bash

export K8S_CLUSTER_NAME=$(kubectl config current-context)
echo $K8S_CLUSTER_NAME
export K8S_CLUSTER=$(kubectl config view -o jsonpath="{.clusters[?(@.name==\"$K8S_CLUSTER_NAME\")].cluster.server}")
echo $K8S_CLUSTER

export K8S_CLUSTER="https://2BB517F48032BC9BC992634C587CD6D1.gr7.us-east-1.eks.amazonaws.com"

export SPARK_HOME="/Users/radek/programs/spark/spark-3.5.0-bin-hadoop3"
export SPARK_IMAGE="gcr.io/spark-operator/spark:v3.1.1-hadoop3"
export SPARK_APP="local:///opt/spark/examples/jars/spark-examples_2.12-3.1.1.jar"

export K8S_NS=$1
export SPARK_EXECUTORS=$2
export SPARK_ARGS=$3

export CORES=500m
export CORES=1
export MEMORY=1g

$SPARK_HOME/bin/spark-submit \
    --master k8s://$K8S_CLUSTER \
    --deploy-mode cluster \
    --name spark-pi \
    --class org.apache.spark.examples.SparkPi \
    --conf spark.kubernetes.submission.waitAppCompletion=false \
    --conf spark.executor.instances=$SPARK_EXECUTORS \
    --conf spark.driver.memory=$MEMORY \
    --conf spark.executor.memory=$MEMORY \
    --conf spark.kubernetes.driver.request.cores=$CORES \
    --conf spark.kubernetes.driver.request.limit.cores=$CORES \
    --conf spark.kubernetes.executor.request.cores=$CORES \
    --conf spark.kubernetes.executor.request.limit.cores=$CORES \
    --conf spark.kubernetes.container.image=$SPARK_IMAGE \
    --conf spark.kubernetes.namespace=$K8S_NS \
    --conf spark.kubernetes.authenticate.driver.serviceAccountName=spark \
    $SPARK_APP $SPARK_ARGS
