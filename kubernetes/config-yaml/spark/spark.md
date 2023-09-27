
* https://spark.apache.org/docs/latest/running-on-kubernetes.html


~~~shell
ls -lah /var/run/secrets/kubernetes.io/serviceaccount/
cat /var/run/secrets/kubernetes.io/serviceaccount/token

#kubectl create ns k8s-jobs
#kubectl config current-context
#kubectl config set-context minikube --namespace=k8s-jobs
#kubectl create serviceaccount spark -n k8s-jobs
#kubectl create clusterrolebinding k8s-jobs-role --clusterrole=edit --serviceaccount=k8s-jobs:spark --namespace=k8s-jobs
#kubectl create clusterrolebinding jovyan-edit --clusterrole=edit --serviceaccount=jupyterhub:jovyan --namespace=jupyterhub

kubectl cluster-info

export K8S_CLUSTER_NAME=$(kubectl config current-context)
echo $K8S_CLUSTER_NAME
export K8S_CLUSTER=$(kubectl config view -o jsonpath="{.clusters[?(@.name==\"$K8S_CLUSTER_NAME\")].cluster.server}")
echo $K8S_CLUSTER

#export SPARK_IMAGE="gcr.io/spark-operator/spark:v3.1.1"
#export SPARK_HOME="/Users/radek/programs/spark/spark-3.3.1-bin-hadoop3"

kubectl get pods -n k8s-jobs --no-headers=true | awk '/spark-pi/{print $1}' | xargs  kubectl delete -n k8s-jobs pod

export SPARK_HOME="/Users/radek/programs/spark/spark-3.5.0-bin-hadoop3"
export SPARK_IMAGE="gcr.io/spark-operator/spark:v3.1.1-hadoop3"
export SPARK_APP="local:///opt/spark/examples/jars/spark-examples_2.12-3.1.1.jar"
export SPARK_ARGS="10000"
export SPARK_EXECUTORS=10

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
    --conf spark.kubernetes.namespace=k8s-jobs \
    --conf spark.kubernetes.authenticate.driver.serviceAccountName=spark \
    $SPARK_APP $SPARK_ARGS



$SPARK_HOME/bin/spark-shell \
    --master k8s://$K8S_CLUSTER \
    --deploy-mode client \
    --conf spark.kubernetes.container.image=$SPARK_IMAGE \
    --conf spark.kubernetes.namespace=k8s-jobs

~~~