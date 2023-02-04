
~~~shell

kubectl port-forward svc/yunikorn-service 9889:9889 -n yunikorn

kubectl apply -f yunikorn/spark/yunikorn-spark-ns.yaml
kubectl apply -f yunikorn/spark/yunikorn-spark-role.yaml

export K8S_CLUSTER="https://127.0.0.1:51239"
export SPARK_IMAGE="gcr.io/spark-operator/spark:v3.1.1"
export SPARK_HOME="/Users/radek/programs/spark/spark-3.3.1-bin-hadoop3"
export SPARK_APP="local:///opt/spark/examples/jars/spark-examples_2.12-3.1.1.jar"

${SPARK_HOME}/bin/spark-submit \
    --master k8s://$K8S_CLUSTER \
    --deploy-mode cluster \
    --name spark-pi \
    --class org.apache.spark.examples.SparkPi \
    --conf spark.executor.instances=1 \
    --conf spark.kubernetes.namespace=spark-test \
    --conf spark.kubernetes.executor.request.cores=1 \
    --conf spark.kubernetes.container.image=apache/yunikorn:spark-2.4.4 \
    --conf spark.kubernetes.authenticate.driver.serviceAccountName=spark \
    local:///opt/spark/examples/jars/spark-examples_2.11-2.4.4.jar 10000
~~~