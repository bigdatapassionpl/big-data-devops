#!/bin/bash

export K8S_CONTEXT=$(kubectl config current-context)
echo $K8S_CONTEXT
export K8S_CLUSTER_NAME=$(kubectl config view -o jsonpath="{.contexts[?(@.name==\"$K8S_CONTEXT\")].context.cluster}")
echo $K8S_CLUSTER_NAME
export K8S_CLUSTER=$(kubectl config view -o jsonpath="{.clusters[?(@.name==\"$K8S_CLUSTER_NAME\")].cluster.server}")
echo $K8S_CLUSTER

export SPARK_HOME="/Users/radek/programs/spark/spark-3.5.0-bin-hadoop3"
export SPARK_IMAGE="bigdatapassion/spark:3.5.0-bin-hadoop3"
export SPARK_APP="local:///opt/spark/examples/examples/jars/spark-examples_2.12-3.5.0.jar"

export K8S_ID=$1
export K8S_NS=$2
export SPARK_EXECUTORS=$3
export SPARK_ARGS=$4

export CORES=500m
export MEMORY=1g

$SPARK_HOME/bin/spark-submit \
    --master k8s://$K8S_CLUSTER \
    --deploy-mode cluster \
    --name "spark-pi-$K8S_ID" \
    --class org.apache.spark.examples.SparkPi \
    --conf spark.kubernetes.submission.waitAppCompletion=false \
    --conf spark.kubernetes.driver.service.deleteOnTermination=true \
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
