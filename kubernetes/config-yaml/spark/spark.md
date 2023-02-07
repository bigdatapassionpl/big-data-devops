
* https://spark.apache.org/docs/latest/running-on-kubernetes.html

~~~shell
kubectl create ns spark-jobs

#kubectl config current-context
#kubectl config set-context minikube --namespace=spark-jobs

kubectl create serviceaccount spark -n spark-jobs
kubectl create clusterrolebinding spark-jobs-role --clusterrole=edit --serviceaccount=spark-jobs:spark --namespace=spark-jobs

kubectl cluster-info

export K8S_CLUSTER_NAME=$(kubectl config current-context)
export K8S_CLUSTER=$(kubectl config view -o jsonpath="{.clusters[?(@.name==\"$K8S_CLUSTER_NAME\")].cluster.server}")

#export SPARK_IMAGE="gcr.io/spark-operator/spark:v3.1.1"
#export SPARK_HOME="/Users/radek/programs/spark/spark-3.3.1-bin-hadoop3"
#export SPARK_APP="/Users/radek/programs/spark/spark-3.3.1-bin-hadoop3/examples/jars/spark-examples_2.12-3.3.1.jar"

export SPARK_IMAGE="gcr.io/spark-operator/spark:v3.1.1-hadoop3"
export SPARK_HOME="/Users/radek/programs/spark/spark-3.1.1-bin-hadoop3.2"
export SPARK_APP="/Users/radek/programs/spark/spark-3.1.1-bin-hadoop3.2/examples/jars/spark-examples_2.12-3.1.1.jar"
export SPARK_APP="local:///opt/spark/examples/jars/spark-examples_2.12-3.1.1.jar"
export SPARK_ARGS="10000"

$SPARK_HOME/bin/spark-submit \
    --master k8s://$K8S_CLUSTER \
    --deploy-mode cluster \
    --name spark-pi \
    --class org.apache.spark.examples.SparkPi \
    --conf spark.executor.instances=1 \
    --conf spark.kubernetes.executor.request.cores=1 \
    --conf spark.kubernetes.container.image=$SPARK_IMAGE \
    --conf spark.kubernetes.namespace=spark-jobs \
    --conf spark.kubernetes.authenticate.driver.serviceAccountName=spark \
    $SPARK_APP $SPARK_ARGS

kubectl get pods -n spark-jobs --no-headers=true | awk '/spark-pi/{print $1}' | xargs  kubectl delete -n spark-jobs pod

$SPARK_HOME/bin/spark-shell \
    --master k8s://$K8S_CLUSTER \
    --deploy-mode client \
    --conf spark.kubernetes.container.image=$SPARK_IMAGE \
    --conf spark.kubernetes.namespace=spark-jobs

# JupyterHub version
export K8S_CLUSTER=$KUBERNETES_SERVICE_HOST:$KUBERNETES_SERVICE_PORT
echo $K8S_CLUSTER
export SPARK_IMAGE="gcr.io/spark-operator/spark:v3.1.1"
spark-shell \
    --master k8s://$K8S_CLUSTER \
    --deploy-mode client \
    --driver-memory 1g \
    --executor-memory 1g \
    --num-executors 1 \
    --executor-cores 1 \
    --conf spark.kubernetes.container.image=$SPARK_IMAGE \
    --conf spark.kubernetes.namespace=jupyterhub \
    --conf spark.shuffle.service.enabled=false \
    --conf spark.dynamicAllocation.enabled=false \
    --conf spark.driver.host=10-32-0-14.jupyterhub.pod.cluster.local \
    --conf spark.driver.host=jupyter-radek.jupyterhub.pod.cluster.local \
    --conf spark.blockManager.port=10025 \
    --conf spark.driver.blockManager.port=10026 \
    --conf spark.driver.port=10027

val NUM_SAMPLES=10000
val count = sc.parallelize(1 to NUM_SAMPLES).filter { _ =>
  val x = math.random
  val y = math.random
  x*x + y*y < 1
}.count()
println(s"Pi is roughly ${4.0 * count / NUM_SAMPLES}")

APISERVER=https://kubernetes.default.svc
spark-shell \
  --master k8s://$APISERVER \
  --deploy-mode client \
  -Dcom.sun.net.ssl.checkRevocation=false
~~~