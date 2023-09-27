#!/bin/bash

export K8S_CLUSTER_NAME=$(kubectl config current-context)
echo $K8S_CLUSTER_NAME
export K8S_CLUSTER=$(kubectl config view -o jsonpath="{.clusters[?(@.name==\"$K8S_CLUSTER_NAME\")].cluster.server}")
echo $K8S_CLUSTER

#kubectl get pods -n k8s-jobs --no-headers=true | awk '/spark-pi/{print $1}' | xargs  kubectl delete -n k8s-jobs pod

export SPARK_HOME="/Users/radek/programs/spark/spark-3.5.0-bin-hadoop3"
export SPARK_IMAGE="gcr.io/spark-operator/spark:v3.1.1-hadoop3"
export SPARK_APP="local:///opt/spark/examples/jars/spark-examples_2.12-3.1.1.jar"
export SPARK_ARGS="100000"
export SPARK_EXECUTORS=7

export K8S_NS=k8s-jobs

$SPARK_HOME/bin/spark-submit \
    --master k8s://$K8S_CLUSTER \
    --deploy-mode cluster \
    --name spark-pi \
    --class org.apache.spark.examples.SparkPi \
    --conf spark.executor.instances=$SPARK_EXECUTORS \
    --conf spark.driver.memory=1g \
    --conf spark.executor.memory=1g \
    --conf spark.kubernetes.executor.request.cores=1 \
    --conf spark.kubernetes.container.image=$SPARK_IMAGE \
    --conf spark.kubernetes.namespace=$K8S_NS \
    --conf spark.kubernetes.authenticate.driver.serviceAccountName=spark \
    --conf spark.kubernetes.scheduler.name=yunikorn \
    --conf spark.kubernetes.driver.label.queue=root.$K8S_NS \
    --conf spark.kubernetes.executor.label.queue=root.$K8S_NS \
    --conf spark.kubernetes.driver.annotation.yunikorn.apache.org/app-id={{APP_ID}} \
    --conf spark.kubernetes.executor.annotation.yunikorn.apache.org/app-id={{APP_ID}} \
    $SPARK_APP $SPARK_ARGS
