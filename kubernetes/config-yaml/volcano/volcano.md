
~~~
kubectl apply -f https://raw.githubusercontent.com/volcano-sh/volcano/master/installer/volcano-development.yaml
kubectl apply -f https://raw.githubusercontent.com/volcano-sh/volcano/master/installer/volcano-monitoring-latest.yaml

kubectl cluster-info

kubectl create serviceaccount spark
kubectl create clusterrolebinding spark-role --clusterrole=edit --serviceaccount=default:spark --namespace=default


export K8S_CLUSTER="https://127.0.0.1:49733"
export SPARK_IMAGE="gcr.io/spark-operator/spark:v3.1.1"
export SPARK_HOME="/Users/radek/programs/spark/spark-3.3.1-bin-hadoop3"
export SPARK_APP=""local:///opt/spark/examples/jars/spark-examples_2.12-3.1.1.jar""

$SPARK_HOME/bin/spark-submit \
    --master k8s://$K8S_CLUSTER \
    --deploy-mode cluster \
    --name spark-pi \
    --class org.apache.spark.examples.SparkPi \
    --conf spark.executor.instances=5 \
    --conf spark.kubernetes.container.image=$SPARK_IMAGE \
    --conf spark.kubernetes.authenticate.driver.serviceAccountName=spark \
    $SPARK_APP


~~~