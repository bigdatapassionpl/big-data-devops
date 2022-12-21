
* https://spark.apache.org/docs/latest/running-on-kubernetes.html

~~~shell
export HELM_REPO_NAME=spark-operator
export HELM_REPO_URL=https://googlecloudplatform.github.io/spark-on-k8s-operator
export HELM_CHART=spark-operator
export HELM_CHART_VERSION=1.1.26

kubectl apply -f spark-operator/jobs/spark-pi.yaml

kubectl get sparkapplications --all-namespaces

kubectl get sparkapplications spark-pi -n spark-operator
kubectl get sparkapplications spark-pi -o=yaml -n spark-operator

kubectl describe sparkapplication spark-pi -n spark-operator
kubectl delete sparkapplication spark-pi -n spark-operator
~~~