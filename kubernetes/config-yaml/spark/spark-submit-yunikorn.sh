#!/bin/bash

export K8S_CLUSTER_NAME=$(kubectl config current-context)
echo $K8S_CLUSTER_NAME
export K8S_CLUSTER=$(kubectl config view -o jsonpath="{.clusters[?(@.name==\"$K8S_CLUSTER_NAME\")].cluster.server}")
echo $K8S_CLUSTER

export K8S_CLUSTER="https://5628F91FD08403012543EAF268498B8A.yl4.us-east-1.eks.amazonaws.com"

export SPARK_HOME="/Users/radek/programs/spark/spark-3.5.0-bin-hadoop3"
#export SPARK_IMAGE="gcr.io/spark-operator/spark:v3.1.1-hadoop3"
#export SPARK_APP="local:///opt/spark/examples/jars/spark-examples_2.12-3.1.1.jar"
export SPARK_IMAGE="bigdatapassion/spark:latest"
export SPARK_APP="local:///opt/spark/examples/jars/spark-examples_2.12-3.3.2.jar"

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
    --conf spark.kubernetes.scheduler.name=yunikorn \
    --conf spark.kubernetes.driver.label.queue=root.$K8S_NS \
    --conf spark.kubernetes.executor.label.queue=root.$K8S_NS \
    --conf spark.kubernetes.driver.annotation.yunikorn.apache.org/app-id={{APP_ID}} \
    --conf spark.kubernetes.executor.annotation.yunikorn.apache.org/app-id={{APP_ID}} \
    $SPARK_APP $SPARK_ARGS
