
# JupyterHub version

~~~shell

export K8S_CLUSTER=$KUBERNETES_SERVICE_HOST:$KUBERNETES_SERVICE_PORT
echo $K8S_CLUSTER

SPARK_DRIVER_HOST="$(echo `hostname -I` | sed -e "s/\./-/g").jupyterhub.pod.cluster.local"
echo $SPARK_DRIVER_HOST

#export SPARK_IMAGE="gcr.io/spark-operator/spark:v3.1.1"
export SPARK_IMAGE="docker.io/bigdatapassion/spark:latest"

export NAMESPACE=k8s-jobs
#export NAMESPACE=jupyterhub

spark-shell \
    --master k8s://$K8S_CLUSTER \
    --deploy-mode client \
    --driver-memory 1g \
    --executor-memory 1g \
    --num-executors 2 \
    --executor-cores 1 \
    --conf spark.kubernetes.container.image=$SPARK_IMAGE \
    --conf spark.kubernetes.namespace=$NAMESPACE \
    --conf spark.driver.host=$SPARK_DRIVER_HOST

# Additional params
    --conf spark.shuffle.service.enabled=false \
    --conf spark.dynamicAllocation.enabled=false \
    --conf spark.blockManager.port=10025 \
    --conf spark.driver.blockManager.port=10026 \
    --conf spark.driver.port=10027

~~~


~~~scala
val NUM_SAMPLES=1000
val count = sc.parallelize(1 to NUM_SAMPLES).filter { _ =>
  val x = math.random
  val y = math.random
  x*x + y*y < 1
}.count()
println(s"Pi is roughly ${4.0 * count / NUM_SAMPLES}")
~~~