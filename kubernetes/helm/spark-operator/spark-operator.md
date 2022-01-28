
* https://spark.apache.org/docs/latest/running-on-kubernetes.html

~~~shell
helm repo add spark-operator https://googlecloudplatform.github.io/spark-on-k8s-operator

helm repo update
helm search repo spark-operator

helm show values spark-operator/spark-operator > spark-operator/values-default.yaml

time helm upgrade spark-operator spark-operator/spark-operator \
  --install \
  --timeout 10m \
  --cleanup-on-fail \
  --create-namespace \
  --namespace spark-operator \
  --values spark-operator/values.yaml

helm get notes spark-operator -n spark-operator > spark-operator/note.txt
  
helm delete spark-operator --namespace spark-operator
~~~