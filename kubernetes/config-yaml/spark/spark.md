
* https://spark.apache.org/docs/latest/running-on-kubernetes.html

~~~shell
kubectl create ns spark-jobs

kubectl config current-context
kubectl config set-context minikube --namespace=spark-jobs

kubectl cluster-info

kubectl create serviceaccount spark -n spark-jobs
kubectl create clusterrolebinding spark-jobs-role --clusterrole=edit --serviceaccount=spark-jobs:spark --namespace=spark-jobs

export K8S_CLUSTER="https://127.0.0.1:51239"
export SPARK_IMAGE="gcr.io/spark-operator/spark:v3.1.1"
export SPARK_HOME="/Users/radek/programs/spark/spark-3.3.1-bin-hadoop3"
export SPARK_APP="local:///opt/spark/examples/jars/spark-examples_2.12-3.1.1.jar"

$SPARK_HOME/bin/spark-submit \
    --master k8s://$K8S_CLUSTER \
    --deploy-mode cluster \
    --name spark-pi \
    --class org.apache.spark.examples.SparkPi \
    --conf spark.executor.instances=5 \
    --conf spark.kubernetes.container.image=$SPARK_IMAGE \
    --conf spark.kubernetes.namespace=spark-jobs \
    --conf spark.kubernetes.authenticate.driver.serviceAccountName=spark \
    $SPARK_APP
~~~