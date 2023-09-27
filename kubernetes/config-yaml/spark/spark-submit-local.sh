#!/bin/bash

export SPARK_HOME="/Users/radek/programs/spark/spark-3.5.0-bin-hadoop3"
export SPARK_APP="${SPARK_HOME}/examples/jars/spark-examples_2.12-3.5.0.jar"
export SPARK_ARGS="100"

$SPARK_HOME/bin/spark-submit \
    --master local \
    --deploy-mode client \
    --name spark-pi \
    --class org.apache.spark.examples.SparkPi \
    --conf spark.executor.instances=1 \
    $SPARK_APP $SPARK_ARGS
