
~~~shell
curl -o yunikorn/queues.yaml https://github.com/apache/yunikorn-k8shim/blob/master/deployments/examples/namespace/queues.yaml

kubectl port-forward svc/yunikorn-service 9889:9889 -n yunikorn

kubectl apply -f yunikorn/spark/yunikorn-spark-ns.yaml
kubectl apply -f yunikorn/spark/yunikorn-spark-role.yaml

export K8S_CLUSTER_NAME=$(kubectl config current-context)
export K8S_CLUSTER=$(kubectl config view -o jsonpath="{.clusters[?(@.name==\"$K8S_CLUSTER_NAME\")].cluster.server}")

export SPARK_IMAGE="gcr.io/spark-operator/spark:v3.1.1"
export SPARK_HOME="/Users/radek/programs/spark/spark-3.3.1-bin-hadoop3"
export SPARK_APP="local:///opt/spark/examples/jars/spark-examples_2.12-3.1.1.jar"

${SPARK_HOME}/bin/spark-submit \
    --master k8s://$K8S_CLUSTER \
    --deploy-mode cluster \
    --name spark-pi \
    --class org.apache.spark.examples.SparkPi \
    --conf spark.executor.instances=10 \
    --conf spark.kubernetes.namespace=spark-test \
    --conf spark.kubernetes.executor.request.cores=1 \
    --conf spark.kubernetes.container.image=apache/yunikorn:spark-2.4.4 \
    --conf spark.kubernetes.authenticate.driver.serviceAccountName=spark \
    --conf spark.kubernetes.scheduler.name=yunikorn \
    --conf spark.kubernetes.driver.label.queue=root.default \
    --conf spark.kubernetes.executor.label.queue=root.default \
    --conf spark.kubernetes.driver.annotation.yunikorn.apache.org/app-id= \
    --conf spark.kubernetes.executor.annotation.yunikorn.apache.org/app-id= \
    local:///opt/spark/examples/jars/spark-examples_2.11-2.4.4.jar 10000

kubectl get pods -n spark-test --no-headers=true | awk '/spark-pi/{print $1}' | xargs  kubectl delete -n spark-test pod
~~~