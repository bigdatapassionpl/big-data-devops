
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
  --set image.tag=v1beta2-1.3.2-3.1.1 \
  --set image.repository=ghcr.io/googlecloudplatform/spark-operator \
  --values spark-operator/values.yaml

helm delete spark-operator --namespace spark-operator


kubectl get sparkapplications --all-namespaces

kubectl get sparkapplications spark-pi -n spark-operator
kubectl get sparkapplications spark-pi -o=yaml -n spark-operator

kubectl describe sparkapplication spark-pi -n spark-operator
kubectl delete sparkapplication spark-pi -n spark-operator
~~~